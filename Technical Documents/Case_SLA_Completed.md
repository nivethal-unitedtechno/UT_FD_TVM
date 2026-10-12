# Flow: Case - SLA Completed

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Case_SLA_Completed` |
| Label | Case - SLA Completed |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | Update |
| Run In Mode | Default |
| API Version | 57.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Check_Mail_Sent_Field` | Check Mail Sent Field |
| Action | `Send_email_on_SLA_completed` | Send email on SLA completed |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <actionCalls>
        <name>Send_email_on_SLA_completed</name>
        <label>Send email on SLA completed</label>
        <locationX>50</locationX>
        <locationY>431</locationY>
        <actionName>Case.SLA_Time_Completed</actionName>
        <actionType>emailAlert</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.SLA_Time_Completed</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <apiVersion>57.0</apiVersion>
    <decisions>
        <name>Check_Mail_Sent_Field</name>
        <label>Check Mail Sent Field</label>
        <locationX>182</locationX>
        <locationY>323</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Mail_Sent_Updated</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Mail_Sent__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Mail_Sent__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_email_on_SLA_completed</targetReference>
            </connector>
            <label>Mail Sent Updated</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <interviewLabel>Case - SLA Completed {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Case - SLA Completed</label>
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
    <start>
        <locationX>56</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Check_Mail_Sent_Field</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Foundation_Record__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <object>Case</object>
        <recordTriggerType>Update</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
