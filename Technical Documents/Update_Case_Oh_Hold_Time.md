# Flow: Update Case On Hold Time

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Update_Case_Oh_Hold_Time` |
| Label | Update Case On Hold Time |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordBeforeSave |
| Record Trigger Type | CreateAndUpdate |
| Run In Mode | Default |
| API Version | 57.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Status_Filtered__c` | IsChanged | booleanValue: true |
| 2 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Status_Filtered__c` | IsChanged | booleanValue: true |
| 2 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Time_Update` | Time Update |
| Update Records | `From_On_Hold_To_Other` | From On Hold To Other |
| Update Records | `Update_case_time_field` | Update case time field |
| Formula | `CurrentTime` |  |
| Formula | `FromOnHoldToOther` |  |
| Formula | `OnHoldStatus` |  |
| Formula | `OnHoldStatus_Prior` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>57.0</apiVersion>
    <decisions>
        <name>Time_Update</name>
        <label>Time Update</label>
        <locationX>314</locationX>
        <locationY>287</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>If_Changed_to_On_Hold</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>OnHoldStatus_Prior</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>No</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>OnHoldStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Yes</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_case_time_field</targetReference>
            </connector>
            <label>If Changed to On Hold</label>
        </rules>
        <rules>
            <name>If_Changed_to_other_from_On_Hold</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>OnHoldStatus_Prior</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Yes</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>OnHoldStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>No</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>From_On_Hold_To_Other</targetReference>
            </connector>
            <label>If Changed to other from On Hold</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>CurrentTime</name>
        <dataType>DateTime</dataType>
        <expression>NOW()</expression>
    </formulas>
    <formulas>
        <name>FromOnHoldToOther</name>
        <dataType>DateTime</dataType>
        <expression>IF(  OR ( AND( CONTAINS(TEXT({!$Record__Prior.Status}),  &apos;On Hold&apos;)   , !CONTAINS(TEXT({!$Record.Status}), &apos;On Hold&apos;)  ) , 
AND( CONTAINS(TEXT({!$Record__Prior.Status}),  &apos;Ready for QA&apos;)   , !CONTAINS(TEXT({!$Record.Status}), &apos;Ready for QA&apos;)  )  ) , NOW() , null )</expression>
    </formulas>
    <formulas>
        <name>OnHoldStatus</name>
        <dataType>String</dataType>
        <expression>IF( OR (  CONTAINS(TEXT({!$Record.Status}), &apos;On Hold&apos;) ,  CONTAINS(TEXT({!$Record.Status}), &apos;Ready for QA&apos;) )  , &apos;Yes&apos;, &apos;No&apos;)</expression>
    </formulas>
    <formulas>
        <name>OnHoldStatus_Prior</name>
        <dataType>String</dataType>
        <expression>IF( OR (  CONTAINS(TEXT({!$Record__Prior.Status}), &apos;On Hold&apos;)  ,  CONTAINS(TEXT({!$Record__Prior.Status}), &apos;Ready for QA&apos;)  )  , &apos;Yes&apos;, &apos;No&apos;)</expression>
    </formulas>
    <interviewLabel>Update Case Oh Hold Time {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Update Case On Hold Time</label>
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
        <name>From_On_Hold_To_Other</name>
        <label>From On Hold To Other</label>
        <locationX>314</locationX>
        <locationY>395</locationY>
        <inputAssignments>
            <field>Change_from_On_Hold_to_Other__c</field>
            <value>
                <elementReference>CurrentTime</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_case_time_field</name>
        <label>Update case time field</label>
        <locationX>50</locationX>
        <locationY>395</locationY>
        <inputAssignments>
            <field>Change_to_on_Hold_Time__c</field>
            <value>
                <elementReference>CurrentTime</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>188</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Time_Update</targetReference>
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
            <field>Foundation_Record__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <object>Case</object>
        <recordTriggerType>CreateAndUpdate</recordTriggerType>
        <triggerType>RecordBeforeSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
