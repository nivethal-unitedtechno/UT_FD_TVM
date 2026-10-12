# Flow: Case Assignment Process

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Case_Assignment_Process` |
| Label | Case Assignment Process |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordBeforeSave |
| Record Trigger Type | CreateAndUpdate |
| Run In Mode | Default |
| API Version | 58.0 |
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
| Decision | `Check_Status_value` | Check Status value |
| Decision | `Decision_3` | Is Campaigns True |
| Decision | `Is_it_Live_Client_or_New_Campaign_Request` | Is it Live Client or New Campaign Request ? |
| Get Records | `Get_Account_details` | Get Account details |
| Get Records | `Get_Case_Routing_Config` | Get Case Routing Config |
| Assignment | `Assign_Case_assignment_user_case_assignment` | Assign Case assignment user & case assignment |
| Assignment | `Assign_case_user` | Assign case user |
| Assignment | `Copy_1_of_Assign_Case_assignment_user_case_assignment` | Assign Case assignment user & case assignment |
| Formula | `CaseAssignmentUser` |  |
| Formula | `IsNew` |  |
| Formula | `OwnerManagerOrCurrentOwner` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>58.0</apiVersion>
    <assignments>
        <name>Assign_Case_assignment_user_case_assignment</name>
        <label>Assign Case assignment user &amp; case assignment</label>
        <locationX>578</locationX>
        <locationY>719</locationY>
        <assignmentItems>
            <assignToReference>$Record.Case_Assignment_User__c</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record.OwnerId</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>$Record.OwnerId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>Get_Account_details.Secondary_Account_Technician__c</elementReference>
            </value>
        </assignmentItems>
    </assignments>
    <assignments>
        <name>Assign_case_user</name>
        <label>Assign case user</label>
        <locationX>842</locationX>
        <locationY>611</locationY>
        <assignmentItems>
            <assignToReference>$Record.OwnerId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>CaseAssignmentUser</elementReference>
            </value>
        </assignmentItems>
    </assignments>
    <assignments>
        <name>Copy_1_of_Assign_Case_assignment_user_case_assignment</name>
        <label>Assign Case assignment user &amp; case assignment</label>
        <locationX>50</locationX>
        <locationY>827</locationY>
        <assignmentItems>
            <assignToReference>$Record.Case_Assignment_User__c</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record.OwnerId</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>$Record.OwnerId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>Get_Account_details.Secondary_Account_Technician__c</elementReference>
            </value>
        </assignmentItems>
    </assignments>
    <decisions>
        <name>Check_Status_value</name>
        <label>Check Status value</label>
        <locationX>743</locationX>
        <locationY>503</locationY>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Status_is_ready_to_qa_Other_Cases</name>
            <conditionLogic>1 AND (2 OR 3) AND 4</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready for QA</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>IsNew</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>Get_Case_Routing_Config</leftValueReference>
                <operator>IsEmpty</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Is_it_Live_Client_or_New_Campaign_Request</targetReference>
            </connector>
            <label>Status is ready to qa_Other Cases</label>
        </rules>
        <rules>
            <name>Status_is_closed</name>
            <conditionLogic>1 AND (2 OR 3) AND 4</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>IsNew</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready for QA</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Assign_case_user</targetReference>
            </connector>
            <label>Status is closed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Decision_3</name>
        <label>Is Campaigns True</label>
        <locationX>182</locationX>
        <locationY>719</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Value_Present</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Get_Me_More_Campaigns__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Client_Requested_Campaigns__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Assign_Case_assignment_user_case_assignment</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <decisions>
        <name>Is_it_Live_Client_or_New_Campaign_Request</name>
        <label>Is it Live Client or New Campaign Request ?</label>
        <locationX>380</locationX>
        <locationY>611</locationY>
        <defaultConnector>
            <targetReference>Assign_Case_assignment_user_case_assignment</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Live Client - New Product Launch</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>New Campaign Request – Launch A New Campaign For Existing Product</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Decision_3</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>CaseAssignmentUser</name>
        <dataType>String</dataType>
        <expression>IF(ISBLANK({!$Record.Case_Assignment_User__c}), {!$Record.OwnerId}, {!$Record.Case_Assignment_User__c})</expression>
    </formulas>
    <formulas>
        <name>IsNew</name>
        <dataType>Boolean</dataType>
        <expression>ISNEW()</expression>
    </formulas>
    <formulas>
        <name>OwnerManagerOrCurrentOwner</name>
        <dataType>String</dataType>
        <expression>IF(ISBLANK({!$Record.Owner:User.ManagerId}), {!$Record.OwnerId}, {!$Record.Owner:User.ManagerId})</expression>
    </formulas>
    <interviewLabel>Case Assignment Process {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Case Assignment Process</label>
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
        <name>Get_Account_details</name>
        <label>Get Account details</label>
        <locationX>743</locationX>
        <locationY>395</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Check_Status_value</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Secondary_Account_Technician__c</field>
            <operator>IsNull</operator>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Account</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Case_Routing_Config</name>
        <label>Get Case Routing Config</label>
        <locationX>743</locationX>
        <locationY>287</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Get_Account_details</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Active__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Request_Type__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.Case_Request__c</elementReference>
            </value>
        </filters>
        <filters>
            <field>Auto_QA_Assignment__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <getFirstRecordOnly>false</getFirstRecordOnly>
        <object>Case_Routing_Config__mdt</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <start>
        <locationX>617</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Get_Case_Routing_Config</targetReference>
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
        <recordTriggerType>CreateAndUpdate</recordTriggerType>
        <triggerType>RecordBeforeSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
