# 5. Post-Deployment Verification

Do this immediately after the deployment. Save the evidence (query output, screenshots) in the deployment record.
If any check fails, decide whether to fix forward or roll back (see [Rollback and Recovery](06-Rollback-and-Recovery.md)).

## A. Technical checks

- [ ] **Deployment status:** Setup → *Deployment Status* shows **Succeeded**, with the expected number of components.
- [ ] **Deployed components are the expected versions.** Retrieve them and compare with the approved source:
      ```
      sf project retrieve start --target-org "<alias>" --manifest manifest/deploy/<…>/package.xml --target-metadata-dir "verify/<YYYY-MM-DD>_<change>" --unzip
      ```
- [ ] **Scheduled jobs restored**, with the same name, cron expression and class as before:
      ```
      sf data query --target-org "<alias>" --query "SELECT CronJobDetail.Name, CronExpression, State, NextFireTime FROM CronTrigger WHERE CronJobDetail.JobType = '7'"
      ```
- [ ] **Flows:** the intended versions are active (Setup → Flows, or query `FlowDefinition` for `ActiveVersionId`).
- [ ] **Manual steps** from [Deployment Instructions](04-Deployment-Instructions.md#manual-steps-that-metadata-cant-carry) are done.

## B. Functional checks

Write the checks from the requirement's acceptance criteria. Run them as a user with the affected profile, not as an administrator.

Example for the assignment batch status change (requirement 03):

| # | Step | Expected result | Actual | Pass |
|---|---|---|---|---|
| 1 | Create a Foundation Case with an Auto + Queue request type, status `New` | `Case_Assignment_Queue__c` is set and `Case_Assign_To__c` is empty | | |
| 2 | Wait for the :30 run, or run `Database.executeBatch(new CaseAssignmentBatch(), 200);` | `Case_Assign_To__c` and Owner are a queue member, and status is `Assigned` | | |
| 3 | Check the synced fields | `Status` and `FD_Status__c` are also `Assigned` (flow `Case_Updated_Before_Save`) | | |
| 4 | Repeat with a Hybrid account | Same results, through `CaseAssignmentHybridBatch` | | |
| 5 | A Case with a status other than `New` | Behaviour matches the approved option (A: not picked; B: assigned, status unchanged) | | |

## C. Monitoring (first 24 hours)

- [ ] Apex jobs show no errors:
      ```
      sf data query --target-org "<alias>" --query "SELECT ApexClass.Name, Status, NumberOfErrors, ExtendedStatus, CreatedDate FROM AsyncApexJob WHERE CreatedDate = TODAY AND NumberOfErrors > 0"
      ```
- [ ] No new Apex exception emails or flow error emails.
- [ ] Users report no problems in the affected process.

## D. Sign-off

| Role | Name | Date / time (TZ) | Result |
|---|---|---|---|
| Deployer | | | |
| Verifier (not the deployer) | | | |
| Business owner | | | |

## History

| Date | Change |
|---|---|
| 2026-10-15 | Created. |
