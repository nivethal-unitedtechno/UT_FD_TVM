# Req - 2026-10-13 - Non-Hybrid Queue Round-Robin for Bulk Case Inserts

| Item | Value |
|---|---|
| Date | 2026-10-13 |
| Status | **Plan only. Waiting for approval. No code has been changed.** |
| Org | FD - TVM Sandbox (`teamvelocity--fullsando`). Not re-verified with `sf org display` in this session. |
| Components | `CalculateCaseDueDate` (Apex class), `CaseTrigger_FNDN` (Apex trigger) |
| Source reviewed | `Technical Documents/Apex/CalculateCaseDueDate.md` and `Technical Documents/Apex/CaseTrigger_FNDN.md` (the copies retrieved from the org) |

---

## 1. Requirement

1. Keep the existing Hybrid routing, field-based assignment, SLA, due-date, and Ready for QA logic as it is.
2. For **Non-Hybrid queue routing**, find the starting round-robin position **once per queue**.
3. **Advance that position after each Case is assigned** in the same transaction.
4. Leave `CaseTrigger_FNDN` unchanged. It already passes the whole bulk insert to the routing method.

## 2. Problem today

In `CalculateCaseDueDate.assignCasesWithTVMLogic`, the Non-Hybrid branch for **Case Entry = Manual** and **Initial Assignment = Queue** works like this for each Case:

```apex
String lastAssignedUser = getLastAssignedUser(userIds, config.Queue__c);   // SOQL for every Case
Integer nextUserIndex = (lastAssignedUser != null) ? userIds.indexOf(lastAssignedUser) + 1 : 0;
```

- `getLastAssignedUser` looks up the most recently created Case for that queue that is already **saved in the database**.
- In a **before insert**, the other Cases in the same batch have not been saved yet, so every Case in the batch sees the **same** last-assigned user.
- **Result:** in a bulk insert, every Case for the same queue goes to the **same user**, so round-robin doesn't rotate.
- **Second problem:** one SOQL query runs per Case (SOQL inside a loop). A 200-record insert can hit the 100-query governor limit.

The Hybrid **Manual** branch already handles this correctly. It sets the starting position once with `seedQueueIndex(...)`, saves it in `queueNextIndexMap`, and moves it forward after each assignment.

## 3. Scope

**In scope**
- `CalculateCaseDueDate.assignCasesWithTVMLogic`: the Non-Hybrid → `Case_Entry__c = 'Manual'` → `Initial_Assignment__c = 'Queue'` block only.
- New or updated test methods in `Test_calculatecaseduedate`.

**Out of scope (no change)**
- `CaseTrigger_FNDN`.
- Hybrid routing (Auto and Manual).
- Field-based assignment (`Initial_Assignment__c = 'Field'`), for both Hybrid and Non-Hybrid.
- Non-Hybrid Auto + Queue. It only sets `Case_Assignment_Queue__c` and does not assign a user, so there is no round-robin to fix.
- Ready for QA routing (`assignBeforeUpdateCasesWithTVMLogic`, `getLastAssignedUserForUpdate`).
- SLA and due-date calculation (`calculateCaseDueDate`, `insertCases`, future methods).
- `CaseOOOAssignmentHandler` and `Th_CaseTrigger`.

## 4. Impact analysis

| Area | Effect |
|---|---|
| `onBeforeInsert` → `assignCasesWithTVMLogic` | Already passes a new `queueNextIndexMap` for each call. Non-Hybrid will now use it. |
| `onBeforeUpdate` (category changed to New Digital Support) → `assignCasesWithTVMLogic` | Uses the same method, so a bulk update that changes the category will also rotate correctly. This is a side benefit, not new behaviour. |
| Hybrid and Non-Hybrid share `queueNextIndexMap` | The map is keyed by queue name. If a Hybrid Manual rule and a Non-Hybrid Manual rule use the **same queue** in one transaction, they will share one rotation. That matches how the database seed already works, which is one last-assigned user per queue. **Please confirm this is acceptable.** |
| First Case in a transaction | `seedQueueIndex` runs the same query as `getLastAssignedUser` (`ORDER BY CreatedDate DESC LIMIT 1`, same filters). The first Case gets the same user as today. |
| Single-Case insert | No change in result. |
| SOQL | Goes from one query per routed Case to **one query per queue** in each transaction. |
| `getLastAssignedUser` | Will have no callers after the change. It is left in the class, not deleted, to keep the change small. |
| `CaseOOOAssignmentHandler.reassignCases` (after insert) | Still runs after routing. OOO users are already removed from `groupUserMap` by `getGroupUsers`. No change. |
| Record-triggered flows on Case (for example `Case_Assignment_Process`, `Update_Case_AT_and_Owner`) | Not changed. They still see the assigned values as they do today. They now get a spread of users instead of one user. **Not inspected in detail for this change.** |

## 5. Proposed approach

Change only the Non-Hybrid Manual + Queue block so it follows the Hybrid Manual pattern:

```apex
// Non-Hybrid -> Manual -> Queue  (proposed)
List<String> userIds = groupUserMap.get(config.Queue__c);

// Find the starting position once per queue, then reuse it for the rest of the batch
if (!queueNextIndexMap.containsKey(config.Queue__c)) {
    queueNextIndexMap.put(config.Queue__c, seedQueueIndex(userIds, config.Queue__c));
}
Integer nextUserIndex = queueNextIndexMap.get(config.Queue__c);
if (nextUserIndex >= userIds.size()) {
    nextUserIndex = 0;
}

objCase.Case_Assign_To__c = userIds[nextUserIndex];
objCase.OwnerId = objCase.Case_Assign_To__c;
objCase.Case_Assignment_Queue__c = config.Queue__c;

// Move to the next user for the next Case in this transaction
nextUserIndex++;
if (nextUserIndex >= userIds.size()) {
    nextUserIndex = 0;
}
queueNextIndexMap.put(config.Queue__c, nextUserIndex);
```

- No method signatures change.
- No new metadata, fields, or queues.
- An empty queue (`userIds` empty) behaves as it does today. **Open point:** the current code would fail on `userIds[0]` if the queue has no active users. Should the new code add an `isEmpty()` guard, as the Hybrid branch has?

## 6. Test plan

Add to `Test_calculatecaseduedate`, using the existing in-memory `cfg(...)`, `memCase(...)`, and `memAccount(...)` helpers:

| # | Scenario | Expected result |
|---|---|---|
| 1 | Bulk, 2 queue users, 4 Non-Hybrid Manual Queue Cases | Cases alternate: user 1, user 2, user 1, user 2 |
| 2 | Bulk, 3 users, 200 Cases | Each user gets 66 or 67 Cases, and SOQL used stays flat (one seed query per queue) |
| 3 | Starting position: an existing Case was last assigned to user 1 in the queue | The first new Case goes to user 2, then the rotation wraps around |
| 4 | Two different queues in one batch | Each queue rotates on its own |
| 5 | Mixed Hybrid and Non-Hybrid Cases in one batch | Hybrid results are unchanged |
| 6 | Single queue user | Every Case goes to that user, with no error |
| 7 | Regression | Existing tests still pass: `Test_calculatecaseduedate`, `Test_CaseDueDateTrigger`, `CaseOOOAssignmentHandlerTest` |

The existing test `testInsert_ManualQueue_AssignsBothFields` only checks that the assignee is "not null", which is why it did not catch this issue. Test 1 checks the actual users.

**Manual sandbox check:** use Data Loader or a list import to insert at least 4 Foundation Cases for one Non-Hybrid Manual Queue request type. Check that `Case_Assign_To__c` and `OwnerId` rotate across the queue members.

## 7. Assumptions and unverified items

- **The local project copy is out of date.** `C:\Users\UTIS-514\MyFDTVMProject\force-app\main\default\classes\CalculateCaseDueDate.cls` (26 Sep) is different from the org copy in `Technical Documents` (the newer version). Before implementing, retrieve the latest `CalculateCaseDueDate`, `CaseTrigger_FNDN`, and `Test_calculatecaseduedate` from the sandbox with `--target-org` set explicitly.
- The target org alias, username, and Org ID have **not** been verified in this session.
- The order of users in each queue comes from the `GroupMember` query, which has no `ORDER BY`. This is existing behaviour and is not changed. Please say if you want a fixed order.
- Round-robin across **separate** transactions that run at the same time is not covered. That is existing behaviour.
- API names used: `Case_Assign_To__c`, `Case_Assignment_Queue__c`, `Case_Request__c`, `FNDN_Billed_Through_TVM__c`, `Case_Routing_Config__mdt` (`Queue__c`, `Case_Entry__c`, `Initial_Assignment__c`, `Active__c`, `Case_Type__c`). All were taken from the retrieved source, not checked again in the org.

## 8. Decision needed

- [ ] Approve the approach in section 5.
- [ ] Confirm that a shared rotation per queue name (Hybrid and Non-Hybrid) is acceptable.
- [ ] Decide whether to add an empty-queue guard.
- [ ] Decide whether Ready for QA queue routing, which has the same per-Case lookup issue, should be a **separate** requirement.
