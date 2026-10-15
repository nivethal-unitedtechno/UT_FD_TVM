# Flow: Case Route Hybrid To Account Technician(Ready for QA)

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Case_Route_Hybrid_To_Account_Technician` |
| Label | Case Route Hybrid To Account Technician(Ready for QA) |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | CreateAndUpdate |
| Run In Mode | Default |
| API Version | 65.0 |
| Description | _None_ |

## Trigger & Entry Criteria

Filter logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Status_Filtered__c` | IsChanged | booleanValue: true |
| 2 | `Status_Filtered__c` | EqualTo | stringValue: Ready For QA |

## Foundation_Record__c = true Usage

### Decision outcome of `Foundation_Record`: `Outcome_1_of_Foundation_Record` — Outcome 1 of Foundation Record

Logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `$Record.Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Foundation_Record` | Foundation Record |
| Decision | `Hybrid_Case` | Hybrid Case |
| Update Records | `Update_Case_Assignment` | Update Case Assignment1 |
| Formula | `OwnerIDFinal` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>65.0</apiVersion>
    <decisions>
        <name>Foundation_Record</name>
        <label>Foundation Record</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Outcome_1_of_Foundation_Record</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Foundation_Record__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Case_Assignment</targetReference>
            </connector>
            <label>Outcome 1 of Foundation Record</label>
        </rules>
    </decisions>
    <decisions>
        <name>Hybrid_Case</name>
        <label>Hybrid Case</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>YES</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Account.FNDN_Billed_Through_TVM__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Foundation_Record</targetReference>
            </connector>
            <label>YES</label>
        </rules>
    </decisions>
    <environments>Default</environments>
    <formulas>
        <name>OwnerIDFinal</name>
        <dataType>String</dataType>
        <expression>IF(
  OR( ISBLANK({!$Record.Account.Account_Technician__r.Id}), ISNULL({!$Record.Account.Account_Technician__r.Id}) ),
  $User.Id,
  {!$Record.Account.Account_Technician__r.Id}
)</expression>
    </formulas>
    <interviewLabel>Case Route Hybrid To Account Technician {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Case Route Hybrid To Account Technician(Ready for QA)</label>
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
        <name>Update_Case_Assignment</name>
        <label>Update Case Assignment1</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>OwnerIDFinal</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Hybrid_Case</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Status_Filtered__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Status_Filtered__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Ready For QA</stringValue>
            </value>
        </filters>
        <object>Case</object>
        <recordTriggerType>CreateAndUpdate</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
