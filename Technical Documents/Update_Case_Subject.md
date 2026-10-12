# Flow: Update Case Subject

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Update_Case_Subject` |
| Label | Update Case Subject |
| Status | Obsolete |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordBeforeSave |
| Record Trigger Type | Create |
| Run In Mode | Default |
| API Version | 57.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `AccountId` | NotEqualTo | stringValue:  |
| 2 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `AccountId` | NotEqualTo | stringValue:  |
| 2 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Assignment | `case_subject_update` | case subject update |
| Formula | `caseSubjectwithAccname` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>57.0</apiVersion>
    <assignments>
        <name>case_subject_update</name>
        <label>case subject update</label>
        <locationX>176</locationX>
        <locationY>287</locationY>
        <assignmentItems>
            <assignToReference>$Record.Subject</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>caseSubjectwithAccname</elementReference>
            </value>
        </assignmentItems>
    </assignments>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>caseSubjectwithAccname</name>
        <dataType>String</dataType>
        <expression>({!$Record.Account.Name}&amp;&quot; &quot;&amp;TEXT(Today())&amp;&quot; &quot;&amp;{!$Record.Subject})</expression>
    </formulas>
    <interviewLabel>Update Case Subject {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Update Case Subject</label>
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
        <locationX>50</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>case_subject_update</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>AccountId</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue></stringValue>
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
        <triggerType>RecordBeforeSave</triggerType>
    </start>
    <status>Obsolete</status>
</Flow>
```
