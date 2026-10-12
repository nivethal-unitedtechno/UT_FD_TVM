# Flow: Dynamic Hours Calculation

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Dynamic_Hours_Calculation` |
| Label | Dynamic Hours Calculation |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | CreateAndUpdate |
| Run In Mode | Default |
| API Version | 67.0 |
| Description | _None_ |

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
| Decision | `Was_Case_Status_Changed` | Was Case Status Changed ? |
| Update Records | `Update_Records_1` | Update Records |
| Assignment | `Store_Ready_for_QA_Hours` | Store Ready for QA Hours |
| Assignment | `Store_the_Closed_Hours` | Store the Closed Hours |
| Assignment | `Store_the_External_Feedback_Hours` | Store the External Feedback Hours |
| Assignment | `Store_the_Internal_Feedback_Hours` | Store the Internal Feedback Hours |
| Assignment | `Store_the_Unassigned_hours` | Store the Unassigned hours |
| Assignment | `Store_the_Workday_hours` | Store the Workday hours |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>67.0</apiVersion>
    <assignments>
        <name>Store_Ready_for_QA_Hours</name>
        <label>Store Ready for QA Hours</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>$Record.Dynamic_Ready_for_QA_Workhours__c</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Dynamic_WorkHour_Stamp__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Records_1</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Store_the_Closed_Hours</name>
        <label>Store the Closed Hours</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>$Record.Dynamic_Closed_Workday_Hours__c</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Dynamic_WorkHour_Stamp__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Records_1</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Store_the_External_Feedback_Hours</name>
        <label>Store the External Feedback Hours</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>$Record.Dynamic_External_Feedback_Workhours__c</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Dynamic_WorkHour_Stamp__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Records_1</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Store_the_Internal_Feedback_Hours</name>
        <label>Store the Internal Feedback Hours</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>$Record.Internal_Feedback_Workhours__c</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Dynamic_WorkHour_Stamp__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Records_1</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Store_the_Unassigned_hours</name>
        <label>Store the Unassigned hours</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>$Record.Dynamic_Workday_Hours_Unassigned__c</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Dynamic_WorkHour_Stamp__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Records_1</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Store_the_Workday_hours</name>
        <label>Store the Workday hours</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>$Record.Dynamic_Support_Workday_Hours__c</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Dynamic_WorkHour_Stamp__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Records_1</targetReference>
        </connector>
    </assignments>
    <decisions>
        <name>Was_Case_Status_Changed</name>
        <label>Was Case Status Changed ?</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Case_Status_is_Assigned</name>
            <conditionLogic>( 1 OR 2) AND 3</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>New</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Future</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Assigned</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Store_the_Unassigned_hours</targetReference>
            </connector>
            <label>Case Status is Assigned</label>
        </rules>
        <rules>
            <name>To_log_regular_time</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Assigned</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>In Progress</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Internal Feedback Provided</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>External Feedback Provided</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Store_the_Workday_hours</targetReference>
            </connector>
            <label>To log regular time</label>
        </rules>
        <rules>
            <name>Internal_Feedback_Needed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Internal Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Store_the_Internal_Feedback_Hours</targetReference>
            </connector>
            <label>Internal Feedback Needed</label>
        </rules>
        <rules>
            <name>External_Feedback_Needed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>External Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Store_the_External_Feedback_Hours</targetReference>
            </connector>
            <label>External Feedback Needed</label>
        </rules>
        <rules>
            <name>Ready_for_QA</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready For QA</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Store_Ready_for_QA_Hours</targetReference>
            </connector>
            <label>Ready for QA</label>
        </rules>
        <rules>
            <name>Closed</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Cancelled</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Store_the_Closed_Hours</targetReference>
            </connector>
            <label>Closed</label>
        </rules>
    </decisions>
    <environments>Default</environments>
    <interviewLabel>Dynamic Hours Calculation {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Dynamic Hours Calculation</label>
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
        <name>Update_Records_1</name>
        <label>Update Records</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <inputAssignments>
            <field>Dynamic_Time_Start_Date_Time__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Was_Case_Status_Changed</targetReference>
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
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
