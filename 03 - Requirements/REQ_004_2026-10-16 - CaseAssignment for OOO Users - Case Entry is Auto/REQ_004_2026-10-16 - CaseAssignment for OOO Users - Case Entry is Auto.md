---
name: Requirement / change request
title: "REQ: CaseAssignment for OOO Users - Case Entry is Auto"
labels: requirement
id: REQ_004
date: 2026-10-16
status: Implemented in sandbox (not by this plan) - review and tests pending
---

# REQ_004 - CaseAssignment for OOO Users - Case Entry is Auto

**What is being requested:**

> *Original request (kept as written):*
> The calculatecaseduedate assigns queue for case entry = manual. but caseassignmentbatch and its hybrid batch picks the cases
> with queue and no user assigned yet. earlier it didnt have any check for OOO users. so in my Assignment batch classes it has
> check OOO__c is true in the user record. if its true then it should not assign case to that user.

In short: when `CaseAssignmentBatch` (Non-Hybrid) and `CaseAssignmentHybridBatch` (Hybrid) assign a queued Case by round-robin,
they must **skip any queue member whose User record has `OOO__c = true`**.

> **Clarification (from the code, not part of the original request):** `CalculateCaseDueDate` sets the queue **without** a user
> for **Case Entry = Auto** with Initial Assignment = Queue. Those are the Cases the batches pick up. For **Case Entry = Manual**
> with Queue, `CalculateCaseDueDate` assigns a user straight away at insert, and it already skips OOO users
> (`getGroupUsers`, query `SELECT Id FROM User WHERE OOO__c = true`). Please confirm this matches your understanding.

**Raised by / date:** sasikumarm@unitedtechno.com / 2026-10-16

**Target org:** FD - TVM Sandbox (`teamvelocity--fullsando`, Org ID `00DVa000006Eh6TMAS`) / FD - TVM Production

**Objects or components affected:**

| Component | Type | Role |
|---|---|---|
| `CaseAssignmentBatch` | Apex batch | Non-Hybrid Auto + Queue assignment, **in scope** |
| `CaseAssignmentHybridBatch` | Apex batch | Hybrid Auto + Queue assignment, **in scope** |
| `CaseAssignmentBatchTest`, `CaseAssignmentHybridBatchTest` | Apex tests | Need OOO test cases, **in scope** |
| `User.OOO__c` | Checkbox on User (created 2025-09-02) | Read only |
| `ScheduleCaseAssignmentBatch` | Scheduler | Runs both batches. Not changed. |
| `CalculateCaseDueDate`, `CaseOOOAssignmentHandler` | Apex | Already handle OOO. **Not changed.** |

**Does this change any data?** No. It changes logic only, not existing records. Cases assigned after deployment will skip OOO users.

**Acceptance criteria:**

- [ ] A queue member with `OOO__c = true` is **never** given a Case by either batch.
- [ ] The remaining (not OOO) queue members still receive Cases by round-robin.
- [ ] If **every** member of the queue is OOO, the Case is **left unassigned** (it keeps its queue and `Case_Assign_To__c` stays empty), and the batch doesn't fail.
- [ ] Users with `OOO__c = false` are unaffected, so behaviour for teams with nobody OOO is the same as before.
- [ ] Works in bulk (200 Cases per batch chunk), with no extra SOQL per Case.
- [ ] The test classes cover the OOO scenarios below, with real assertions.

---

## 1. Current state (verified in the sandbox on 2026-10-16)

Both batch classes were **changed in the sandbox today**, before this document was written, and **already contain the OOO check**:

| Class | Last modified (UTC) | By | OOO logic |
|---|---|---|---|
| `CaseAssignmentBatch` | 2026-10-16 06:36 | Sandip Patel | Lines 57–70: loads `oooUserIds`, then `GroupMember … AND UserOrGroupId NOT IN :oooUserIds` |
| `CaseAssignmentHybridBatch` | 2026-10-16 05:19 | Sandip Patel | Lines 66–82: same pattern, plus a new `!groupUserMap.get(cfg.Queue__c).isEmpty()` guard (line 173) |
| `CaseAssignmentBatchTest` | (changed) | Sandip Patel | **No OOO test.** Comments removed, and three Account user-lookup fields removed from the test data. |
| `CaseAssignmentHybridBatchTest` | (changed) | Sandip Patel | **No OOO test.** It now clears `Case_Assign_To__c` instead of `OwnerId` to simulate "unassigned". |

The added code (the same in both classes):
```apex
// Exclude Out of Office users
Set<Id> oooUserIds = new Map<Id, User>([SELECT Id FROM User WHERE OOO__c = true]).keySet();

for (GroupMember member : [SELECT GroupId, UserOrGroupId FROM GroupMember
                           WHERE GroupId IN :groupIdMap.values()
                           AND UserOrGroupId NOT IN :oooUserIds]) { ... }
```

The other changes in these versions are formatting only: indentation, line breaks and removed comments.
**Not included:** the REQ_003 status change (`New` → `Assigned`), which is still a plan.

> The copies in `force-app/main/default/classes/` were retrieved on 2026-10-14 and **don't** have these changes.
> Retrieve again before any further work.

## 2. How the OOO check works in the current code

1. Load every User with `OOO__c = true`. This is **one query per batch chunk**, not per Case.
2. Build each queue's member list **without** those users.
3. Queues where every member is OOO have no entry in `groupUserMap`. The batch skips their Cases (Non-Hybrid: `groupUserMap.get(...) != null`; Hybrid: `containsKey` + `isEmpty()`).
4. The "last assigned user" lookup only looks at Cases assigned to members who **aren't** OOO, so the rotation continues from the last available member.

## 3. Impact analysis

| Area | Effect |
|---|---|
| Round-robin order | When a member goes OOO, the rotation continues among the others. When they're back, they rejoin at their position in the queue list. |
| Cases where every member is OOO | Stay unassigned in the queue. **Gap:** the batches only pick up Cases where `CreatedDate = TODAY`, so such a Case is **never retried the next day**. See decision D1. |
| `OOO_Helper__c` | Not used by the batches. `CaseOOOAssignmentHandler` (after insert) hands Cases to the OOO user's helper, but it doesn't run when a batch assigns. See decision D2. |
| Inactive users | Not excluded (existing behaviour, out of scope). An inactive queue member could still be chosen. |
| Where OOO is set | `UpdateUserOOOBatch` sets and clears `OOO__c` from users' OOO calendar entries. It wasn't checked whether that batch is scheduled. **NOT YET VERIFIED.** |
| Flows | `Update_case_assignment_when_status_is_Ready_for_QA` reads `OOO__c` (Ready for QA routing, not affected). `Case_re_assign_when_Case_assignment_user_is_OOO` reads `OOO__c`, but its latest version is *Obsolete*, and whether any version is active is **NOT YET VERIFIED**. |
| Governor limits | +1 SOQL per chunk; the OOO user list is small. No change to DML. |
| REQ_003 | Touches the same assignment lines. Deploy both together, or deploy REQ_004 first and rebase REQ_003 onto it. |

## 4. Approach

The logic is already in the sandbox. What remains:

1. **Review** today's sandbox versions of both classes. Confirm the formatting changes didn't alter behaviour, and that the code has no hard-coded IDs.
2. **Add tests** (section 5) to both test classes. Today's versions have no OOO assertions.
3. **Decide** D1–D3 (section 7). Change code only if a decision needs it.
4. **Retrieve** the latest versions into `force-app`, then follow [06 - Deployment](../../06%20-%20Deployment/README.md).

## 5. Test plan

| # | Scenario | Expected result |
|---|---|---|
| 1 | Queue with users A and B; A has `OOO__c = true`; 3 Auto + Queue Cases | All 3 go to B |
| 2 | Queue with A, B and C; B is OOO; 4 Cases | Rotation A, C, A, C (B is never used) |
| 3 | Every queue member is OOO | No Case assigned; `Case_Assign_To__c` stays empty; no exception |
| 4 | Nobody is OOO | Same rotation as before (regression) |
| 5 | Last-assigned user is now OOO | Rotation continues with the next available member, with no error |
| 6 | Bulk: 200 Cases, 3 members, 1 OOO | Spread over the 2 available members; SOQL count flat |
| 7 | Hybrid batch: scenarios 1, 3 and 6 | Same results through `CaseAssignmentHybridBatch` |
| 8 | Regression | `CaseAssignmentBatchTest`, `CaseAssignmentHybridBatchTest`, `ScheduleCaseAssignmentBatchTest` pass |

**Manual sandbox check:**
1. Set `OOO__c = true` on one member of an Auto queue.
2. Create a Foundation Case with that queue's request type.
3. Run `Database.executeBatch(new CaseAssignmentBatch(), 200);` in Anonymous Apex.
4. Confirm the owner is **not** the OOO user.
5. Repeat for a Hybrid account.

The scheduled job was removed on 2026-10-14, so the batches don't run by themselves at the moment.

## 6. Assumptions and unverified items

- ASSUMPTION: today's sandbox changes are meant to implement this requirement, and are the version to review.
- NOT YET VERIFIED: whether `UpdateUserOOOBatch` is scheduled, i.e. whether `OOO__c` is kept up to date automatically.
- NOT YET VERIFIED: the active-version status of the flow `Case_re_assign_when_Case_assignment_user_is_OOO`.
- `OOO__c` and `OOO_Helper__c` exist only on **User** (checked in the org with a Tooling `CustomField` query).

## 7. Decisions needed

- [ ] **D1.** When every queue member is OOO, should the Case (a) stay unassigned (current code), (b) go to a fallback user or queue, or (c) be retried on later days? Option (c) means changing `CreatedDate = TODAY`.
- [ ] **D2.** Should the batches give the Case to the OOO user's **`OOO_Helper__c`** instead of skipping them, the way `CaseOOOAssignmentHandler` does at insert?
- [ ] **D3.** Should **inactive** users also be excluded? This is not part of this request.
- [ ] **D4.** Is today's sandbox code (Sandip Patel, 2026-10-16) the approved implementation, or should it be redone after review?

---

Once work begins, create a REQ-0xx document in `03-Requirements/`, add it to `DOCUMENT-INDEX.md`, and link back to this issue.

## History

| Date | Change |
|---|---|
| 2026-10-16 | Created. Recorded that both batches already contain the OOO check in the sandbox (changed 2026-10-16 by Sandip Patel). |
