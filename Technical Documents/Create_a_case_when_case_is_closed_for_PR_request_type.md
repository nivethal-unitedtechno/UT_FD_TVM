# Flow: Create a case when case is closed

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Create_a_case_when_case_is_closed_for_PR_request_type` |
| Label | Create a case when case is closed |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | Update |
| Run In Mode | Default |
| API Version | 60.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `(1 OR 4 OR 5) AND 2 AND 3 AND 6`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Foundation_Request_Type__c` | EqualTo | stringValue: Performance Review |
| 2 | `Status_Filtered__c` | IsChanged | booleanValue: true |
| 3 | `Status_Filtered__c` | EqualTo | stringValue: Closed |
| 4 | `Foundation_Request_Type__c` | EqualTo | stringValue: Data Deep Dive |
| 5 | `Foundation_Request_Type__c` | EqualTo | stringValue: AT Monthly Deep Dive |
| 6 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `(1 OR 4 OR 5) AND 2 AND 3 AND 6`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Foundation_Request_Type__c` | EqualTo | stringValue: Performance Review |
| 2 | `Status_Filtered__c` | IsChanged | booleanValue: true |
| 3 | `Status_Filtered__c` | EqualTo | stringValue: Closed |
| 4 | `Foundation_Request_Type__c` | EqualTo | stringValue: Data Deep Dive |
| 5 | `Foundation_Request_Type__c` | EqualTo | stringValue: AT Monthly Deep Dive |
| 6 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Check_for_old_status` | Check for old status |
| Decision | `Check_request_type_Record_id` | Check request type & Record id |
| Get Records | `Get_roles_for_VP_of_BI` | Get roles for VP of BI |
| Update Records | `Update_close_date_of_existing_case` | Update close date of existing case |
| Create Records | `Create_a_new_case` | Create a new case |
| Create Records | `Create_a_new_case_for_AT_Monthly_Deep_Dive` | Create a new case for AT Monthly Deep Dive |
| Create Records | `Create_a_new_case_for_Data_Deep_Dive` | Create a new case for Data Deep Dive |
| Create Records | `create_new_case_with_status` | create new case with status |
| Formula | `CaseOwnerId` |  |
| Text Template | `DescriptionText_ATMonthlyDeepDive` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>60.0</apiVersion>
    <decisions>
        <name>Check_for_old_status</name>
        <label>Check for old status</label>
        <locationX>182</locationX>
        <locationY>647</locationY>
        <defaultConnector>
            <targetReference>Create_a_new_case</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>If_Old_Status_is_Recurring_Meeting</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Recurring Meeting</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>create_new_case_with_status</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>If Old Status is Recurring Meeting</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_request_type_Record_id</name>
        <label>Check request type &amp; Record id</label>
        <locationX>776</locationX>
        <locationY>539</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Request_type_PR_and_Record_type_PR</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Account.Type__c</leftValueReference>
                <operator>Contains</operator>
                <rightValue>
                    <stringValue>Digital Advertising</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Performance Review</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.RecordTypeId</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>012Vb000007oEJwIAM</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Check_for_old_status</targetReference>
            </connector>
            <label>Request type = PR and Record type = PR</label>
        </rules>
        <rules>
            <name>Request_type_PR_and_Record_type_BI</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Performance Review</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.RecordTypeId</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>012Nx000002jCaAIAU</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <label>Request type = PR and Record type = BI</label>
        </rules>
        <rules>
            <name>Request_type_Data_Deep_Dive_and_Record_type_NCM_Meetings</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Data Deep Dive</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.RecordTypeId</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>012Nx0000030jD7IAI</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Create_a_new_case_for_Data_Deep_Dive</targetReference>
            </connector>
            <label>Request type = Data Deep Dive and Record type = NCM Meetings</label>
        </rules>
        <rules>
            <name>Request_type_AT_Monthly_Deep_Dive_and_Record_type_CS</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Foundation_Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>AT Monthly Deep Dive</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.RecordTypeId</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>012Vb000007oEJtIAM</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Create_a_new_case_for_AT_Monthly_Deep_Dive</targetReference>
            </connector>
            <label>Request type = AT Monthly Deep Dive and Record type = CS</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>CaseOwnerId</name>
        <dataType>String</dataType>
        <expression>IF(ISNULL({!$Record.Account.Regional_performance_manager__r.ManagerId}), &apos;005Vb00000Co2VxIAJ&apos;, {!$Record.Account.Regional_performance_manager__r.ManagerId})</expression>
    </formulas>
    <interviewLabel>Create a case when case is closed for PR request type {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Create a case when case is closed</label>
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
    <recordCreates>
        <name>Create_a_new_case</name>
        <label>Create a new case</label>
        <locationX>314</locationX>
        <locationY>755</locationY>
        <inputAssignments>
            <field>AccountId</field>
            <value>
                <elementReference>$Record.Account.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case_Assign_To__c</field>
            <value>
                <elementReference>$Record.Account.Regional_Performance_Manager__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Foundation_Request_Type__c</field>
            <value>
                <stringValue>Performance Review</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Origin</field>
            <value>
                <stringValue>Salesforce</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>CaseOwnerId</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Priority</field>
            <value>
                <stringValue>Medium</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>RecordTypeId</field>
            <value>
                <stringValue>012Vb000007oEJwIAM</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Filtered__c</field>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Subject</field>
            <value>
                <stringValue>Performance Review</stringValue>
            </value>
        </inputAssignments>
        <object>Case</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordCreates>
    <recordCreates>
        <name>Create_a_new_case_for_AT_Monthly_Deep_Dive</name>
        <label>Create a new case for AT Monthly Deep Dive</label>
        <locationX>1106</locationX>
        <locationY>647</locationY>
        <inputAssignments>
            <field>AccountId</field>
            <value>
                <elementReference>$Record.Account.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case_Assign_To__c</field>
            <value>
                <elementReference>$Record.Account.Secondary_Account_Technician__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Description</field>
            <value>
                <elementReference>DescriptionText_ATMonthlyDeepDive</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Foundation_Request_Type__c</field>
            <value>
                <stringValue>AT Monthly Deep Dive</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Origin</field>
            <value>
                <stringValue>Salesforce</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$Record.Account.Regional_Performance_Manager__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Priority</field>
            <value>
                <stringValue>Medium</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>RecordTypeId</field>
            <value>
                <stringValue>012Vb000007oEJtIAM</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Filtered__c</field>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Subject</field>
            <value>
                <stringValue>Monthly Deep Dive</stringValue>
            </value>
        </inputAssignments>
        <object>Case</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordCreates>
    <recordCreates>
        <name>Create_a_new_case_for_Data_Deep_Dive</name>
        <label>Create a new case for Data Deep Dive</label>
        <locationX>842</locationX>
        <locationY>647</locationY>
        <inputAssignments>
            <field>AccountId</field>
            <value>
                <elementReference>$Record.Account.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Description</field>
            <value>
                <stringValue>Recurring meeting with NCM 20 Group</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Foundation_Request_Type__c</field>
            <value>
                <stringValue>Data Deep Dive</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Origin</field>
            <value>
                <stringValue>Salesforce</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_roles_for_VP_of_BI.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Priority</field>
            <value>
                <stringValue>Medium</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>RecordTypeId</field>
            <value>
                <stringValue>012Nx0000030jD7IAI</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Filtered__c</field>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Subject</field>
            <value>
                <stringValue>Data Deep Dive</stringValue>
            </value>
        </inputAssignments>
        <object>Case</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordCreates>
    <recordCreates>
        <name>create_new_case_with_status</name>
        <label>create new case with status</label>
        <locationX>50</locationX>
        <locationY>755</locationY>
        <inputAssignments>
            <field>AccountId</field>
            <value>
                <elementReference>$Record.Account.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case_Assign_To__c</field>
            <value>
                <elementReference>$Record.Account.Regional_Performance_Manager__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Foundation_Request_Type__c</field>
            <value>
                <stringValue>Performance Review</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Origin</field>
            <value>
                <stringValue>Salesforce</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>CaseOwnerId</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Priority</field>
            <value>
                <stringValue>Medium</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>RecordTypeId</field>
            <value>
                <stringValue>012Vb000007oEJwIAM</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Filtered__c</field>
            <value>
                <stringValue>Recurring Meeting</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Subject</field>
            <value>
                <stringValue>Performance Review</stringValue>
            </value>
        </inputAssignments>
        <object>Case</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordCreates>
    <recordLookups>
        <name>Get_roles_for_VP_of_BI</name>
        <label>Get roles for VP of BI</label>
        <locationX>776</locationX>
        <locationY>431</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Check_request_type_Record_id</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>UserRoleId</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>00ENx000001Mw9dMAC</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>User</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordUpdates>
        <name>Update_close_date_of_existing_case</name>
        <label>Update close date of existing case</label>
        <locationX>776</locationX>
        <locationY>323</locationY>
        <connector>
            <targetReference>Get_roles_for_VP_of_BI</targetReference>
        </connector>
        <inputAssignments>
            <field>Close_Date__c</field>
            <value>
                <elementReference>$Flow.CurrentDate</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>650</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Update_close_date_of_existing_case</targetReference>
        </connector>
        <filterLogic>(1 OR 4 OR 5) AND 2 AND 3 AND 6</filterLogic>
        <filters>
            <field>Foundation_Request_Type__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Performance Review</stringValue>
            </value>
        </filters>
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
                <stringValue>Closed</stringValue>
            </value>
        </filters>
        <filters>
            <field>Foundation_Request_Type__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Data Deep Dive</stringValue>
            </value>
        </filters>
        <filters>
            <field>Foundation_Request_Type__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>AT Monthly Deep Dive</stringValue>
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
        <recordTriggerType>Update</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
    <textTemplates>
        <name>DescriptionText_ATMonthlyDeepDive</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>Monthly Deep Dive Instructions: https://docs.google.com/document/d/1nyOsjq0hf4Gq4RoTfQmm_Z4goriylKhgnNOntFxxQGA/edit?tab=t.0 
What&apos;s Going Well?
What Needs Monitoring?
What Changes Did We Implement?
What Recommendations Are There?</text>
    </textTemplates>
</Flow>
```
