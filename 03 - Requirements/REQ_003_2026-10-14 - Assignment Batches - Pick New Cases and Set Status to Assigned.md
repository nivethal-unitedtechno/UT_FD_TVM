# 03 - Req - 2026-10-14 - Assignment Batches - Pick New Cases and Set Status to Assigned

| Item | Value |
|---|---|
| Date | 2026-10-14 |
| Status | **Plan only. Waiting for approval. No code has been changed.** |
| Org | FD - TVM Sandbox. Alias `FD - TVM Sandbox`, Org ID `00DVa000006Eh6TMAS`, `https://teamvelocity--fullsando.sandbox.my.salesforce.com` (verified with `sf org display`) |
| Components | `CaseAssignmentBatch`, `CaseAssignmentHybridBatch` (Apex batch classes) and their test classes |
| Source reviewed | `force-app/main/default/classes/CaseAssignmentBatch.cls` and `CaseAssignmentHybridBatch.cls`, retrieved from the sandbox on 2026-10-14 (last modified in the org on 2026-10-04) |

---

## 1. Requirement

For **`CaseAssignmentBatch`** (Non-Hybrid) and **`CaseAssignmentHybridBatch`** (Hybrid), and only for routing rules with **Case Entry = Auto**:

1. **Entry condition.** The batch picks up a Case only when:
   ```
   (Case_Category__c = 'New Digital Support' OR Foundation_Record__c = TRUE)
   AND
   Status_Filtered__c = 'New'
   ```
2. **On assignment.** When the batch sets **Case Assign To** (`Case_Assign_To__c`) and **Owner** (`OwnerId`) to a user, it also sets **`Status_Filtered__c = 'Assigned'`**.

## 2. Current behaviour (from the retrieved code)

| | `CaseAssignmentBatch` | `CaseAssignmentHybridBatch` |
|---|---|---|
| Start query filters | `Case_Assign_To__c = null`, `Case_Assignment_Queue__c != null`, `CreatedDate = TODAY`, `(Foundation_Record__c = TRUE OR Case_Category__c = 'New Digital Support')`, `Account.FNDN_Billed_Through_TVM__c = false` | Same filters, but `Account.FNDN_Billed_Through_TVM__c = TRUE` |
| Status filter | **None.** Status is selected but not filtered. | **None** |
| Routing rules used | `Case_Routing_Config__mdt` where `Case_Entry__c = 'Auto'`, `Active__c = true`, `Case_Type__c = 'Non Hybrid'` | Same, but `Case_Type__c = 'Hybrid'` |
| Assignment | Round-robin across queue members for rules with `Initial_Assignment__c = 'Queue'`. Two branches: last-assigned user found (line 145–146), or not found (line 160–161) | Round-robin, a single branch (line 117–118) |
| Status change | **None.** The status stays `New`. | **None** |
| DML | `UPDATE listCases`, which saves **every** Case in the scope, assigned or not | `update listCases`, same |
| Schedule | `ScheduleCaseAssignmentBatch` runs both batches with a batch size of 200. A scheduled job named `CaseAssignmentBatch` runs **every hour at :30** (`0 30 * * * ?`, state WAITING) | (same scheduler) |

**Data check (read-only count, last 30 days).** These are queued Foundation and New Digital Support Cases. Most have stayed `New` after assignment, which is the gap this requirement closes:

| Hybrid | Status | Count |
|---|---|---|
| false | New | 1,188 |
| false | Ready for QA | 14 |
| false | Assigned | 3 |
| false | Future | 2 |
| true | New | 448 |

## 3. Scope

**In scope**
- In both batches: add `AND Status_Filtered__c = 'New'` to the `start()` query.
- In both batches: set `Status_Filtered__c = 'Assigned'` wherever the code sets `Case_Assign_To__c` and `OwnerId`. That is two places in `CaseAssignmentBatch` and one in `CaseAssignmentHybridBatch`.
- Update `CaseAssignmentBatchTest` and `CaseAssignmentHybridBatchTest`.

**Out of scope (no change)**
- `CalculateCaseDueDate`, `CaseTrigger_FNDN`, `ScheduleCaseAssignmentBatch`, and the schedule itself.
- Routing metadata (`Case_Routing_Config__mdt`) and the round-robin logic.
- Manual Case Entry. The batches already load only Auto rules, so Manual cases are never assigned or given a new status by the batches.
- Flows.
- The other status fields (`Status`, `FD_Status__c`, `Status_CS__c`, and so on). The flow `Case_Updated_Before_Save` already copies `Status_Filtered__c` into them (see section 4).

## 4. Impact analysis

### 4.1 Field and picklist (verified in the org)
- `Case.Status_Filtered__c` (label "Case Status") is a **picklist**, **not restricted**, and **dependent on `Case_Category__c`**.
- `New` and `Assigned` are both active, and both are valid for these categories: Advid Creative, Data_Support, Digital_Support, **New Digital Support**, General Support, OEM, Production Support, SEO, Digital SD.
- `Assigned` is **not** valid for the categories **Digital OEM, Digital Reporting, Platform Requests, Website Analytics**. If a Foundation Case in one of those categories is assigned by a batch, it will get a status that its category does not allow. The field is not restricted, so the save won't fail, but the value will look wrong in the UI. **Please confirm whether Foundation Cases can have these categories.**

### 4.2 Automation that runs when the batch saves a Case (active versions inspected)

| Component | Type | Effect of the new `New → Assigned` change |
|---|---|---|
| `Case_Updated_Before_Save` (v15) | Flow, before save, update | Runs because `Status_Filtered__c` changed. It copies the value into `Status`, `FD_Status__c`, `Status_CS__c`, `Status_Digital__c`, `Status_General__c` and `Status_Production__c`. **Expected: all status fields become Assigned.** The standard `Status` field has `Assigned` as a value. |
| `Dynamic_Hours_Calculation` (v4) | Flow, after save, gated on Foundation | **New behaviour:** when the prior status is `New` and the new one is `Assigned`, it runs `Store_the_Unassigned_hours`. Today this never happens from the batches. This looks like the intended effect, so please confirm. |
| `Case_Updated` (v437, active) | Flow, after save, update | Foundation Cases stop at `Testing_Decision` (rule `Terminate_Flow`), so there is no effect. **New Digital Support Cases that are not Foundation** continue. Today they already reach `Was_the_Case_Owner_changed_to_a_User`, which sets the status to Assigned through `Case_Status_Subflow`, but **only when `Status` did not change**. After the change, `Status` changes in the same save, so that step is skipped. The result is the same (Assigned), with no double update. |
| `Email_alert_when_case_assign_to_changed_status_completed` (v5) | Flow, after save, gated on Foundation | It already emails when the owner changes, and that is unchanged. The "Future → Assigned" email does not fire, because the prior status is `New`. |
| `Case_Assignment_Process` (v10) | Flow, before save, gated on Foundation | Acts only on `Ready for QA` and `Closed`. No effect. |
| `Cases_disposition` | Flow | Only for `Origin = Email` with subcategory or request changes. No effect. |
| `CaseTrigger_FNDN` → `CalculateCaseDueDate` | Apex trigger | Before update: `calculateCaseDueDate` acts only on `Future` statuses. `onBeforeUpdate` acts only on a category change to New Digital Support or on Ready for QA. After update: `afterUpdateCases` covers Performance Review only. `Th_CaseTrigger.onAfterUpdate` has no status logic. **No effect.** |
| `CaseTrigger` → `CaseTriggerHelper`, `CaseOOOAssignmentHandler` | Apex | No `Status_Filtered__c` or `Assigned` logic. No effect. |

### 4.3 Behaviour changes to be aware of
1. **Cases that are not `New` will no longer be auto-assigned.** In the last 30 days, 2 queued Non-Hybrid Cases were `Future`, 14 were `Ready for QA` and 3 were `Assigned`. After the change, the batch skips any unassigned ones. This follows the requirement, but **please confirm it is intended**, especially for `Future` Cases.
2. **The batch runs every hour on Cases created today.** If a user changes the status away from `New` before :30, the batch skips that Case.
3. **"Case Entry = Auto" is applied through the routing rule, not the query.** The start query can't join to custom metadata, so a Case whose request type has no Auto rule is still read. It is not assigned and keeps `New`.
4. **`UPDATE listCases` saves unchanged Cases too** (existing behaviour). Every Case in scope fires the flows above, even when nothing changed. See decision D3.

## 5. Proposed approach

### 5.1 `CaseAssignmentBatch`
**Start query.** Add the status filter. Nothing else changes:
```apex
String query = 'SELECT OwnerId, Case_Assign_To__c, Case_Assignment_Queue__c, Case_Request__c, Status_Filtered__c FROM Case'
             + ' WHERE Case_Assign_To__c = null AND Case_Assignment_Queue__c != null AND CreatedDate = TODAY'
             + ' AND (Foundation_Record__c = TRUE OR Case_Category__c = \'New Digital Support\')'
             + ' AND Status_Filtered__c = \'New\''
             + ' AND Account.FNDN_Billed_Through_TVM__c = false';
```
**Assignment.** Add one line to **both** branches, right after `OwnerId` is set (current lines 145–146 and 160–161):
```apex
objCase.Case_Assign_To__c = userIds[nextUserIndex];
objCase.OwnerId = userIds[nextUserIndex];
objCase.Status_Filtered__c = 'Assigned';
```

### 5.2 `CaseAssignmentHybridBatch`
**Start query.** Add `'AND Status_Filtered__c = \'New\' ' +` to the WHERE clause.
**Assignment.** Add one line after the current lines 117–118:
```apex
c.OwnerId = userIds[nextUserIndex];
c.Case_Assign_To__c = userIds[nextUserIndex];
c.Status_Filtered__c = 'Assigned';
```

### 5.3 Notes
- No new SOQL or DML, and nothing inside loops. Bulk behaviour is unchanged.
- The value `'Assigned'` would be kept as a `private static final String` constant in each class, matching the `FND_STATUS_*` style in `CalculateCaseDueDate`.
- Only `Status_Filtered__c` is set. `Case_Updated_Before_Save` keeps the other status fields in sync.

## 6. Test plan

Add to `CaseAssignmentBatchTest` and `CaseAssignmentHybridBatchTest`:

| # | Scenario | Expected result |
|---|---|---|
| 1 | `New` Foundation Case, Auto rule with Queue | `Case_Assign_To__c` and `OwnerId` are set, and `Status_Filtered__c = 'Assigned'` |
| 2 | Same, but a New Digital Support Case with `Foundation_Record__c = false` | Assigned, and status `Assigned` |
| 3 | Case with `Status_Filtered__c = 'Future'` or `'In Progress'` | Not assigned, and status unchanged |
| 4 | Request type with **no** Auto rule (Manual only) | Not assigned, and status stays `New` |
| 5 | Queue with no members | Not assigned, and status stays `New` |
| 6 | Bulk: 200 `New` Cases, 2 queue users | All are `Assigned` and round-robin still spreads them across both users |
| 7 | Non-Hybrid batch does not pick Hybrid Account Cases, and the reverse | Each batch touches only its own accounts |
| 8 | Regression | Existing tests pass: `CaseAssignmentBatchTest`, `CaseAssignmentHybridBatchTest`, `ScheduleCaseAssignmentBatchTest` |

**Manual sandbox check:** create a Foundation Case with an Auto + Queue request type and wait for the :30 run, or run `Database.executeBatch(new CaseAssignmentBatch(), 200)` in Anonymous Apex in the sandbox. Then check:
- the Owner and Case Assign To are a queue member
- Case Status is `Assigned`, and `Status` and `FD_Status__c` are synced
- the unassigned hours were recorded by `Dynamic_Hours_Calculation`

## 7. Assumptions and unverified items

- **Flows reviewed:** active versions of `Case_Updated` (v437), `Case_Updated_Before_Save` (v15), `Dynamic_Hours_Calculation` (v4), `Email_alert_when_case_assign_to_changed_status_completed` (v5) and `Case_Assignment_Process` (v10), all read from the org. The other 32 active Case flows were scanned for `Status_Filtered__c` and `Assigned` in their latest version, not their active version.
- **Scheduled job:** the hourly job is named `CaseAssignmentBatch`. I assumed it runs `ScheduleCaseAssignmentBatch`; the class behind the job was not checked.
- **Category check:** whether any Foundation Case can have a category where `Assigned` is not a valid value (section 4.1) was not checked.
- **API names:** `Status_Filtered__c`, `Case_Assign_To__c`, `Case_Assignment_Queue__c`, `Case_Category__c`, `Foundation_Record__c`, `FNDN_Billed_Through_TVM__c` and `Case_Routing_Config__mdt.Case_Entry__c`. All were checked against the org describe and the retrieved code.

## 8. Decisions needed

- [ ] **D1.** Approve the approach in section 5.
- [ ] **D2.** Confirm that Cases which are not `New` (for example `Future`) should **not** be auto-assigned any more.
- [ ] **D3.** Should the batches save **only the Cases they assigned**, instead of every Case in scope? This cuts flow and trigger runs. It is a small extra change and is not part of the requirement as written.
- [ ] **D4.** Confirm that recording unassigned hours through `Dynamic_Hours_Calculation` on `New → Assigned` is expected.
- [ ] **D5.** Can Foundation Cases have the categories Digital OEM, Digital Reporting, Platform Requests or Website Analytics, where `Assigned` is not a valid value?
