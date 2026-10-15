# Flow: Case - Updated Last Flow

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Case_Updated_Last_Flow` |
| Label | Case - Updated Last Flow |
| Status | Obsolete |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | Update |
| Run In Mode | Default |
| API Version | 66.0 |
| Description | This flow will run last when the case is updated |

## Trigger & Entry Criteria

Filter logic: `(1 OR 2 OR 3 OR 4 OR 5 OR 6 OR 7) AND 8`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Status_Filtered__c` | IsChanged | booleanValue: true |
| 2 | `Status` | IsChanged | booleanValue: true |
| 3 | `Status_CS__c` | IsChanged | booleanValue: true |
| 4 | `Status_General__c` | IsChanged | booleanValue: true |
| 5 | `Status_Production__c` | IsChanged | booleanValue: true |
| 6 | `Status_Digital__c` | IsChanged | booleanValue: true |
| 7 | `FD_Status__c` | IsChanged | booleanValue: true |
| 8 | `Bypass_Validation__c` | IsChanged | booleanValue: false |

## Foundation_Record__c = true Usage

### Decision outcome of `Terminate_Flow`: `Yes_Terminate_Flow` — Yes, Terminate Flow

Logic: `or`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `$Record.Bypass_Validation__c` | IsChanged | booleanValue: true |
| 2 | `$Record.Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Terminate_Flow` | Terminate Flow? |
| Subflow | `Synch_Status` | Synch Status |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>66.0</apiVersion>
    <decisions>
        <name>Terminate_Flow</name>
        <label>Terminate Flow?</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnector>
            <targetReference>Synch_Status</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Run Flow</defaultConnectorLabel>
        <rules>
            <name>Yes_Terminate_Flow</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Bypass_Validation__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Foundation_Record__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <label>Yes, Terminate Flow</label>
        </rules>
    </decisions>
    <description>This flow will run last when the case is updated</description>
    <environments>Default</environments>
    <interviewLabel>Case - Updated Last Flow {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Case - Updated Last Flow</label>
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
        <locationX>0</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Terminate_Flow</targetReference>
        </connector>
        <filterLogic>(1 OR 2 OR 3 OR 4 OR 5 OR 6 OR 7) AND 8</filterLogic>
        <filters>
            <field>Status_Filtered__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Status</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Status_CS__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Status_General__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Status_Production__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Status_Digital__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>FD_Status__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Bypass_Validation__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </filters>
        <object>Case</object>
        <recordTriggerType>Update</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Obsolete</status>
    <subflows>
        <name>Synch_Status</name>
        <label>Synch Status</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <flowName>Case_Status_Subflow</flowName>
        <inputAssignments>
            <name>Case</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>CasePrior</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>IsNew</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
    </subflows>
    <triggerOrder>1500</triggerOrder>
</Flow>
```
