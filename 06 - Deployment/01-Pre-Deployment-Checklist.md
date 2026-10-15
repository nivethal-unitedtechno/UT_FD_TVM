# 1. Pre-Deployment Checklist

Copy this checklist into the deployment record (`DEP`) for each release and tick every item. If an item doesn't apply, write
**N/A** and give the reason. **Don't continue to step 2 while any item is open.**

## A. Scope and approval

- [ ] The requirement (`REQ`) is linked and its acceptance criteria are written down.
- [ ] Every component in scope is listed by its **verified API name**, along with its type (ApexClass, ApexTrigger, Flow, CustomField …).
- [ ] Out-of-scope items are listed explicitly, for example "`CaseTrigger_FNDN` is not changed".
- [ ] A code review has been completed. Reviewer: ________  Date: ________
- [ ] Business sign-off received for the change. Approver: ________  Date: ________
- [ ] Deployment window agreed and users notified, if the change affects users while they work.
- [ ] The person who will run the Production deployment is named: ________

## B. Source and environment

- [ ] The **latest version** of each component was retrieved from the sandbox just before packaging, and it matches what was reviewed.
      This matters because sandbox code can be changed by others: for example, `CalculateCaseDueDate` was changed on 2026-10-13 and changed back on 2026-10-14.
- [ ] Target org verified:
      `sf org display --target-org "<alias>"`
      Check the alias, username, Org ID and instance URL against the [environment table](README.md#environments).
- [ ] The source API version in `sfdx-project.json` (`68.0`) is supported by the target org.
- [ ] No hard-coded record IDs, user IDs, endpoints or credentials appear in the changed code.
- [ ] No Production data or secrets were used in prompts, tests or documents.

## C. Backup (required for rollback)

- [ ] The **current target-org version** of every component in the manifest has been retrieved into a dated backup folder:
      ```
      sf project retrieve start --target-org "<target alias>" --manifest <change package.xml> \
        --target-metadata-dir "backups/<YYYY-MM-DD>_<change>" --unzip
      ```
- [ ] New components, which have no backup because they don't exist in the target yet, are listed so they can be removed on
      rollback (see [Rollback](06-Rollback-and-Recovery.md#c-removing-components-that-were-added)).
- [ ] Data the change depends on is exported and saved, if the change touches it. Examples: custom setting rows, custom metadata records, queue members.

## D. Scheduled and running jobs

Apex classes used by a scheduled or running job can't be deployed while the job exists, unless *Allow deployments of
components when corresponding Apex jobs are pending or in progress* is enabled (Setup → Deployment Settings).

- [ ] Scheduled Apex jobs listed in the target org:
      ```
      sf data query --target-org "<alias>" --query "SELECT Id, CronJobDetail.Name, CronExpression, State, NextFireTime FROM CronTrigger WHERE CronJobDetail.JobType = '7'"
      ```
- [ ] For each job that runs a class in the manifest, record its **name, cron expression and Apex class**, so it can be
      re-scheduled exactly as it was. Known job: `CaseAssignmentBatch`, cron `0 30 * * * ?`, runs `ScheduleCaseAssignmentBatch`.
- [ ] Jobs aborted before deployment (if needed): ________
- [ ] No long-running batch of an affected class is in progress (`AsyncApexJob` with `Status IN ('Processing','Preparing','Queued')`).

## E. Tests

- [ ] The test classes for every changed Apex class are in the manifest or named for `RunSpecifiedTests`.
- [ ] New and changed tests assert real outcomes: positive, negative, bulk (200 records) and restricted-user where it applies.
- [ ] All tests pass in the sandbox (step 3), and coverage of each changed class and trigger is at least **75%**.

## History

| Date | Change |
|---|---|
| 2026-10-15 | Checklist created. |
