# 7. Deployment History

Add one row per deployment or rollback, newest first. Enter only facts you have seen yourself (deploy IDs, results, names).
For anything not yet confirmed, write **TO BE CONFIRMED**.

## Deployments

| Date / time (TZ) | DEP record | Requirement | Source → Target | Method | Components | Validation job ID | Deploy ID | Result | Deployed by | Verified by |
|---|---|---|---|---|---|---|---|---|---|---|
| — | — | — | — | — | — | — | — | No deployments recorded yet | — | — |

Result values: *Succeeded*, *Failed*, *Rolled back*, *Partially verified*.

## Planned / pending

| Requirement | Components | Status | Next step |
|---|---|---|---|
| [REQ_002: Non-Hybrid queue round-robin for bulk Case inserts](../03%20-%20Requirements/REQ_002_2026-10-13%20-%20Non-Hybrid%20Queue%20Round-Robin%20for%20Bulk%20Case%20Inserts.md) | `CalculateCaseDueDate` (+ tests) | Outbound change set *"Apex for Queue routing - Multiple case creation"* requested on 2026-10-14. The sandbox class no longer contains the fix (see below). | Confirm with the developer whether the fix is to be re-applied. Then validate. |
| [REQ_003: Assignment batches, New → Assigned](../03%20-%20Requirements/REQ_003_2026-10-14%20-%20Assignment%20Batches%20-%20Pick%20New%20Cases%20and%20Set%20Status%20to%20Assigned.md) | `CaseAssignmentBatch`, `CaseAssignmentHybridBatch` (+ tests) | Plan written. Waiting for the decision on Option A / B. No code changed. | Approve the option, then implement in the sandbox |

## Observed changes in FD - TVM Sandbox (not deployments by this team)

These were seen in the sandbox while preparing the work above. They're kept here because they affect what gets packaged.
How they were made (direct save, deployment or change set) is **TO BE CONFIRMED**.

| Observed (UTC) | Component | What changed | By (from LastModifiedBy) | Evidence |
|---|---|---|---|---|
| 2026-10-13 09:45 | `CalculateCaseDueDate` | Bulk round-robin fix present (`BULK ROUND-ROBIN FIX` block, 2,045 lines) | Sandip Patel | Tooling API query, 2026-10-13 |
| 2026-10-13 09:45 | `CaseTrigger_FNDN` | Modified timestamp updated; code identical to the documented version | Sandip Patel | Tooling API query and diff, 2026-10-13 |
| 2026-10-14 04:52 | `CalculateCaseDueDate` | Fix no longer present; class back to the per-Case last-assigned lookup | Sandip Patel | Retrieve and Tooling API query, 2026-10-14 |
| 2026-10-14, between 10:30 and 11:30 | Scheduled job `CaseAssignmentBatch` (`ScheduleCaseAssignmentBatch`, `0 30 * * * ?`) | Job removed; last batch runs at 10:30 UTC; no 11:30 run | TO BE CONFIRMED | `CronTrigger` and `AsyncApexJob` queries, 2026-10-14 |

## History

| Date | Change |
|---|---|
| 2026-10-15 | Created with pending items and observed sandbox changes. |
