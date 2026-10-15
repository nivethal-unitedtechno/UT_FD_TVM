# 2. Deployment Manifests and Dependency Checks

## A. Manifests in this repository

| File | Purpose | Use for deployment? |
|---|---|---|
| `manifest/package.xml` | **Full org inventory** generated from FD - TVM Sandbox on 2026-10-13 (about 30,400 members) | ❌ No. Retrieval and reference only. |
| `manifest/package-01-core.xml` … `package-04-dash-email-docs.xml` | The same inventory split into retrievable batches | ❌ No. Retrieval only. |
| `manifest/deploy/<YYYY-MM-DD>_<change>/package.xml` | **One manifest per deployment**, listing only the components in scope | ✅ Yes |

Never deploy the full inventory manifest. It would overwrite every component in the target org.

## B. Building a change manifest

1. Create `manifest/deploy/<YYYY-MM-DD>_<change>/package.xml`.
2. List each component by its exact API name. Example (assignment batch change, requirement 03):
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <Package xmlns="http://soap.sforce.com/2006/04/metadata">
       <types>
           <members>CaseAssignmentBatch</members>
           <members>CaseAssignmentBatchTest</members>
           <members>CaseAssignmentHybridBatch</members>
           <members>CaseAssignmentHybridBatchTest</members>
           <name>ApexClass</name>
       </types>
       <version>68.0</version>
   </Package>
   ```
3. Check the manifest against the source:
   ```
   sf project deploy preview --manifest manifest/deploy/<…>/package.xml --target-org "<alias>"
   ```
4. Put a copy of the manifest into the deployment record (`DEP`).

## C. Dependency checks

For **each** component in the manifest, answer every question. If a dependency is missing from the target, add it to the manifest or deploy it first.

| Check | How |
|---|---|
| What does it call or reference? | Read the source: classes, fields, custom metadata, labels, queues |
| What calls it? | Search all Apex in the target: `SELECT Name, Body FROM ApexClass` (Tooling API), then search for the name |
| Which automation fires with it? | List active record-triggered flows on the object (`FlowDefinitionView`) and the other triggers on the object |
| Do referenced fields exist in the target, with the same type and picklist values? | `sf sobject describe --sobject <Object> --target-org "<alias>"` |
| Is configuration **data** needed? | Custom setting rows and queue members don't deploy with code. Custom metadata records deploy only if they're included. |
| Is it used by a scheduled job? | See [Pre-Deployment Checklist, section D](01-Pre-Deployment-Checklist.md#d-scheduled-and-running-jobs) |

### Known dependency map: Case routing (verified in FD - TVM Sandbox, 2026-10-14)

```
CaseTrigger_FNDN (Case trigger: before/after insert and update)
 ├─ CalculateCaseDueDate      routing at insert, due date, SLA, Ready for QA
 ├─ CaseOOOAssignmentHandler  after insert
 └─ Th_CaseTrigger            after update

ScheduleCaseAssignmentBatch (scheduled job "CaseAssignmentBatch", 0 30 * * * ?)
 ├─ CaseAssignmentBatch        Non-Hybrid Auto + Queue
 └─ CaseAssignmentHybridBatch  Hybrid Auto + Queue

ScheduleCaseStatusUpdateBatch (not scheduled as of 2026-10-14)
 └─ CaseStatusUpdateBatch
```

| Dependency | Type | Deploys with code? | Note |
|---|---|---|---|
| `Case_Routing_Config__mdt` records | Custom metadata | Only if included (`CustomMetadata`) | Routing rules: Case Entry, Initial Assignment, Queue, QA rules |
| `SLA_Time_Calculation__c` rows (97) | Custom setting (data) | ❌ No | Read by the flow `Case_SLA_Time_Calculation` |
| Queues and their members (Action, Analyze, Helpware, Hybrid, Digital Analyst …) | Queue / GroupMember | Queue: yes. **Members: no** (users differ between orgs) | Round-robin needs active members |
| `Case.Status_Filtered__c` | Dependent picklist (controller `Case_Category__c`) | Yes (`CustomField`) | `New` and `Assigned` must be valid for the categories used |
| Flow `Case_Updated_Before_Save` | Flow | Yes (`Flow`) | Copies `Status_Filtered__c` to the other status fields |
| Flows `Dynamic_Hours_Calculation`, `Case_Updated`, `Case_Status_Subflow` | Flow | Yes | React to status and owner changes |

## History

| Date | Change |
|---|---|
| 2026-10-15 | Created, with the Case routing dependency map. |
