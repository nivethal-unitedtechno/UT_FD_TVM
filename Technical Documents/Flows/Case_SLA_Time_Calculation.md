# Flow: Case SLA Time Calculation

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Case_SLA_Time_Calculation` |
| Label | Case SLA Time Calculation |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | CreateAndUpdate |
| Run In Mode | Default |
| API Version | 64.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Status_Filtered__c` | NotEqualTo | stringValue: Closed |
| 2 | `Close_Date__c` | IsNull | booleanValue: true |
| 3 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Status_Filtered__c` | NotEqualTo | stringValue: Closed |
| 2 | `Close_Date__c` | IsNull | booleanValue: true |
| 3 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Copy_1_of_Priority` | Priority |
| Decision | `Is_it_Live_Client_or_New_Campaign_Case_Request_Type` | Is it Live Client or New Campaign Case Request Type |
| Decision | `Priority_1` | Priority |
| Decision | `Priority_2` | Priority |
| Decision | `Request_Type_or_Priority_Changed` | Request Type or Priority Changed? |
| Get Records | `Get_Custom_Setting_Record` | Get Custom Setting Record |
| Update Records | `Update_Case` | Update Case |
| Assignment | `Copy_1_of_If_High` | If High |
| Assignment | `Copy_1_of_If_Low` | If Low |
| Assignment | `Copy_1_of_If_Medium` | If Medium |
| Assignment | `Copy_1_of_If_Type_Priority_None` | If Type Priority None |
| Assignment | `If_High_1` | If High |
| Assignment | `If_High_2` | High |
| Assignment | `If_Low_1` | If Low |
| Assignment | `If_Low_2` | If Low |
| Assignment | `If_Medium_1` | If Medium |
| Assignment | `If_Medium_2` | If Medium |
| Assignment | `If_Type_Priority_None_1` | If Type Priority None |
| Assignment | `If_Type_Priority_None_2` | If Type Priority None |
| Formula | `HighPriority` |  |
| Formula | `HighPriority_SLA_Custom_Campaign` |  |
| Formula | `IsNewRecord` |  |
| Formula | `Low_Priority_Custom_campaign` |  |
| Formula | `LowPriority` |  |
| Formula | `MediumPriority` |  |
| Variable | `MediumPriority_SLA_Custom_Campaigns` |  |
| Variable | `SLATimeToUpdate` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>64.0</apiVersion>
    <assignments>
        <name>Copy_1_of_If_High</name>
        <label>If High</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <numberValue>32.0</numberValue>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <description>If Low</description>
        <name>Copy_1_of_If_Low</name>
        <label>If Low</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <numberValue>32.0</numberValue>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Copy_1_of_If_Medium</name>
        <label>If Medium</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <numberValue>32.0</numberValue>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Copy_1_of_If_Type_Priority_None</name>
        <label>If Type Priority None</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>If_High_1</name>
        <label>If High</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>MediumPriority_SLA_Custom_Campaigns</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>If_High_2</name>
        <label>High</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>HighPriority</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <description>If Low</description>
        <name>If_Low_1</name>
        <label>If Low</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>MediumPriority_SLA_Custom_Campaigns</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <description>If Low</description>
        <name>If_Low_2</name>
        <label>If Low</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>LowPriority</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>If_Medium_1</name>
        <label>If Medium</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>MediumPriority_SLA_Custom_Campaigns</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>If_Medium_2</name>
        <label>If Medium</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>MediumPriority</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>If_Type_Priority_None_1</name>
        <label>If Type Priority None</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>If_Type_Priority_None_2</name>
        <label>If Type Priority None</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignmentItems>
            <assignToReference>SLATimeToUpdate</assignToReference>
            <operator>Assign</operator>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <decisions>
        <name>Copy_1_of_Priority</name>
        <label>Priority</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnector>
            <targetReference>Copy_1_of_If_Type_Priority_None</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Copy_1_of_High</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>High</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_If_High</targetReference>
            </connector>
            <label>High</label>
        </rules>
        <rules>
            <name>Copy_1_of_Low</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Low</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue></stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_If_Low</targetReference>
            </connector>
            <label>Low</label>
        </rules>
        <rules>
            <name>Copy_1_of_Medium</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Medium</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue></stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_If_Medium</targetReference>
            </connector>
            <label>Medium</label>
        </rules>
    </decisions>
    <decisions>
        <name>Is_it_Live_Client_or_New_Campaign_Case_Request_Type</name>
        <label>Is it Live Client or New Campaign Case Request Type</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnector>
            <targetReference>Priority_2</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_New_Campaign</name>
            <conditionLogic>(1 OR 2) AND 3</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Get_Me_More_Campaigns__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Client_Requested_Campaigns__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>New Campaign Request</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Priority_1</targetReference>
            </connector>
            <label>Yes New Campaign</label>
        </rules>
        <rules>
            <name>Is_it_Live_Client</name>
            <conditionLogic>(1 OR 2)AND 3</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Get_Me_More_Campaigns__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Client_Requested_Campaigns__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Live Client - New Product Launch</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Priority</targetReference>
            </connector>
            <label>Is it Live Client</label>
        </rules>
    </decisions>
    <decisions>
        <name>Priority_1</name>
        <label>Priority</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnector>
            <targetReference>If_Type_Priority_None_1</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>High_1</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>High</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>If_High_1</targetReference>
            </connector>
            <label>High</label>
        </rules>
        <rules>
            <name>Low_1</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Low</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue></stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>If_Low_1</targetReference>
            </connector>
            <label>Low</label>
        </rules>
        <rules>
            <name>Medium_1</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Medium</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue></stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>If_Medium_1</targetReference>
            </connector>
            <label>Medium</label>
        </rules>
    </decisions>
    <decisions>
        <name>Priority_2</name>
        <label>Priority</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnector>
            <targetReference>If_Type_Priority_None_2</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>High_2</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>High</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue></stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>If_High_2</targetReference>
            </connector>
            <label>High</label>
        </rules>
        <rules>
            <name>Low_2</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Low</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue></stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>If_Low_2</targetReference>
            </connector>
            <label>Low</label>
        </rules>
        <rules>
            <name>Medium_2</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Medium</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue></stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>If_Medium_2</targetReference>
            </connector>
            <label>Medium</label>
        </rules>
    </decisions>
    <decisions>
        <name>Request_Type_or_Priority_Changed</name>
        <label>Request Type or Priority Changed?</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Priority</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>IsNewRecord</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Custom_Setting_Record</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>HighPriority</name>
        <dataType>Number</dataType>
        <expression>{!Get_Custom_Setting_Record.SLA_Estimated_Time__c} / 2</expression>
        <scale>2</scale>
    </formulas>
    <formulas>
        <name>HighPriority_SLA_Custom_Campaign</name>
        <dataType>Number</dataType>
        <expression>{!MediumPriority_SLA_Custom_Campaigns}/2</expression>
        <scale>2</scale>
    </formulas>
    <formulas>
        <name>IsNewRecord</name>
        <dataType>Boolean</dataType>
        <expression>ISNEW()</expression>
    </formulas>
    <formulas>
        <name>Low_Priority_Custom_campaign</name>
        <dataType>Number</dataType>
        <expression>{!MediumPriority_SLA_Custom_Campaigns}*2</expression>
        <scale>2</scale>
    </formulas>
    <formulas>
        <name>LowPriority</name>
        <dataType>Number</dataType>
        <expression>{!Get_Custom_Setting_Record.SLA_Estimated_Time__c} * 2</expression>
        <scale>2</scale>
    </formulas>
    <formulas>
        <name>MediumPriority</name>
        <dataType>Number</dataType>
        <expression>{!Get_Custom_Setting_Record.SLA_Estimated_Time__c}</expression>
        <scale>2</scale>
    </formulas>
    <interviewLabel>Case SLA Time Calculation {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Case SLA Time Calculation</label>
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
    <recordLookups>
        <name>Get_Custom_Setting_Record</name>
        <label>Get Custom Setting Record</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Is_it_Live_Client_or_New_Campaign_Case_Request_Type</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>CaseType__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.Case_Request__c</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>SLA_Time_Calculation__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordUpdates>
        <name>Update_Case</name>
        <label>Update Case</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <inputAssignments>
            <field>SLA_Time__c</field>
            <value>
                <elementReference>SLATimeToUpdate</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Request_Type_or_Priority_Changed</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Status_Filtered__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Closed</stringValue>
            </value>
        </filters>
        <filters>
            <field>Close_Date__c</field>
            <operator>IsNull</operator>
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
    <variables>
        <name>MediumPriority_SLA_Custom_Campaigns</name>
        <dataType>Number</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <scale>2</scale>
        <value>
            <numberValue>24.0</numberValue>
        </value>
    </variables>
    <variables>
        <name>SLATimeToUpdate</name>
        <dataType>Number</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>true</isOutput>
        <scale>2</scale>
    </variables>
</Flow>
```
