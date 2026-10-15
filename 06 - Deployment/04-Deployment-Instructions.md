# 4. Deployment Instructions

**Before you start:** steps 1–3 are complete, the validation in the target org succeeded, and the approver has signed off.
**Production deployments are run by the named, authorized person only.**

## Option A: Salesforce CLI (quick deploy of the validated job)

1. **Confirm the target org:**
   ```
   sf org display --target-org "<target alias>"
   ```
2. **Pause affected scheduled jobs** recorded in the [pre-deployment checklist](01-Pre-Deployment-Checklist.md#d-scheduled-and-running-jobs).
   Skip this if *Allow deployments of components when corresponding Apex jobs are pending or in progress* is enabled.
   To abort a job: Setup → *Scheduled Jobs* → **Del**, or:
   ```apex
   System.abortJob('<CronTrigger Id>');
   ```
3. **Quick deploy** the validated job, so the tests aren't run again:
   ```
   sf project deploy quick --target-org "<target alias>" --job-id <validation job ID> --wait 60
   ```
   If the validation has expired (after 10 days) or the source changed, validate again (step 3). **Don't** fall back to an untested `deploy start`.
4. **Save the deploy ID** and the output in the deployment record.
5. **Re-schedule** any job paused in step 2, with the **same name and cron expression**. Example for the assignment batches:
   ```apex
   System.schedule('CaseAssignmentBatch', '0 30 * * * ?', new ScheduleCaseAssignmentBatch());
   ```
6. **Go to** [Post-Deployment Verification](05-Post-Deployment-Verification.md).

## Option B: Change set

1. **Sandbox:** Setup → *Outbound Change Sets* → New.
   - Name it after the deployment record, for example *Apex for Queue routing - Multiple case creation*.
   - Add exactly the components in the manifest, including the test classes.
   - **Upload** it to the target org.
2. **Target org:** Setup → *Deployment Settings* must allow inbound changes from this sandbox.
3. **Target org:** Setup → *Inbound Change Sets* → open the change set → **Validate**, choosing *Run specified tests*.
4. **Pause affected scheduled jobs**, as in Option A, step 2.
5. When the validation succeeds, use **Quick Deploy** from the validation result. Otherwise choose **Deploy** with the same test option.
6. **Record the deployment ID** shown under *Deployment Status*.
7. **Re-schedule jobs**, as in Option A, step 5.
8. **Go to** [Post-Deployment Verification](05-Post-Deployment-Verification.md).

## If the deployment fails

- Nothing is applied. Salesforce deployments are all-or-nothing.
- Save the error output in the deployment record and open a conflict record (`CF`) if the cause isn't obvious.
- Re-schedule any job you paused, even though the deployment failed.

## Manual steps that metadata can't carry

List these in the deployment record and do them right after the deployment:

| Item | How |
|---|---|
| Queue members | Setup → Queues → add users |
| Custom setting rows (`SLA_Time_Calculation__c`) | Data Loader or Setup → Custom Settings → Manage |
| Scheduled jobs | `System.schedule(...)`, as above |
| Flow activation (if deployed inactive) | Setup → Flows → activate the intended version |

## History

| Date | Change |
|---|---|
| 2026-10-15 | Created. |
