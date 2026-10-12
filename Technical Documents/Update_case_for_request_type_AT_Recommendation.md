# Flow: Update case for request type AT Recommendation

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Update_case_for_request_type_AT_Recommendation` |
| Label | Update case for request type AT Recommendation |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | Create |
| Run In Mode | Default |
| API Version | 61.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Case_Request__c` | EqualTo | stringValue: AT Recommendation |
| 2 | `RecordTypeId` | EqualTo | stringValue: 012Vb000007oEJtIAM |
| 3 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Case_Request__c` | EqualTo | stringValue: AT Recommendation |
| 2 | `RecordTypeId` | EqualTo | stringValue: 012Vb000007oEJtIAM |
| 3 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Update Records | `Update_case_assignment_and_subject` | Update case assignment and subject |
| Formula | `OwnerIDFinal` |  |
| Formula | `Subject` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>61.0</apiVersion>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>OwnerIDFinal</name>
        <dataType>String</dataType>
        <expression>IF(
  OR( ISBLANK({!$Record.OwnerId}), ISNULL({!$Record.OwnerId}) ),
  {!$User.Id},
  {!$Record.OwnerId}
)</expression>
    </formulas>
    <formulas>
        <name>Subject</name>
        <dataType>String</dataType>
        <expression>{!$Record.Account.Name}+&quot; &quot;+ Text(TODAY()) + &quot; AT Recommendation&quot;</expression>
    </formulas>
    <interviewLabel>Update case for request type AT {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Update case for request type AT Recommendation</label>
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
        <name>Update_case_assignment_and_subject</name>
        <label>Update case assignment and subject</label>
        <locationX>176</locationX>
        <locationY>323</locationY>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>OwnerIDFinal</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Subject</field>
            <value>
                <elementReference>Subject</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>50</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Update_case_assignment_and_subject</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Case_Request__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>AT Recommendation</stringValue>
            </value>
        </filters>
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
        <recordTriggerType>Create</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
