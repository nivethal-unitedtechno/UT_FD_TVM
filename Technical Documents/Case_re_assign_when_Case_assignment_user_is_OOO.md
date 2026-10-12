# Flow: Case re-assign when Case assignment user is OOO

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Case_re_assign_when_Case_assignment_user_is_OOO` |
| Label | Case re-assign when Case assignment user is OOO |
| Status | Obsolete |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | CreateAndUpdate |
| Run In Mode | Default |
| API Version | 63.0 |
| Description | FND - When Case assignment is OOO (field on user record), Request Type Assignment = Pod Leader > reassign to Secondary AT field on the account If Case assignment is OOO, Request Type = Monthly Deep Dive, Pacing, Geo Change, Keyword/Audience Audit/Adjustment  > reassign to Manager |

## Trigger & Entry Criteria

Filter logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `RecordTypeId` | EqualTo | stringValue: 012Vb000007oEJtIAM |
| 2 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `RecordTypeId` | EqualTo | stringValue: 012Vb000007oEJtIAM |
| 2 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Check_Case_assignment_User` | Check Case assignment User |
| Decision | `Check_request_type` | Check request type |
| Update Records | `Update_case_assignment_to_Manager` | Update case assignment to Manager |
| Update Records | `Update_case_assignment_to_Secondary_AT` | Update case assignment to Secondary AT |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>63.0</apiVersion>
    <decisions>
        <name>Check_Case_assignment_User</name>
        <label>Check Case assignment User</label>
        <locationX>578</locationX>
        <locationY>323</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>If_OOO</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Assign_To__r.OOO__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Check_request_type</targetReference>
            </connector>
            <label>If OOO</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_request_type</name>
        <label>Check request type</label>
        <locationX>314</locationX>
        <locationY>431</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Request_type_pod_Leader</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Pod Leader - Account Launch QA</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_case_assignment_to_Secondary_AT</targetReference>
            </connector>
            <label>Request type=Pod Leader</label>
        </rules>
        <rules>
            <name>Request_type_Monthly_Deep_Dive_Pacing_Geo_Change_Keyword_Audience_Audit_Adjustme</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Pacing</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Geo Change</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Keyword/Audience Audit/Adjustment</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Monthly Deep Dive</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_case_assignment_to_Manager</targetReference>
            </connector>
            <label>Request type=Monthly Deep Dive,Pacing,Geo Change,Keyword/Audience Audit/Adjustment</label>
        </rules>
    </decisions>
    <description>FND - When Case assignment is OOO (field on user record), Request Type Assignment = Pod Leader &gt; reassign to Secondary AT field on the account
If Case assignment is OOO, Request Type = Monthly Deep Dive, Pacing, Geo Change, Keyword/Audience Audit/Adjustment  &gt; reassign to Manager</description>
    <environments>Default</environments>
    <interviewLabel>Case re-assign to {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Case re-assign when Case assignment user is OOO</label>
    <processMetadataValues>
        <name>BuilderType</name>
        <value>
            <stringValue>LightningFlowBuilder</stringValue>
        </value>
    </processMetadataValues>
    <processMetadataValues>
        <name>CanvasMode</name>
        <value>
            <stringValue>AUTO_LAYOUT_CANVAS</stringValue>
        </value>
    </processMetadataValues>
    <processMetadataValues>
        <name>OriginBuilderType</name>
        <value>
            <stringValue>LightningFlowBuilder</stringValue>
        </value>
    </processMetadataValues>
    <processType>AutoLaunchedFlow</processType>
    <recordUpdates>
        <name>Update_case_assignment_to_Manager</name>
        <label>Update case assignment to Manager</label>
        <locationX>314</locationX>
        <locationY>539</locationY>
        <inputAssignments>
            <field>Case_Assign_To__c</field>
            <value>
                <elementReference>$Record.Case_Assign_To__r.Manager.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_case_assignment_to_Secondary_AT</name>
        <label>Update case assignment to Secondary AT</label>
        <locationX>50</locationX>
        <locationY>539</locationY>
        <inputAssignments>
            <field>Case_Assign_To__c</field>
            <value>
                <elementReference>$Record.Account.Secondary_Account_Technician__r.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>452</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Check_Case_assignment_User</targetReference>
        </connector>
        <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
        <filterLogic>and</filterLogic>
        <filters>
            <field>RecordTypeId</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>012Vb000007oEJtIAM</stringValue>
            </value>
        </filters>
        <filters>
            <field>Foundation_Record__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <object>Case</object>
        <recordTriggerType>CreateAndUpdate</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Obsolete</status>
</Flow>
```
