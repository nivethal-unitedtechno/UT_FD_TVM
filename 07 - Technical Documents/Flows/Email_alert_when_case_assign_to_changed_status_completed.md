# Flow: Email alert when case assign to changed & status completed

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Email_alert_when_case_assign_to_changed_status_completed` |
| Label | Email alert when case assign to changed & status completed |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | CreateAndUpdate |
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
| Decision | `Check_for_account_AT` | Check for account AT |
| Decision | `Check_for_case_assignment_and_status` | Check for case assignment and status |
| Decision | `Check_for_case_assignment_and_status1` | Check for case assignment and status |
| Decision | `Check_for_case_assignment_manager` | Check for case assignment manager |
| Decision | `Check_user_details` | Check user details |
| Update Records | `Update_Case_AT_Email` | Update Case AT Email |
| Update Records | `Update_Email_Field` | Update Email Field |
| Assignment | `Assgn_AT_Email_Value` | Assgn AT Email Value |
| Assignment | `Assign_Manager_Email` | Assign Manager Email |
| Action | `Email_notification_to_AT` | Email notification to AT |
| Action | `Email_when_case_assigned` | Email when case assigned |
| Action | `Email_when_case_is_closed` | Email when case is closed |
| Action | `Email_When_case_status_change_to_On_hold_to_In_Progress` | When case status change to On hold to In Progress. |
| Action | `Email_When_Status_change_from_Future_to_Assigned` | When Status change from Future to Assigned |
| Action | `Send_Email_to_Manager` | Send Email to Manager |
| Formula | `isNew` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <actionCalls>
        <name>Email_notification_to_AT</name>
        <label>Email notification to AT</label>
        <locationX>578</locationX>
        <locationY>1163</locationY>
        <actionName>Case.Notify_when_case_is_closed</actionName>
        <actionType>emailAlert</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.Notify_when_case_is_closed</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Email_when_case_assigned</name>
        <label>Email when case assigned</label>
        <locationX>842</locationX>
        <locationY>431</locationY>
        <actionName>Case.Notify_when_case_is_assigned</actionName>
        <actionType>emailAlert</actionType>
        <connector>
            <targetReference>Check_for_case_assignment_and_status1</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.Notify_when_case_is_assigned</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Email_when_case_is_closed</name>
        <label>Email when case is closed</label>
        <locationX>1106</locationX>
        <locationY>839</locationY>
        <actionName>Case.Notify_when_case_is_completed</actionName>
        <actionType>emailAlert</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.Notify_when_case_is_completed</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <description>When case status change to On hold to In Progress.</description>
        <name>Email_When_case_status_change_to_On_hold_to_In_Progress</name>
        <label>When case status change to On hold to In Progress.</label>
        <locationX>314</locationX>
        <locationY>731</locationY>
        <actionName>Case.When_case_status_change_to_On_hold_to_In_Progress</actionName>
        <actionType>emailAlert</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.When_case_status_change_to_On_hold_to_In_Progress</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <description>When Status change from Future to Assigned</description>
        <name>Email_When_Status_change_from_Future_to_Assigned</name>
        <label>When Status change from Future to Assigned</label>
        <locationX>50</locationX>
        <locationY>731</locationY>
        <actionName>Case.When_Status_change_from_Future_to_New</actionName>
        <actionType>emailAlert</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.When_Status_change_from_Future_to_New</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Send_Email_to_Manager</name>
        <label>Send Email to Manager</label>
        <locationX>1370</locationX>
        <locationY>1055</locationY>
        <actionName>Case.Demo_case_assignment_email</actionName>
        <actionType>emailAlert</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.Demo_case_assignment_email</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <apiVersion>57.0</apiVersion>
    <assignments>
        <name>Assgn_AT_Email_Value</name>
        <label>Assgn AT Email Value</label>
        <locationX>578</locationX>
        <locationY>947</locationY>
        <assignmentItems>
            <assignToReference>$Record.Account_Technician_Email__c</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record.Account.Account_Technician__r.Email</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case_AT_Email</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Assign_Manager_Email</name>
        <label>Assign Manager Email</label>
        <locationX>1370</locationX>
        <locationY>839</locationY>
        <assignmentItems>
            <assignToReference>$Record.Manager_email__c</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record.Owner:User.Manager.Email</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Email_Field</targetReference>
        </connector>
    </assignments>
    <decisions>
        <name>Check_for_account_AT</name>
        <label>Check for account AT</label>
        <locationX>710</locationX>
        <locationY>839</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Check_for_account_AT_s_id</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Account.Account_Technician__r.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Assgn_AT_Email_Value</targetReference>
            </connector>
            <label>Check for account AT&apos;s id</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_for_case_assignment_and_status</name>
        <label>Check for case assignment and status</label>
        <locationX>974</locationX>
        <locationY>323</locationY>
        <defaultConnector>
            <targetReference>Check_for_case_assignment_and_status1</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default outcome</defaultConnectorLabel>
        <rules>
            <name>Case_is_assigned</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Email_when_case_assigned</targetReference>
            </connector>
            <label>Case is assigned</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_for_case_assignment_and_status1</name>
        <label>Check for case assignment and status</label>
        <locationX>974</locationX>
        <locationY>623</locationY>
        <defaultConnectorLabel>Default outcome</defaultConnectorLabel>
        <rules>
            <name>When_Status_change_from_Future_to_Assigned</name>
            <conditionLogic>and</conditionLogic>
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
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Email_When_Status_change_from_Future_to_Assigned</targetReference>
            </connector>
            <label>When Status change from Future to Assigned</label>
        </rules>
        <rules>
            <name>When_case_status_change_to_On_hold_to_In_Progress</name>
            <conditionLogic>(1 OR 2 OR 4 ) AND 3 AND 5</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Internal Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>External Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>In Progress</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>isNew</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Email_When_case_status_change_to_On_hold_to_In_Progress</targetReference>
            </connector>
            <label>When case status change to On hold to In Progress.</label>
        </rules>
        <rules>
            <name>Case_is_closed</name>
            <conditionLogic>(1 OR 3) AND 2</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>isNew</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Check_user_details</targetReference>
            </connector>
            <label>Case is closed</label>
        </rules>
        <rules>
            <name>When_Case_Status_is_Ready_For_QA</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready For QA</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Check_for_case_assignment_manager</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>When Case Status is Ready For QA</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_for_case_assignment_manager</name>
        <label>Check for case assignment manager</label>
        <locationX>1502</locationX>
        <locationY>731</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Check_for_case_assignment_manager_id</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Owner:User.ManagerId</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Assign_Manager_Email</targetReference>
            </connector>
            <label>Check for case assignment manager id</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_user_details</name>
        <label>Check user details</label>
        <locationX>908</locationX>
        <locationY>731</locationY>
        <defaultConnector>
            <targetReference>Email_when_case_is_closed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Check_case_closed_user_is_AT</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$User.Id</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <elementReference>$Record.Account.Account_Technician__r.Id</elementReference>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Check_for_account_AT</targetReference>
            </connector>
            <label>Check case closed user is AT</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>isNew</name>
        <dataType>Boolean</dataType>
        <expression>ISNEW()</expression>
    </formulas>
    <interviewLabel>Email alert when case assign to changed &amp; status completed {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Email alert when case assign to changed &amp; status completed</label>
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
        <name>Update_Case_AT_Email</name>
        <label>Update Case AT Email</label>
        <locationX>578</locationX>
        <locationY>1055</locationY>
        <connector>
            <targetReference>Email_notification_to_AT</targetReference>
        </connector>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Email_Field</name>
        <label>Update Email Field</label>
        <locationX>1370</locationX>
        <locationY>947</locationY>
        <connector>
            <targetReference>Send_Email_to_Manager</targetReference>
        </connector>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>848</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Check_for_case_assignment_and_status</targetReference>
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
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
