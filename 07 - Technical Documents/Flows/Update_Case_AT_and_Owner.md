# Flow: Update Case AT and Owner

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Update_Case_AT_and_Owner` |
| Label | Update Case AT and Owner |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | Create |
| Run In Mode | Default |
| API Version | 57.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `(1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16 AND 17 AND 18 AND 19 AND 20 AND 21 AND 22 AND 23 AND 24 AND 25 AND 26 AND 27 AND 28 AND 29 AND 30 AND 31 AND 32 AND 33 AND 34 AND 35 AND 36 AND 37 AND 38 AND 39 AND 40 AND 41 AND 42 AND 43) OR (1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16 AND 17 AND 18 AND 19 AND 20 AND 21 AND 22 AND 23 AND 24 AND 25 AND 26 AND 27 AND 28 AND 29 AND 30 AND 31 AND 32 AND 33 AND 34 AND 35 AND 36 AND 38 AND 39 AND 40 AND 41 AND 42 AND 43 AND 44)`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Case_Request__c` | NotEqualTo | stringValue: Dealer Cancellation - Remove Looker Credentials |
| 2 | `Case_Request__c` | NotEqualTo | stringValue: Launch Day QA |
| 3 | `Case_Request__c` | NotEqualTo | stringValue: 7 Launch Day QA |
| 4 | `Case_Request__c` | NotEqualTo | stringValue: 14 Launch Day QA |
| 5 | `Case_Request__c` | NotEqualTo | stringValue: Pod Leader - Account Launch QA |
| 6 | `Case_Request__c` | NotEqualTo | stringValue: Weekly QA |
| 7 | `Case_Request__c` | NotEqualTo | stringValue: Facebook Not Yet Live |
| 8 | `Case_Request__c` | NotEqualTo | stringValue: Reset Facebook Budgets |
| 9 | `Case_Request__c` | NotEqualTo | stringValue: Account Cancellation - Account Cancelled: Run Final Payments "Day after Last Day of Service" |
| 10 | `Case_Request__c` | NotEqualTo | stringValue: Winter Sales Event Material |
| 11 | `Case_Request__c` | NotEqualTo | stringValue: President's Day Sales Event Material |
| 12 | `Case_Request__c` | NotEqualTo | stringValue: Monthly Search Term Audit |
| 13 | `Case_Request__c` | NotEqualTo | stringValue: Performance Review |
| 14 | `Case_Request__c` | NotEqualTo | stringValue: Vehicle Ads Campaigns Ready |
| 15 | `Case_Request__c` | NotEqualTo | stringValue: Facebook Campaigns Ready |
| 16 | `Case_Request__c` | NotEqualTo | stringValue: Order Inventory |
| 17 | `Case_Request__c` | NotEqualTo | stringValue: Service Coupons |
| 18 | `Case_Request__c` | NotEqualTo | stringValue: RPM Sprint |
| 19 | `Case_Request__c` | NotEqualTo | stringValue: Failure To Create GTM API ID |
| 20 | `Case_Request__c` | NotEqualTo | stringValue: AT Monthly Deep Dive |
| 21 | `Case_Request__c` | NotEqualTo | stringValue: Link Google Ads Account |
| 22 | `Case_Request__c` | NotEqualTo | stringValue: GTM Email Not Sent |
| 23 | `Case_Request__c` | NotEqualTo | stringValue: GTM Not On Site |
| 24 | `Case_Request__c` | NotEqualTo | stringValue: GA4 Build Is Not Complete |
| 25 | `Case_Request__c` | NotEqualTo | stringValue: Website Not Verified |
| 26 | `Case_Request__c` | NotEqualTo | stringValue: NCM Member Status |
| 27 | `Case_Request__c` | NotEqualTo | stringValue: NCM Intelligence Scorecard Kickoff |
| 28 | `Case_Request__c` | NotEqualTo | stringValue: Business Intelligence Kickoff |
| 29 | `Case_Request__c` | NotEqualTo | stringValue: Data Deep Dive |
| 30 | `Case_Request__c` | NotEqualTo | stringValue: PMax Ready to Launch |
| 31 | `RecordTypeId` | NotEqualTo | stringValue: 012Vb000007oEJuIAM |
| 32 | `RecordTypeId` | NotEqualTo | stringValue: 012Vb000007oEJvIAM |
| 33 | `RecordTypeId` | NotEqualTo | stringValue: 012Vb000007oEJwIAM |
| 34 | `RecordTypeId` | NotEqualTo | stringValue: 0125f000000moYNAAY |
| 35 | `RecordTypeId` | NotEqualTo | stringValue: 012Vb000000Y7IQIA0 |
| 36 | `Case_Request__c` | NotEqualTo | stringValue: AT Recommendation |
| 37 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |
| 38 | `RecordTypeId` | NotEqualTo | stringValue: 0125f000000e99ZAAQ |
| 39 | `Case_Request__c` | NotEqualTo | stringValue: Onboarding: ASC Event Approval |
| 40 | `Case_Request__c` | NotEqualTo | stringValue: ASC Event Approval |
| 41 | `Case_Request__c` | NotEqualTo | stringValue: Onboarding: 3rd Party Vendor Identification |
| 42 | `Case_Request__c` | NotEqualTo | stringValue: Onboarding: 3rd Party Vendor Email Outreach |
| 43 | `Case_Request__c` | NotEqualTo | stringValue: Onboarding: ASC Event Confirmation |
| 44 | `Case_Category__c` | EqualTo | stringValue: New Digital Support |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `(1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16 AND 17 AND 18 AND 19 AND 20 AND 21 AND 22 AND 23 AND 24 AND 25 AND 26 AND 27 AND 28 AND 29 AND 30 AND 31 AND 32 AND 33 AND 34 AND 35 AND 36 AND 37 AND 38 AND 39 AND 40 AND 41 AND 42 AND 43) OR (1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16 AND 17 AND 18 AND 19 AND 20 AND 21 AND 22 AND 23 AND 24 AND 25 AND 26 AND 27 AND 28 AND 29 AND 30 AND 31 AND 32 AND 33 AND 34 AND 35 AND 36 AND 38 AND 39 AND 40 AND 41 AND 42 AND 43 AND 44)`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Case_Request__c` | NotEqualTo | stringValue: Dealer Cancellation - Remove Looker Credentials |
| 2 | `Case_Request__c` | NotEqualTo | stringValue: Launch Day QA |
| 3 | `Case_Request__c` | NotEqualTo | stringValue: 7 Launch Day QA |
| 4 | `Case_Request__c` | NotEqualTo | stringValue: 14 Launch Day QA |
| 5 | `Case_Request__c` | NotEqualTo | stringValue: Pod Leader - Account Launch QA |
| 6 | `Case_Request__c` | NotEqualTo | stringValue: Weekly QA |
| 7 | `Case_Request__c` | NotEqualTo | stringValue: Facebook Not Yet Live |
| 8 | `Case_Request__c` | NotEqualTo | stringValue: Reset Facebook Budgets |
| 9 | `Case_Request__c` | NotEqualTo | stringValue: Account Cancellation - Account Cancelled: Run Final Payments "Day after Last Day of Service" |
| 10 | `Case_Request__c` | NotEqualTo | stringValue: Winter Sales Event Material |
| 11 | `Case_Request__c` | NotEqualTo | stringValue: President's Day Sales Event Material |
| 12 | `Case_Request__c` | NotEqualTo | stringValue: Monthly Search Term Audit |
| 13 | `Case_Request__c` | NotEqualTo | stringValue: Performance Review |
| 14 | `Case_Request__c` | NotEqualTo | stringValue: Vehicle Ads Campaigns Ready |
| 15 | `Case_Request__c` | NotEqualTo | stringValue: Facebook Campaigns Ready |
| 16 | `Case_Request__c` | NotEqualTo | stringValue: Order Inventory |
| 17 | `Case_Request__c` | NotEqualTo | stringValue: Service Coupons |
| 18 | `Case_Request__c` | NotEqualTo | stringValue: RPM Sprint |
| 19 | `Case_Request__c` | NotEqualTo | stringValue: Failure To Create GTM API ID |
| 20 | `Case_Request__c` | NotEqualTo | stringValue: AT Monthly Deep Dive |
| 21 | `Case_Request__c` | NotEqualTo | stringValue: Link Google Ads Account |
| 22 | `Case_Request__c` | NotEqualTo | stringValue: GTM Email Not Sent |
| 23 | `Case_Request__c` | NotEqualTo | stringValue: GTM Not On Site |
| 24 | `Case_Request__c` | NotEqualTo | stringValue: GA4 Build Is Not Complete |
| 25 | `Case_Request__c` | NotEqualTo | stringValue: Website Not Verified |
| 26 | `Case_Request__c` | NotEqualTo | stringValue: NCM Member Status |
| 27 | `Case_Request__c` | NotEqualTo | stringValue: NCM Intelligence Scorecard Kickoff |
| 28 | `Case_Request__c` | NotEqualTo | stringValue: Business Intelligence Kickoff |
| 29 | `Case_Request__c` | NotEqualTo | stringValue: Data Deep Dive |
| 30 | `Case_Request__c` | NotEqualTo | stringValue: PMax Ready to Launch |
| 31 | `RecordTypeId` | NotEqualTo | stringValue: 012Vb000007oEJuIAM |
| 32 | `RecordTypeId` | NotEqualTo | stringValue: 012Vb000007oEJvIAM |
| 33 | `RecordTypeId` | NotEqualTo | stringValue: 012Vb000007oEJwIAM |
| 34 | `RecordTypeId` | NotEqualTo | stringValue: 0125f000000moYNAAY |
| 35 | `RecordTypeId` | NotEqualTo | stringValue: 012Vb000000Y7IQIA0 |
| 36 | `Case_Request__c` | NotEqualTo | stringValue: AT Recommendation |
| 37 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |
| 38 | `RecordTypeId` | NotEqualTo | stringValue: 0125f000000e99ZAAQ |
| 39 | `Case_Request__c` | NotEqualTo | stringValue: Onboarding: ASC Event Approval |
| 40 | `Case_Request__c` | NotEqualTo | stringValue: ASC Event Approval |
| 41 | `Case_Request__c` | NotEqualTo | stringValue: Onboarding: 3rd Party Vendor Identification |
| 42 | `Case_Request__c` | NotEqualTo | stringValue: Onboarding: 3rd Party Vendor Email Outreach |
| 43 | `Case_Request__c` | NotEqualTo | stringValue: Onboarding: ASC Event Confirmation |
| 44 | `Case_Category__c` | EqualTo | stringValue: New Digital Support |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `AT_and_Sec_AT_Desc` | AT and Sec AT Desc |
| Decision | `Req_Type_matched_with_Case_routing_Config` | Req Type matched with Case routing Config? |
| Get Records | `Get_Case_Routing_Config` | Get Case Routing Config |
| Get Records | `Get_Out_Of_Office_for_AT_s_manager` | Get Out Of Office for AT's manager |
| Get Records | `Get_Out_Of_Office_for_Sec_AT` | Get Out Of Office for Sec AT |
| Get Records | `Get_Out_Of_Office_records` | Get Out Of Office records |
| Update Records | `Update_Case` | Update Case |
| Assignment | `Assign_to_AT` | Assign to AT |
| Assignment | `Assign_Total_Counts` | Assign Total Counts |
| Assignment | `AT_OOO` | AT OOO |
| Assignment | `AT_s_Manager_OOO` | AT's Manager OOO |
| Assignment | `Both_OOO` | Both OOO |
| Assignment | `Secondary_AT_OOO` | Secondary AT  OOO |
| Formula | `ATL` |  |
| Formula | `ATLM` |  |
| Formula | `ATS` |  |
| Formula | `OwnerIDFinal` |  |
| Formula | `TodaysDate` |  |
| Variable | `caseToUpdate` |  |
| Variable | `TotalATOOO` |  |
| Variable | `TotalATSManagerOOO` |  |
| Variable | `TotalSecATOOO` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>57.0</apiVersion>
    <assignments>
        <name>Assign_to_AT</name>
        <label>Assign to AT</label>
        <locationX>50</locationX>
        <locationY>1079</locationY>
        <assignmentItems>
            <assignToReference>$Record.OwnerId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>ATL</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>caseToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Assign_Total_Counts</name>
        <label>Assign Total Counts</label>
        <locationX>710</locationX>
        <locationY>863</locationY>
        <assignmentItems>
            <assignToReference>TotalATOOO</assignToReference>
            <operator>AssignCount</operator>
            <value>
                <elementReference>Get_Out_Of_Office_records</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>TotalSecATOOO</assignToReference>
            <operator>AssignCount</operator>
            <value>
                <elementReference>Get_Out_Of_Office_for_Sec_AT</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>TotalATSManagerOOO</assignToReference>
            <operator>AssignCount</operator>
            <value>
                <elementReference>Get_Out_Of_Office_for_AT_s_manager</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>AT_and_Sec_AT_Desc</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>AT_OOO</name>
        <label>AT OOO</label>
        <locationX>314</locationX>
        <locationY>1079</locationY>
        <assignmentItems>
            <assignToReference>$Record.OwnerId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>ATS</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>caseToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>AT_s_Manager_OOO</name>
        <label>AT&apos;s Manager OOO</label>
        <locationX>842</locationX>
        <locationY>1079</locationY>
        <assignmentItems>
            <assignToReference>$Record.OwnerId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>ATLM</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>caseToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Both_OOO</name>
        <label>Both OOO</label>
        <locationX>578</locationX>
        <locationY>1079</locationY>
        <assignmentItems>
            <assignToReference>$Record.OwnerId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>ATLM</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>caseToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Secondary_AT_OOO</name>
        <label>Secondary AT  OOO</label>
        <locationX>1106</locationX>
        <locationY>1079</locationY>
        <assignmentItems>
            <assignToReference>$Record.OwnerId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>ATL</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>caseToUpdate</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
    </assignments>
    <decisions>
        <name>AT_and_Sec_AT_Desc</name>
        <label>AT and Sec AT Desc</label>
        <locationX>710</locationX>
        <locationY>971</locationY>
        <defaultConnector>
            <targetReference>Update_Case</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>AT_not_OOO</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>TotalATOOO</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <numberValue>0.0</numberValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Assign_to_AT</targetReference>
            </connector>
            <label>AT not OOO</label>
        </rules>
        <rules>
            <name>AT_not_null_and_Sec_AT_is_Null</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>TotalATOOO</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <numberValue>0.0</numberValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>TotalSecATOOO</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <numberValue>0.0</numberValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>AT_OOO</targetReference>
            </connector>
            <label>AT OOO and Sec AT not OOO</label>
        </rules>
        <rules>
            <name>AT_and_Sec_AT_OOO</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>TotalATOOO</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <numberValue>0.0</numberValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>TotalSecATOOO</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <numberValue>0.0</numberValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Both_OOO</targetReference>
            </connector>
            <label>AT and Sec AT OOO</label>
        </rules>
        <rules>
            <name>AT_s_manager_OOOcheck</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>TotalATSManagerOOO</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <numberValue>0.0</numberValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>AT_s_Manager_OOO</targetReference>
            </connector>
            <label>AT&apos;s manager OOO</label>
        </rules>
        <rules>
            <name>Sec_AT_OOO</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>TotalSecATOOO</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <numberValue>0.0</numberValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Secondary_AT_OOO</targetReference>
            </connector>
            <label>Sec AT OOO</label>
        </rules>
    </decisions>
    <decisions>
        <name>Req_Type_matched_with_Case_routing_Config</name>
        <label>Req Type matched with Case routing Config?</label>
        <locationX>1128</locationX>
        <locationY>431</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>No</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Case_Routing_Config</leftValueReference>
                <operator>IsEmpty</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Out_Of_Office_records</targetReference>
            </connector>
            <label>No</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>ATL</name>
        <dataType>String</dataType>
        <expression>IF(
  OR( ISBLANK({!$Record.Account.Account_Technician__r.Id}), ISNULL({!$Record.Account.Account_Technician__r.Id}) ),
  $User.Id,
  {!$Record.Account.Account_Technician__r.Id}
)</expression>
    </formulas>
    <formulas>
        <name>ATLM</name>
        <dataType>String</dataType>
        <expression>IF(
  OR( ISBLANK({!$Record.Account.Account_Technician__r.Manager.Id}), ISNULL({!$Record.Account.Account_Technician__r.Manager.Id}) ),
  $User.Id,
  {!$Record.Account.Account_Technician__r.Manager.Id}
)</expression>
    </formulas>
    <formulas>
        <name>ATS</name>
        <dataType>String</dataType>
        <expression>IF(
  OR( ISBLANK({!$Record.Account_Technician__c}), ISNULL({!$Record.Account_Technician__c}) ),
  $User.Id,
  {!$Record.Account_Technician__c}
)</expression>
    </formulas>
    <formulas>
        <name>OwnerIDFinal</name>
        <dataType>String</dataType>
        <expression>IF(
  OR( ISBLANK({!$Record.OwnerId}), ISNULL({!$Record.OwnerId}) ),
  {!$User.Id},
  {!$Record.OwnerId}
)</expression>
    </formulas>
    <formulas>
        <name>TodaysDate</name>
        <dataType>DateTime</dataType>
        <expression>NOW()</expression>
    </formulas>
    <interviewLabel>Update Case AT and Owner {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Update Case AT and Owner</label>
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
        <name>Get_Case_Routing_Config</name>
        <label>Get Case Routing Config</label>
        <locationX>1128</locationX>
        <locationY>323</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Req_Type_matched_with_Case_routing_Config</targetReference>
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
        <getFirstRecordOnly>false</getFirstRecordOnly>
        <object>Case_Routing_Config__mdt</object>
        <sortField>Request_Type__c</sortField>
        <sortOrder>Asc</sortOrder>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Out_Of_Office_for_AT_s_manager</name>
        <label>Get Out Of Office for AT&apos;s manager</label>
        <locationX>710</locationX>
        <locationY>755</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Assign_Total_Counts</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>OwnerId</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.Account.Account_Technician__r.Manager.Id</elementReference>
            </value>
        </filters>
        <filters>
            <field>Start_Date__c</field>
            <operator>LessThanOrEqualTo</operator>
            <value>
                <elementReference>TodaysDate</elementReference>
            </value>
        </filters>
        <filters>
            <field>End_Date__c</field>
            <operator>GreaterThanOrEqualTo</operator>
            <value>
                <elementReference>TodaysDate</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>false</getFirstRecordOnly>
        <object>OOO_Calendar__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Out_Of_Office_for_Sec_AT</name>
        <label>Get Out Of Office for Sec AT</label>
        <locationX>710</locationX>
        <locationY>647</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Get_Out_Of_Office_for_AT_s_manager</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>OwnerId</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.Account.Secondary_Account_Technician__r.Id</elementReference>
            </value>
        </filters>
        <filters>
            <field>Start_Date__c</field>
            <operator>LessThanOrEqualTo</operator>
            <value>
                <elementReference>TodaysDate</elementReference>
            </value>
        </filters>
        <filters>
            <field>End_Date__c</field>
            <operator>GreaterThanOrEqualTo</operator>
            <value>
                <elementReference>TodaysDate</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>false</getFirstRecordOnly>
        <object>OOO_Calendar__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Out_Of_Office_records</name>
        <label>Get Out Of Office records</label>
        <locationX>710</locationX>
        <locationY>539</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Get_Out_Of_Office_for_Sec_AT</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>OwnerId</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.Account.Account_Technician__r.Id</elementReference>
            </value>
        </filters>
        <filters>
            <field>Start_Date__c</field>
            <operator>LessThanOrEqualTo</operator>
            <value>
                <elementReference>TodaysDate</elementReference>
            </value>
        </filters>
        <filters>
            <field>End_Date__c</field>
            <operator>GreaterThanOrEqualTo</operator>
            <value>
                <elementReference>TodaysDate</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>false</getFirstRecordOnly>
        <object>OOO_Calendar__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordUpdates>
        <name>Update_Case</name>
        <label>Update Case</label>
        <locationX>710</locationX>
        <locationY>1271</locationY>
        <inputReference>caseToUpdate</inputReference>
    </recordUpdates>
    <start>
        <locationX>1002</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Get_Case_Routing_Config</targetReference>
        </connector>
        <filterLogic>(1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16 AND 17 AND 18 AND 19 AND 20 AND 21 AND 22 AND 23 AND 24 AND 25 AND 26 AND 27 AND 28 AND 29 AND 30 AND 31 AND 32 AND 33 AND 34 AND 35 AND 36 AND 37 AND 38 AND 39 AND 40 AND 41 AND 42 AND 43) OR (1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16 AND 17 AND 18 AND 19 AND 20 AND 21 AND 22 AND 23 AND 24 AND 25 AND 26 AND 27 AND 28 AND 29 AND 30 AND 31 AND 32 AND 33 AND 34 AND 35 AND 36 AND 38 AND 39 AND 40 AND 41 AND 42 AND 43 AND 44)</filterLogic>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Dealer Cancellation - Remove Looker Credentials</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Launch Day QA</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>7 Launch Day QA</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>14 Launch Day QA</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Pod Leader - Account Launch QA</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Weekly QA</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Facebook Not Yet Live</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Reset Facebook Budgets</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Account Cancellation - Account Cancelled: Run Final Payments &quot;Day after Last Day of Service&quot;</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Winter Sales Event Material</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>President&apos;s Day Sales Event Material</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Monthly Search Term Audit</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Performance Review</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Vehicle Ads Campaigns Ready</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Facebook Campaigns Ready</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Order Inventory</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Service Coupons</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>RPM Sprint</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Failure To Create GTM API ID</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>AT Monthly Deep Dive</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Link Google Ads Account</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>GTM Email Not Sent</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>GTM Not On Site</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>GA4 Build Is Not Complete</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Website Not Verified</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>NCM Member Status</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>NCM Intelligence Scorecard Kickoff</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Business Intelligence Kickoff</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Data Deep Dive</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>PMax Ready to Launch</stringValue>
            </value>
        </filters>
        <filters>
            <field>RecordTypeId</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>012Vb000007oEJuIAM</stringValue>
            </value>
        </filters>
        <filters>
            <field>RecordTypeId</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>012Vb000007oEJvIAM</stringValue>
            </value>
        </filters>
        <filters>
            <field>RecordTypeId</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>012Vb000007oEJwIAM</stringValue>
            </value>
        </filters>
        <filters>
            <field>RecordTypeId</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>0125f000000moYNAAY</stringValue>
            </value>
        </filters>
        <filters>
            <field>RecordTypeId</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>012Vb000000Y7IQIA0</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>AT Recommendation</stringValue>
            </value>
        </filters>
        <filters>
            <field>Foundation_Record__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>RecordTypeId</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>0125f000000e99ZAAQ</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Onboarding: ASC Event Approval</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>ASC Event Approval</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Onboarding: 3rd Party Vendor Identification</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Onboarding: 3rd Party Vendor Email Outreach</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Request__c</field>
            <operator>NotEqualTo</operator>
            <value>
                <stringValue>Onboarding: ASC Event Confirmation</stringValue>
            </value>
        </filters>
        <filters>
            <field>Case_Category__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>New Digital Support</stringValue>
            </value>
        </filters>
        <object>Case</object>
        <recordTriggerType>Create</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
    <variables>
        <name>caseToUpdate</name>
        <dataType>SObject</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>true</isOutput>
        <objectType>Case</objectType>
    </variables>
    <variables>
        <name>TotalATOOO</name>
        <dataType>Number</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>true</isOutput>
        <scale>0</scale>
        <value>
            <numberValue>0.0</numberValue>
        </value>
    </variables>
    <variables>
        <name>TotalATSManagerOOO</name>
        <dataType>Number</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>true</isOutput>
        <scale>0</scale>
    </variables>
    <variables>
        <name>TotalSecATOOO</name>
        <dataType>Number</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>true</isOutput>
        <scale>0</scale>
        <value>
            <numberValue>0.0</numberValue>
        </value>
    </variables>
</Flow>
```
