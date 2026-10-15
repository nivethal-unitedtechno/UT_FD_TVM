# 6. Rollback and Recovery

Salesforce has no "undo deployment" button. A rollback is a **new deployment** that puts back the backed-up versions,
so it follows the same rules: validate first, name the org, record everything. A Production rollback is run by the authorized person only.

## A. When to roll back

| Situation | Action |
|---|---|
| Deployment failed | Nothing to roll back, because nothing was applied. Fix and validate again. |
| Post-deployment check fails and the fix is small, tested and approved | **Fix forward**: a new, validated deployment |
| Users are blocked, data is being changed wrongly, or the cause is unknown | **Roll back** now, then investigate |

Write the decision, who made it and when in the deployment record.

## B. Restoring the previous versions

The backup was taken in the [pre-deployment checklist, section C](01-Pre-Deployment-Checklist.md#c-backup-required-for-rollback).

1. **Pause** affected scheduled jobs, as in the [deployment instructions](04-Deployment-Instructions.md).
2. **Validate** the backup:
   ```
   sf project deploy validate --target-org "<target alias>" \
     --metadata-dir "backups/<YYYY-MM-DD>_<change>" \
     --test-level RunSpecifiedTests --tests <TestClass1> --tests <TestClass2> --wait 60
   ```
3. **Quick deploy** the validated job:
   ```
   sf project deploy quick --target-org "<target alias>" --job-id <job ID> --wait 60
   ```
4. **Re-schedule** the jobs, then run the [post-deployment verification](05-Post-Deployment-Verification.md) against the **previous** behaviour.

The test classes in the backup must pass against the old code. If the deployment also changed the tests, the backup
contains the old tests, which is correct.

## C. Removing components that were added

Components that didn't exist before the deployment have no backup. Remove them with a destructive manifest:

`manifest/deploy/<YYYY-MM-DD>_<change>-rollback/destructiveChangesPost.xml`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
    <types>
        <members>NewClassName</members>
        <name>ApexClass</name>
    </types>
    <version>68.0</version>
</Package>
```
```
sf project deploy start --target-org "<target alias>" \
  --manifest manifest/deploy/<…>-rollback/package.xml \
  --post-destructive-changes manifest/deploy/<…>-rollback/destructiveChangesPost.xml \
  --test-level RunSpecifiedTests --tests <TestClass> --dry-run
```
Remove `--dry-run` only after the dry run succeeds and the deletion is approved.
- **Production:** Apex classes can be deleted this way.
- **Sandbox:** deleting classes is easier from Setup.
- **Fields:** deleting a field also deletes its data, so get approval first.

## D. Recovering data

Metadata rollback doesn't undo **data** that the new code already changed. For example, Cases set to `Assigned` stay `Assigned`.

1. **Identify** the affected records: a query on the fields the change wrote, limited to the window between deployment and rollback.
2. **Fix them** from the before-values, using the exports from the checklist, the field history or the audit fields.
3. **Record it as a change record** (`CR`) with the authorized scope, the counts (selected, succeeded, failed) and the before/after evidence.
   Don't paste full data extracts.

## E. After a rollback

- [ ] Rollback deploy ID recorded: ________
- [ ] Scheduled jobs running again
- [ ] Previous behaviour confirmed by the functional checks
- [ ] Conflict record (`CF`) opened with the evidence and the *suspected* cause. Mark it resolved only after the cause is confirmed.
- [ ] [Deployment History](07-Deployment-History.md) updated: the original row set to *Rolled back*, plus a row for the rollback itself

## History

| Date | Change |
|---|---|
| 2026-10-15 | Created. |
