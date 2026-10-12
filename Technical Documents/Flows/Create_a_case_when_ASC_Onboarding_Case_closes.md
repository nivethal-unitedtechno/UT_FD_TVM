# Flow: Create a case when ASC Onboarding Case closes.

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Create_a_case_when_ASC_Onboarding_Case_closes` |
| Label | Create a case when ASC Onboarding Case closes. |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | Update |
| Run In Mode | Default |
| API Version | 65.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `(1 AND 2) AND (3 OR 4)`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |
| 2 | `Status_Filtered__c` | EqualTo | stringValue: Closed |
| 3 | `Case_Request__c` | EqualTo | stringValue: Onboarding: ASC Event Approval |
| 4 | `Case_Request__c` | EqualTo | stringValue: Onboarding: 3rd Party Vendor Email Outreach |

Scheduled paths:

- `After_5_days` — After 5 days (offset 5 Days from RecordField)

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `(1 AND 2) AND (3 OR 4)`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |
| 2 | `Status_Filtered__c` | EqualTo | stringValue: Closed |
| 3 | `Case_Request__c` | EqualTo | stringValue: Onboarding: ASC Event Approval |
| 4 | `Case_Request__c` | EqualTo | stringValue: Onboarding: 3rd Party Vendor Email Outreach |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Check_the_request_type` | Check the request type |
| Decision | `Check_the_request_type_event_confirmation` | Check the request type - event confirmation |
| Create Records | `Create_Case_for_ASC_Event_Confirmation` | Create Case for ASC Event Confirmation |
| Create Records | `Create_Case_for_Website_Vendor_Email_Outreach` | Create Case for Website Vendor Email Outreach |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>65.0</apiVersion>
    <decisions>
        <name>Check_the_request_type</name>
        <label>Check the request type</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Request_type_Event_approval</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Onboarding: ASC Event Approval</stringValue>
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
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Create_Case_for_Website_Vendor_Email_Outreach</targetReference>
            </connector>
            <label>Request type = Event approval</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_the_request_type_event_confirmation</name>
        <label>Check the request type - event confirmation</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Outcome_1_of_Decision_2</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Onboarding: 3rd Party Vendor Email Outreach</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Create_Case_for_ASC_Event_Confirmation</targetReference>
            </connector>
            <label>Outcome 1 of Decision 2</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <interviewLabel>Create a case when ASC Onboarding Case closes. {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Create a case when ASC Onboarding Case closes.</label>
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
        <name>Create_Case_for_ASC_Event_Confirmation</name>
        <label>Create Case for ASC Event Confirmation</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <inputAssignments>
            <field>AccountId</field>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case_Assign_To__c</field>
            <value>
                <stringValue>005Vb00000IPiY9IAL</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case_Request__c</field>
            <value>
                <stringValue>Onboarding: ASC Event Confirmation</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Description</field>
            <value>
                <stringValue>Confirm ASC events from the Website Provider and Vendors are coming into GA4</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Origin</field>
            <value>
                <stringValue>Internal</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <stringValue>005Vb00000FAkqXIAT</stringValue>
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
                <stringValue>Confirm ASC events from Web Provider + Vendors</stringValue>
            </value>
        </inputAssignments>
        <object>Case</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordCreates>
    <recordCreates>
        <name>Create_Case_for_Website_Vendor_Email_Outreach</name>
        <label>Create Case for Website Vendor Email Outreach</label>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <inputAssignments>
            <field>AccountId</field>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case_Assign_To__c</field>
            <value>
                <stringValue>005Vb00000IPiY9IAL</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case_Request__c</field>
            <value>
                <stringValue>Onboarding: 3rd Party Vendor Email Outreach</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Description</field>
            <value>
                <stringValue>Email the 3rd Party Vendor Tools on the website to pass ASC events</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Origin</field>
            <value>
                <stringValue>Internal</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <stringValue>005Vb00000FAkqXIAT</stringValue>
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
                <stringValue>Email 3rd Party Vendors to pass ASC Events for Measurement and Reporting</stringValue>
            </value>
        </inputAssignments>
        <object>Case</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordCreates>
    <start>
        <locationX>0</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Check_the_request_type</targetReference>
        </connector>
        <filterLogic>(1 AND 2) AND (3 OR 4)</filterLogic>
        <filters>
            <field>Foundation_Record__c</field>
            <operator>EqualTo</operator>
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
            <field>Case_Request__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Onboarding: ASC Event Approval</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Onboarding: 3rd Party Vendor Email Outreach</stringValue>
            </value>
        </filters>
        <object>Case</object>
        <recordTriggerType>Update</recordTriggerType>
        <scheduledPaths>
            <name>After_5_days</name>
            <connector>
                <targetReference>Check_the_request_type_event_confirmation</targetReference>
            </connector>
            <label>After 5 days</label>
            <offsetNumber>5</offsetNumber>
            <offsetUnit>Days</offsetUnit>
            <recordField>Closed_Date_Only__c</recordField>
            <timeSource>RecordField</timeSource>
        </scheduledPaths>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
