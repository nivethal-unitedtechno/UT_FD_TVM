# 06 - Deployment

Standard process for moving FD-TVM Salesforce changes from the sandbox to the next org.
Follow the documents in order. Each one ends in a gate that must pass before you continue.

| # | Document | Gate |
|---|---|---|
| 1 | [Pre-Deployment Checklist](01-Pre-Deployment-Checklist.md) | Scope, approvals, backup and org checks are all ticked |
| 2 | [Manifests and Dependency Checks](02-Manifests-and-Dependency-Checks.md) | Manifest is complete and every dependency is either included or already in the target |
| 3 | [Validation and Test Results](03-Validation-and-Test-Results.md) | Check-only deploy succeeded and test results are recorded |
| 4 | [Deployment Instructions](04-Deployment-Instructions.md) | Approved deploy executed (quick deploy of the validated job) |
| 5 | [Post-Deployment Verification](05-Post-Deployment-Verification.md) | Functional checks passed, scheduled jobs restored, evidence saved |
| 6 | [Rollback and Recovery](06-Rollback-and-Recovery.md) | Used only when step 5 fails or a defect is found later |
| 7 | [Deployment History](07-Deployment-History.md) | One row per deployment, with links to its evidence |

## Environments

| Role | Org | Alias | Org ID | Instance URL |
|---|---|---|---|---|
| Development / validation | FD - TVM Sandbox (full sandbox) | `FD - TVM Sandbox` | `00DVa000006Eh6TMAS` | `https://teamvelocity--fullsando.sandbox.my.salesforce.com` |
| Production | FD - TVM Production | **TO BE CONFIRMED** | **TO BE CONFIRMED** | **TO BE CONFIRMED** |

The sandbox details were verified with `sf org display --target-org "FD - TVM Sandbox"` on 2026-10-13.
The Production org is not authenticated on this machine, so its details have not been verified.

## Ground rules

1. **Production is human-controlled.** Claude can prepare manifests, run check-only validations in the sandbox and draft these
   documents. It never deploys to Production. A named, authorized person runs every Production deployment.
2. **Always name the org.** Every `sf` command uses `--target-org "<alias>"`. Never rely on the default org.
3. **Validate first, then quick deploy.** Production changes are validated (check-only) first. The validated job is then deployed
   with quick deploy, so the code that was tested is exactly the code that goes live.
4. **No backup, no deployment.** Retrieve the current target versions of every component before deploying
   (see [Rollback and Recovery](06-Rollback-and-Recovery.md)).
5. **Record everything.** Each deployment gets a row in [Deployment History](07-Deployment-History.md) and a deployment record
   (`DEP`) following [Rule for Documentation](../01%20-%20Instructions/Rule%20for%20Documentation.md).
6. **Never invent results.** Write **TO BE CONFIRMED** for any ID, result or approval you have not seen yourself.

## Deployment methods used in this project

| Method | When | Notes |
|---|---|---|
| Outbound / inbound change set | Sandbox → Production via Setup | Built in the sandbox UI, uploaded over the deployment connection, then validated and deployed from Production Setup → *Inbound Change Sets* |
| Salesforce CLI (`sf project deploy`) | Any org Claude or a developer can authenticate to | Uses the manifests in `manifest/` or a change-specific `package.xml`; supports check-only validation and quick deploy |

## History

| Date | Change |
|---|---|
| 2026-10-15 | Deployment documentation created. |
