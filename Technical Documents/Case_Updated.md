# Flow: Case - Updated

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

> **Version note:** The metadata below is the flow's latest saved version (status Obsolete).
> The version currently active in the org is **v437**, which contains the same
> `$Record.Foundation_Record__c = true` check in the `Is_if_Foundation_Record` outcome.

## Summary

| Property | Value |
|---|---|
| API Name | `Case_Updated` |
| Label | Case - Updated |
| Status | Obsolete |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | Update |
| Run In Mode | Default |
| API Version | 54.0 |
| Description | When a Case is updated, this flow will evaluate the criteria of the Case to determine which action(s) and/or notification(s) are required. |

## Trigger & Entry Criteria

_No entry criteria._

Scheduled paths:

- `X2_Days_After_Last_Update` — 2 Days After Last Update (offset 2 Days from RecordField)
- `X1_Days_After_Last_update` — 1 Days After Last update (offset 1 Days from RecordField)

## Foundation_Record__c = true Usage

### Decision outcome of `Testing_Decision`: `Is_if_Foundation_Record` — Is if Foundation Record

Logic: `and`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `$Record.Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Account_Changed_gate` | Account Changed Gate |
| Decision | `Account_Vendor_Exists` | Account Vendor Exists? |
| Decision | `Any_Open_Digital_Cases_assigned_to_Cur_User` | Any Open Digital Cases assigned to Cur User? |
| Decision | `Any_People_in_Recipients_0` | Any People in Recipients? |
| Decision | `Are_There_Any_Recipients_0` | Are There Any Recipients? |
| Decision | `Case_Closed` | Case Closed? |
| Decision | `Case_Stalled_General` | Case Stalled General |
| Decision | `Changed_Away_from_Waiting_on_Dev` | Changed Away from Waiting on Dev |
| Decision | `Check_AM_Gate` | Check AM Gate |
| Decision | `Check_for_Onboarding` | Check for Onboarding |
| Decision | `Check_RAD_Gate` | Check RAD Gate |
| Decision | `Claim_Gate` | Claim Gate |
| Decision | `Closed_Case` | Closed Case |
| Decision | `Copy_1_of_Dynamic_Time_Transition` | Dynamic Time Transition? |
| Decision | `Copy_1_of_Owner_Changed` | Owner Changed? |
| Decision | `Digital_Ticket_Closed` | Digital Ticket Closed? |
| Decision | `Dynamic_Time_Transition` | Dynamic Time Transition? |
| Decision | `Forward_to_FD` | Forward to FD |
| Decision | `Forward_to_FD_0_0_0` | Forward to FD |
| Decision | `Forward_to_FD_0_0_0_0_0` | Forward to FD |
| Decision | `Forward_to_SD_0` | Forward to SD |
| Decision | `Forward_to_SD_0_0` | Forward to SD |
| Decision | `Forward_to_SD_0_0_0_0` | Forward to SD |
| Decision | `Found_Budget` | Found Budget |
| Decision | `Found_Budget_0` | Found Budget |
| Decision | `Is_Case_a_Bug` | Is Case a Bug? |
| Decision | `Is_Case_a_Bug_0` | Is Case a Bug? |
| Decision | `Is_Owner_Currently_CTL` | Is Owner Currently CTL? |
| Decision | `Is_the_Case_Closed` | Is the Case Open |
| Decision | `Notify2_Null_Handling` | Notify2 Null Handling |
| Decision | `Null_Handling` | Null Handling |
| Decision | `Null_Handling_0` | External Notification Null Handling |
| Decision | `Null_Handling_0_0` | Null Handling |
| Decision | `Oldest_Record_Found` | Oldest Record Found? |
| Decision | `Owner_Changed` | Owner Changed? |
| Decision | `Process_CC_Gate` | Process CC Gate |
| Decision | `Process_CC_Gate_0` | Process CC Gate |
| Decision | `Process_CC_Gate_0_0` | Process CC Gate |
| Decision | `Queue_Owned_Case_Closed` | Queue Owned Case Closed? |
| Decision | `Quick_Cancelled` | Quick Cancelled? |
| Decision | `ReClosed_Case` | ReClosed Case? |
| Decision | `Resolution_Notes_Changed` | Resolution Notes Changed? |
| Decision | `Send_Compliance_Message` | Send Compliance Message? |
| Decision | `Send_Survey` | Send Survey? |
| Decision | `Send_WPM_Info_Needed_Email` | Send WPM Info Needed Email? |
| Decision | `Send_WPM_On_Hold_Email` | Send WPM On Hold Email? |
| Decision | `send_WPM_Stalled_Email` | send WPM Stalled Email? |
| Decision | `Skip_Onboarding` | Skip Onboarding |
| Decision | `Skip_Sending_Notification` | Skip Sending Internal Notification |
| Decision | `SLA_Match` | SLA Match |
| Decision | `Slack_Automation` | Slack Automation |
| Decision | `Status_Changed` | Was The Status Changed? (Used for Logging Time) |
| Decision | `Support_Owner234` | Support Owner? |
| Decision | `Temp_disable` | Temp disable |
| Decision | `Testing_Decision` | Testing Decision |
| Decision | `Testing_Element` | Testing Element |
| Decision | `Update_Full_CC_List` | Update Full CC List |
| Decision | `Valid_Email` | Valid Email? |
| Decision | `Vendor_Found` | Vendor Found? |
| Decision | `Was_3rd_Party_Integration_Approval_Status_Changed` | Was 3rd Party Integration Approval Status Changed? |
| Decision | `Was_an_External_Note_Added` | Was an External Note Added? |
| Decision | `Was_an_Internal_Note_Added` | Was an Internal Note Added? |
| Decision | `Was_it_an_Case_Closed_with_open_Slack_Channel` | Was it an Case Closed with open Slack Channel? |
| Decision | `Was_Jira_ID_Changed` | Was Jira ID Changed? |
| Decision | `Was_Jira_Status_Changed` | Jira Status Changed? |
| Decision | `Was_Jira_Status_Changed_0` | Jira Status Changed? |
| Decision | `Was_Parent_Account_Found` | Was Parent Account Found? |
| Decision | `Was_Production_Complete_checked` | Was Production Complete checked |
| Decision | `Was_RAD_or_SEO_Changed` | Was RAD or SEO Changed? |
| Decision | `Was_RAD_or_SEO_Changed_0` | Was RAD Changed? |
| Decision | `Was_RAD_or_SEO_Changed_0_0` | Was SEO Analyst Changed? |
| Decision | `Was_RAD_or_SEO_Changed_0_0_0` | Was SEO TL Changed? |
| Decision | `Was_Subcategory_Changed` | Was Subcategory Changed? |
| Decision | `Was_the_Account_populated` | Was the Account populated? |
| Decision | `Was_the_Case_Category_changed` | Was the Case Category changed? |
| Decision | `Was_the_Case_Closed` | Was the Case Closed? |
| Decision | `Was_the_Case_Owner_changed_to_a_User` | Was the Case Owner changed to a User? |
| Decision | `Was_the_Case_Request_Changed` | Was the Case Request Changed? |
| Decision | `Was_The_Case_Status_Changed_Used_for_Logging_Time` | Was The Case Status Changed? (Used for Logging Time) |
| Decision | `Was_the_Status_changed` | Was the Status changed? |
| Decision | `Which_Contact_Gets_Updated` | Which Contact Gets Updated |
| Decision | `X3PV_Case_Just_Closed` | (Dep) 3PV Case Just Closed? |
| Get Records | `Get_Account_Vendor_Acct_Vendor` | Get Account Vendor (Acct+Vendor) |
| Get Records | `Get_Advid_Queue` | Get Advid Queue |
| Get Records | `Get_Apollo_Support_Queue` | Get Apollo Support Queue |
| Get Records | `Get_Command_Center_Queue` | Get Command Center Queue |
| Get Records | `Get_Data_Support_Queue` | Get Data Support Queue |
| Get Records | `Get_Digital_OEM_Queue` | Get Digital OEM Queue |
| Get Records | `Get_Digital_Reporting_Queue` | Get Digital Reporting Queue |
| Get Records | `Get_Digital_Support_Queue` | Get Digital Support Queue |
| Get Records | `Get_Foundation_Data_Support_Queue` | Get Foundation Data Support Queue |
| Get Records | `Get_GeneralSupport_Queue` | Get GeneralSupport Queue |
| Get Records | `Get_Inventory_Support_Queue` | Get Inventory Support Queue |
| Get Records | `Get_Major_AG_GeneralSupport_Queue` | Get Major AG GeneralSupport Queue |
| Get Records | `Get_Marketing_Support_Queue` | Get Marketing Support Queue |
| Get Records | `Get_Monthly_Budget` | Get Monthly Budget |
| Get Records | `Get_Oldest_Open_Digital_Case` | Get Oldest Open Digital Case |
| Get Records | `Get_Onboarding` | Get Onboarding |
| Get Records | `Get_Parent_Account` | Get Parent Account |
| Get Records | `Get_Production_Support_Queue` | Get Production Support Queue |
| Get Records | `Get_Reopened_MB` | Get Reopened MB |
| Get Records | `Get_SEO_Support_Queue` | Get SEO Support Queue |
| Get Records | `Get_User_s_Open_Digital_Cases` | Get User's Open Digital Cases |
| Get Records | `Get_Vendor_by_Name` | Get Vendor (by Name) |
| Get Records | `Get_Website_Analytics_Support_Queue` | Get Website Analytics Support Queue |
| Update Records | `Assign_Current_User_to_Oldest_open_digital_Ticket` | Assign Current User to Oldest open Digital Ticket |
| Update Records | `Assign_Ryan_Owner` | Assign Ryan Owner |
| Update Records | `Cancel_Ticket` | Cancel Ticket |
| Update Records | `Claim_It` | Claim It |
| Update Records | `Clear_CC_List` | Clear CC List |
| Update Records | `Copy_1_of_Nullify_Stall` | Copy 1 of Nullify Stall |
| Update Records | `Copy_1_of_Store_Slack_Owner` | Copy 1 of Store Slack Owner |
| Update Records | `Copy_1_of_Time_Stamp_Assigned` | Copy 1 of Time Stamp Assigned |
| Update Records | `Mark_Case_Reopened` | Mark Case Reopened |
| Update Records | `Nullify_External_Notes` | Nullify External Notes |
| Update Records | `Nullify_Internal_Notes` | Nullify Internal Notes |
| Update Records | `Nullify_Stall` | Nullify Stall |
| Update Records | `Populate_Regional_Account_Director_and_Account_Manager` | Populate Regional Account Director and Account Manager |
| Update Records | `Push_update_to_Monthly_Budget` | Push update to Monthly Budget |
| Update Records | `Push_update_to_Monthly_Budget_0` | Push update to Monthly Budget |
| Update Records | `Set_Close_Date` | Set Close Date |
| Update Records | `Set_Owner_Back_to_Support_User` | Set Owner Back to Support User |
| Update Records | `Set_Owner_to_WPM` | Set Owner to WPM |
| Update Records | `Set_Owner_to_WPM_0` | Set Owner to WPM |
| Update Records | `Set_To_Waiting_on_Dev` | Set To Waiting on Dev |
| Update Records | `Status_Update_FD` | Status Update FD |
| Update Records | `Store_Approver` | Store Approver |
| Update Records | `Store_Rejecter` | Store Rejecter |
| Update Records | `Store_Slack_Owner` | Store Slack Owner |
| Update Records | `Testing_Flow` | Testing Flow |
| Update Records | `Time_Stamp_3rd_Party_Started` | Time Stamp 3rd Party Started |
| Update Records | `Time_Stamp_Assigned` | Time Stamp Assigned |
| Update Records | `Transfer_Case_Creater` | Transfer Case Creater |
| Update Records | `Transfer_Case_to_Apollo_Support_Queue` | Transfer Case to Apollo Support Queue |
| Update Records | `Transfer_Case_to_Apollo_Support_Queue_0` | Transfer Case to Apollo Support Queue |
| Update Records | `Transfer_Case_to_Apollo_Support_Queue_0_0` | Transfer Case to Apollo Support Queue |
| Update Records | `Transfer_Case_to_Apollo_Websites_Support_Queue_0` | Transfer Case to Apollo Websites Support Queue |
| Update Records | `Transfer_Case_to_Data_Support_Queue` | Transfer Case to Data Support Queue |
| Update Records | `Transfer_Case_to_Data_Support_Queue_0` | Transfer Case to Data Support Queue |
| Update Records | `Transfer_Case_to_Digital_OEM_Queue` | Transfer Case to Digital OEM Queue |
| Update Records | `Transfer_Case_to_Digital_Reporting_Queue` | Transfer Case to Digital Reporting Queue |
| Update Records | `Transfer_Case_to_Digital_Support_Queue` | Transfer Case to Digital Support Queue |
| Update Records | `Transfer_Case_to_GS_Queue` | Transfer Case to GS Queue |
| Update Records | `Transfer_Case_to_GS_Queue_0` | Transfer Case to GS Queue |
| Update Records | `Transfer_Case_to_GS_Queue_0_0` | Transfer Case to GS Queue |
| Update Records | `Transfer_Case_to_Marketing_Support` | Transfer Case to Marketing Support |
| Update Records | `Transfer_Case_to_Production_Support_Queue` | Transfer Case to Production Support Queue |
| Update Records | `Transfer_Case_to_SEO_Support_Queue` | Transfer Case to SEO Support Queue |
| Update Records | `Transfer_Case_to_Websites_Analytics_Support_Queue` | Transfer Case to Websites Analytics Support Queue |
| Update Records | `Update_3rd_Party_Status` | Update 3rd Party Status |
| Update Records | `Update_Active_Vendor_Record` | Update Active Vendor Record |
| Update Records | `Update_Attachment_URLS` | Update Attachment URLS |
| Update Records | `Update_Case` | Update Case |
| Update Records | `Update_CC_Lists` | Update CC Lists |
| Update Records | `Update_Dealer_Contact_Survey` | Update Dealer Contact Survey |
| Update Records | `Update_Dev_Hold_Hours` | Update Dev Hold Hours |
| Update Records | `Update_Onboarding_Record` | Update Onboarding Record |
| Update Records | `Update_Owner` | Update Owner |
| Update Records | `Update_Owner_0` | Update Owner |
| Update Records | `Update_Parent_Account` | Update Parent Account |
| Update Records | `Update_Parent_Account_0` | Update Parent Account |
| Update Records | `Update_Parent_Account_0_0` | Update Parent Account |
| Update Records | `Update_RAD` | Update RAD |
| Update Records | `Update_RAD_0` | Update RAD |
| Update Records | `Update_RAD_0_0` | Update RAD |
| Update Records | `Update_ReClosing_Vars` | Update ReClosing Vars |
| Update Records | `Update_Service` | Update Service |
| Update Records | `Update_SLA_Static` | Update SLA Static |
| Update Records | `Update_Survey_Date_Time` | Update Survey Date Time |
| Update Records | `Update_to_Complete` | Update to Complete |
| Create Records | `Create_New_3rdPty_Vendor_Record` | Create New 3rdPty Vendor Record |
| Create Records | `Create_Note` | Create Note |
| Create Records | `Create_Survey_Deployment_Link` | Create Survey Deployment Link |
| Create Records | `Create_Vendor` | Create Vendor |
| Create Records | `Pass_External_Notes_to_Case_Comments` | Pass External Notes to Case Comments |
| Create Records | `Pass_Internal_Note_to_Internal_External_Notes` | Pass Internal Note to Internal/External Notes |
| Assignment | `Add_Bug_Value_to_Budget` | Add Bug Value to Budget |
| Assignment | `Add_Bug_Value_to_Budget_0` | Subtract Bug Value to Budget |
| Assignment | `Add_Dev_Hold_Hours` | Add Dev Hold Hours |
| Assignment | `Add_Loop_to_Full_CC_List` | Add Loop to Full CC List |
| Assignment | `Assign_Closed_Comment` | Assign Closed Comment |
| Assignment | `AssignCreatorOwnerPushList` | AssignCreatorOwnerPushList |
| Assignment | `AssignInternalTeamPushList` | AssignInternalTeamPushList |
| Assignment | `Set_Vendor_Id_Found` | Set Vendor Id (Found) |
| Assignment | `Update_Onboarding` | Update Onboarding |
| Action | `Convert_to_CSV` | Convert to CSV |
| Action | `ConvertCCtoCollection` | ConvertCCtoCollection |
| Action | `Email_to_GS_Support` | Email to GS Support |
| Action | `Email_to_GS_Support_0` | Email to GS Support |
| Action | `Production_Complete` | Production Complete |
| Action | `Remove_HTML_Tags` | Remove HTML Tags |
| Action | `Remove_HTML_Tags_from_Comments_0` | Remove HTML Tags from External Comments |
| Action | `Send_Case_Closed_Alert` | Send Case Closed Alert |
| Action | `Send_Case_Closed_Alert_0_0` | Send Case Closed Alert |
| Action | `Send_Closed_Email_CC` | Send Closed Email CC |
| Action | `Send_Closed_Email_CC_0` | Send Closed Email CC |
| Action | `Send_External_CC` | Send External CC |
| Action | `Send_External_No_CC` | Send External No CC |
| Action | `Send_Ryan_Email` | Send Ryan Email |
| Action | `Send_Second_Batch_Of_Users_Notification_0` | Send Second Batch Of Users Notification |
| Action | `Send_WPM_Alert` | Send WPM Alert |
| Action | `Send_WPM_Alert_0` | Send WPM Alert |
| Action | `Send_WPM_Needs_Info_Alert` | Send WPM Needs Info Alert |
| Action | `Sent_Notification_0` | Sent Notification |
| Action | `Sent_Notification_0_0` | Sent Notification |
| Subflow | `Alert_The_Team` | Alert The Team |
| Subflow | `Approved_For_Upload1` | Approved For Upload |
| Subflow | `Archive_Slack_Channel2` | Archive Slack Channel |
| Subflow | `Awaiting_Approval_Email1` | Awaiting Approval Email |
| Subflow | `Awaiting_Approval_Email1_0` | Awaiting Approval Email |
| Subflow | `Case_Assigned_Notification` | Case Assigned Notification |
| Subflow | `Case_Type_Assignment` | Case Type Assignment |
| Subflow | `Copy_1_of_Log_Regular_Time` | Log Regular Time |
| Subflow | `Copy_1_of_Log_Unassigned_Time` | Copy 1 of Log Unassigned Time |
| Subflow | `Copy_1_of_Set_Status_to_New` | Set Status to New |
| Subflow | `Copy_2_of_Log_Regular_Time` | Log Regular Time |
| Subflow | `Copy_2_of_Set_Status_to_New` | Copy 2 of Set Status to New |
| Subflow | `Copy_3_of_Set_OnHold_Status` | Set Selected for Dev Status |
| Subflow | `Copy_4_of_Set_Status_to_New` | Set Status to New |
| Subflow | `Copy_5_of_Set_Status_to_New` | Set Status to New |
| Subflow | `Copy_8_of_Set_Status_to_New` | Set Status to New |
| Subflow | `Create_Buy_Sell_Opp` | Create Buy Sell Opp |
| Subflow | `Create_Touch` | Create Touch |
| Subflow | `Dev_UnHold_Timestamp` | Dev Hold Timestamp 2 |
| Subflow | `Forward_Case_0` | Forward Case |
| Subflow | `Forward_Case_0_0` | Forward Case |
| Subflow | `Forward_to_FD_0` | Forward to FD |
| Subflow | `Forward_to_FD_0_0` | Forward to FD |
| Subflow | `Forward_to_FD_0_0_0_0` | Forward to FD |
| Subflow | `Log_Regular_Time` | Log Regular Time |
| Subflow | `Log_Regular_Time_0` | Log Regular Time |
| Subflow | `Log_Regular_Time_0_0_0` | Log Regular Time |
| Subflow | `Log_Unassigned_Time` | Log Unassigned Time |
| Subflow | `On_Hold_Notification1` | On Hold Notification |
| Subflow | `Set_In_Progress_with_Dev_Status` | Set In Progress with Dev Status |
| Subflow | `Set_Internal_Feedback_Needed_Status` | Set Internal Feedback Needed Status |
| Subflow | `Set_OnHold_Status` | Set OnHold Status |
| Subflow | `set_Ready_for_Review_status` | set Ready for Testing status |
| Subflow | `Set_Ready_for_Testing_Status` | Set Ready for Testing Status |
| Subflow | `Set_Ready_for_Testing_Status5678e567` | Set Ready for Testing Status |
| Subflow | `Set_Status_to_Assigned` | Set Status to Assigned |
| Subflow | `set_Status_to_FD_Status` | set Status to FD Status |
| Subflow | `Set_Status_to_New` | Set Status to New |
| Subflow | `Set_Status_to_New456456` | Set Status to New |
| Subflow | `Set_Waiting_on_Development_Status` | Set Waiting on Development Status |
| Subflow | `Set_Waiting_on_Development_Status4563456` | Set Waiting on Development Status |
| Subflow | `Stalled_Case` | Stalled Case |
| Subflow | `TVM_Information_Provided_Email_Push` | TVM Information Provided Email/Push |
| Subflow | `TVM_Internal_Note_Push` | TVM Internal Note/Push |
| Subflow | `TVM_Needs_Information_Email_Push` | TVM Needs Information Email/Push |
| Subflow | `TVM_Send_Error_Email` | TVM Send Error Email |
| Subflow | `Update_Production_Support_status_if_Production_Complete` | Update Production Support status if Production Complete |
| Subflow | `Update_to_Closed` | Update to Closed |
| Loop | `Loop_CC_List` | Loop CC List |
| Formula | `AdMonth` |  |
| Formula | `CCListFullCleaned` |  |
| Formula | `CCListInitialCleaned` |  |
| Formula | `ChangedStatus` |  |
| Formula | `DevHoldHours` |  |
| Formula | `EscalatedTo` |  |
| Formula | `ExternalCaseClosedVarText` |  |
| Formula | `ExternalFeedBackNeededBody` |  |
| Formula | `FDStatus` |  |
| Formula | `NotifyCreatorAddress` |  |
| Formula | `NotifyExternal` |  |
| Formula | `NotifyInternalCSTeam` |  |
| Formula | `NotifyOwner` |  |
| Formula | `NotifyWPMFordFDNOwner` |  |
| Formula | `OrgwideID` |  |
| Formula | `OTTccList` |  |
| Formula | `PrevOwnerOrGS` |  |
| Formula | `RegionalAccountDirector` |  |
| Formula | `StatusChanged` |  |
| Formula | `SubjectLineNewExternalComment` |  |
| Formula | `SubjectLineNewInternalComment` |  |
| Formula | `SubjectLineNewTicket` |  |
| Formula | `varFirstDayClosed` |  |
| Formula | `varFirstdaycurrentmonth` |  |
| Formula | `WPMOrGS` |  |
| Variable | `AssignIPTeamList` |  |
| Variable | `BellNotificationList` |  |
| Variable | `CCList` |  |
| Variable | `ClosedComment` |  |
| Variable | `ContactList` |  |
| Variable | `CurrDevHoldHours` |  |
| Variable | `currentItem_DNC_Filter` |  |
| Variable | `currentItem_Filter_Primary_POCs` |  |
| Variable | `currentItem_NLWC_Filter` |  |
| Variable | `ErrorVariable1` |  |
| Variable | `ExternalNoteID` |  |
| Variable | `InternalNoteID` |  |
| Variable | `LoopNumber` |  |
| Variable | `PrimaryPOC` |  |
| Variable | `PushInternalCSTeam` |  |
| Variable | `varVendorId` |  |
| Variable | `x3rdPartyApprovalTime` |  |
| Constant | `CasesManual` |  |
| Constant | `GeneralSupportId` |  |
| Text Template | `BodyExternalComment` |  |
| Text Template | `BodyExternalComment_ToInternal` |  |
| Text Template | `BodyInternalComment` |  |
| Text Template | `BodyInternalCommentPush` |  |
| Text Template | `BodyNewTicket` |  |
| Text Template | `CaseAssignedSubject` |  |
| Text Template | `CaseAssignmentBody` |  |
| Text Template | `CaseClosedExternalBody` |  |
| Text Template | `CaseClosedInternalBody` |  |
| Text Template | `CaseClosedSubject` |  |
| Text Template | `ErrorMessage1` |  |
| Text Template | `InfoNeededBody` |  |
| Text Template | `InfoNeededSubject` |  |
| Text Template | `InfoProvidedBody` |  |
| Text Template | `InfoProvidedSubject` |  |
| Text Template | `InformationProvided` |  |
| Text Template | `NeedsInformation` |  |
| Text Template | `NeedsInformationSubject` |  |
| Text Template | `OnHold` |  |
| Text Template | `OnHoldSubject` |  |
| Text Template | `OTTMediaUploadTemplateBody` |  |
| Text Template | `PushInfoNeededBody` |  |
| Text Template | `PushInfoProvidedBody` |  |
| Text Template | `ResolutionNoteComment` |  |
| Text Template | `Stalled_Case_Email` |  |
| Text Template | `Stalled_Case_Subject` |  |
| Text Template | `StalledBody` |  |
| Text Template | `StalledSubject` |  |
| Text Template | `StatusChangedBody` |  |
| Text Template | `StatusChangeSubject` |  |
| Text Template | `TT_Slack_Vendor_Activated` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <actionCalls>
        <name>Convert_to_CSV</name>
        <label>Convert to CSV</label>
        <locationX>5129</locationX>
        <locationY>16302</locationY>
        <actionName>ConvertStringCollectionToCSV_CP</actionName>
        <actionType>apex</actionType>
        <connector>
            <targetReference>Clear_CC_List</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>stringCollection</name>
            <value>
                <elementReference>CCList</elementReference>
            </value>
        </inputParameters>
        <nameSegment>ConvertStringCollectionToCSV_CP</nameSegment>
        <offset>0</offset>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </actionCalls>
    <actionCalls>
        <name>ConvertCCtoCollection</name>
        <label>ConvertCCtoCollection</label>
        <locationX>4826</locationX>
        <locationY>15186</locationY>
        <actionName>ConvertCSVToStringCollection_CP</actionName>
        <actionType>apex</actionType>
        <connector>
            <targetReference>Loop_CC_List</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>csvString</name>
            <value>
                <elementReference>$Record.Latest_CC_List_Long__c</elementReference>
            </value>
        </inputParameters>
        <nameSegment>ConvertCSVToStringCollection_CP</nameSegment>
        <offset>0</offset>
        <outputParameters>
            <assignToReference>CCList</assignToReference>
            <name>stringCollection</name>
        </outputParameters>
    </actionCalls>
    <actionCalls>
        <name>Email_to_GS_Support</name>
        <label>Email to GS Support</label>
        <locationX>5110</locationX>
        <locationY>23460</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>Get_GeneralSupport_Queue.Email</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>SubjectLineNewTicket</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>BodyNewTicket</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Email_to_GS_Support_0</name>
        <label>Email to GS Support</label>
        <locationX>4846</locationX>
        <locationY>5346</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <connector>
            <targetReference>Claim_Gate</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>NotifyInternalCSTeam</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>SubjectLineNewTicket</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>BodyNewTicket</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Production_Complete</name>
        <label>Production Complete</label>
        <locationX>4978</locationX>
        <locationY>13038</locationY>
        <actionName>Case.Case_Production_Complete</actionName>
        <actionType>emailAlert</actionType>
        <connector>
            <targetReference>Was_an_Internal_Note_Added</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.Case_Production_Complete</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Remove_HTML_Tags</name>
        <label>Remove HTML Tags</label>
        <locationX>5066</locationX>
        <locationY>13338</locationY>
        <actionName>CaseNotesStrip</actionName>
        <actionType>apex</actionType>
        <connector>
            <targetReference>Skip_Sending_Notification</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>ids</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputParameters>
        <nameSegment>CaseNotesStrip</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Remove_HTML_Tags_from_Comments_0</name>
        <label>Remove HTML Tags from External Comments</label>
        <locationX>4958</locationX>
        <locationY>14970</locationY>
        <actionName>CaseNotesStrip</actionName>
        <actionType>apex</actionType>
        <connector>
            <targetReference>Process_CC_Gate_0</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>ids</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputParameters>
        <nameSegment>CaseNotesStrip</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Send_Case_Closed_Alert</name>
        <label>Send Case Closed Alert</label>
        <locationX>3009</locationX>
        <locationY>20292</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <connector>
            <targetReference>Null_Handling_0</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>NotifyInternalCSTeam</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>SubjectLineNewInternalComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>CaseClosedInternalBody</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Send_Case_Closed_Alert_0_0</name>
        <label>Send Case Closed Alert</label>
        <locationX>3009</locationX>
        <locationY>21384</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <connector>
            <targetReference>Digital_Ticket_Closed</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>NotifyWPMFordFDNOwner</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>SubjectLineNewInternalComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>CaseClosedInternalBody</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Send_Closed_Email_CC</name>
        <label>Send Closed Email CC</label>
        <locationX>2811</locationX>
        <locationY>20700</locationY>
        <actionName>SendBetterEmail</actionName>
        <actionType>apex</actionType>
        <connector>
            <targetReference>Was_it_an_Case_Closed_with_open_Slack_Channel</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>HTMLbody</name>
            <value>
                <elementReference>CaseClosedExternalBody</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>orgWideEmailAddressId</name>
            <value>
                <elementReference>OrgwideID</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>SendCCthisStringCollectionOfEmailAddresses</name>
            <value>
                <elementReference>CCList</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>SendTOthisOneEmailAddress</name>
            <value>
                <elementReference>NotifyExternal</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>subject</name>
            <value>
                <elementReference>CaseClosedSubject</elementReference>
            </value>
        </inputParameters>
        <nameSegment>SendBetterEmail</nameSegment>
        <offset>0</offset>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </actionCalls>
    <actionCalls>
        <name>Send_Closed_Email_CC_0</name>
        <label>Send Closed Email CC</label>
        <locationX>3075</locationX>
        <locationY>20700</locationY>
        <actionName>SendBetterEmail</actionName>
        <actionType>apex</actionType>
        <connector>
            <targetReference>Was_it_an_Case_Closed_with_open_Slack_Channel</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>HTMLbody</name>
            <value>
                <elementReference>CaseClosedExternalBody</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>orgWideEmailAddressId</name>
            <value>
                <elementReference>OrgwideID</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>SendCCthisStringCollectionOfEmailAddresses</name>
        </inputParameters>
        <inputParameters>
            <name>SendTOthisOneEmailAddress</name>
            <value>
                <elementReference>NotifyExternal</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>subject</name>
            <value>
                <elementReference>CaseClosedSubject</elementReference>
            </value>
        </inputParameters>
        <nameSegment>SendBetterEmail</nameSegment>
        <offset>0</offset>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </actionCalls>
    <actionCalls>
        <name>Send_External_CC</name>
        <label>Send External CC</label>
        <locationX>5129</locationX>
        <locationY>16194</locationY>
        <actionName>SendBetterEmail</actionName>
        <actionType>apex</actionType>
        <connector>
            <targetReference>Convert_to_CSV</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>bcc</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>cb_bcc</name>
            <value>
                <stringValue>CB_FALSE</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>HTMLbody</name>
            <value>
                <elementReference>BodyExternalComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>orgWideEmailAddressId</name>
            <value>
                <elementReference>OrgwideID</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>SendCCthisStringCollectionOfEmailAddresses</name>
            <value>
                <elementReference>CCList</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>SendTOthisOneEmailAddress</name>
            <value>
                <elementReference>NotifyExternal</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>subject</name>
            <value>
                <elementReference>SubjectLineNewExternalComment</elementReference>
            </value>
        </inputParameters>
        <nameSegment>SendBetterEmail</nameSegment>
        <offset>0</offset>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </actionCalls>
    <actionCalls>
        <name>Send_External_No_CC</name>
        <label>Send External No CC</label>
        <locationX>5547</locationX>
        <locationY>16194</locationY>
        <actionName>SendBetterEmail</actionName>
        <actionType>apex</actionType>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Sent_Notification_0_0</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>HTMLbody</name>
            <value>
                <elementReference>BodyExternalComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>orgWideEmailAddressId</name>
            <value>
                <elementReference>ClosedComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>SendTOthisOneEmailAddress</name>
            <value>
                <elementReference>NotifyExternal</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>subject</name>
            <value>
                <elementReference>SubjectLineNewExternalComment</elementReference>
            </value>
        </inputParameters>
        <nameSegment>SendBetterEmail</nameSegment>
        <offset>0</offset>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </actionCalls>
    <actionCalls>
        <name>Send_Ryan_Email</name>
        <label>Send Ryan Email</label>
        <locationX>4978</locationX>
        <locationY>19560</locationY>
        <actionName>Case.Case_Analytics_Request_Ryan</actionName>
        <actionType>emailAlert</actionType>
        <connector>
            <targetReference>Was_the_Case_Category_changed</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>SObjectRowId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputParameters>
        <nameSegment>Case.Case_Analytics_Request_Ryan</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Send_Second_Batch_Of_Users_Notification_0</name>
        <label>Send Second Batch Of Users Notification</label>
        <locationX>4843</locationX>
        <locationY>16842</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <connector>
            <targetReference>Pass_External_Notes_to_Case_Comments</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>NotifyWPMFordFDNOwner</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>SubjectLineNewExternalComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>BodyExternalComment_ToInternal</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Send_WPM_Alert</name>
        <label>Send WPM Alert</label>
        <locationX>5946</locationX>
        <locationY>24155</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>$Record.Account.Product_Manager__r.Email</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>DefaultWorkflowUser</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>Stalled_Case_Subject</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>Stalled_Case_Email</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Send_WPM_Alert_0</name>
        <label>Send WPM Alert</label>
        <locationX>3636</locationX>
        <locationY>12030</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>$Record.Account.Product_Manager__r.Email</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>OnHoldSubject</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>OnHold</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Send_WPM_Needs_Info_Alert</name>
        <label>Send WPM Needs Info Alert</label>
        <locationX>4076</locationX>
        <locationY>12030</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>$Record.Account.Product_Manager__r.Email</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>NeedsInformationSubject</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>NeedsInformation</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Sent_Notification_0</name>
        <label>Sent Notification</label>
        <locationX>5338</locationX>
        <locationY>15978</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <connector>
            <targetReference>Process_CC_Gate</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>NotifyExternal</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>SubjectLineNewExternalComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>BodyExternalComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <actionCalls>
        <name>Sent_Notification_0_0</name>
        <label>Sent Notification</label>
        <locationX>4975</locationX>
        <locationY>16626</locationY>
        <actionName>emailSimple</actionName>
        <actionType>emailSimple</actionType>
        <connector>
            <targetReference>Are_There_Any_Recipients_0</targetReference>
        </connector>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>emailAddresses</name>
            <value>
                <elementReference>NotifyInternalCSTeam</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderType</name>
            <value>
                <stringValue>OrgWideEmailAddress</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>senderAddress</name>
            <value>
                <stringValue>tvmsupport@salesforce.teamvelocitymarketing.com</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailSubject</name>
            <value>
                <elementReference>SubjectLineNewExternalComment</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>emailBody</name>
            <value>
                <elementReference>BodyExternalComment_ToInternal</elementReference>
            </value>
        </inputParameters>
        <inputParameters>
            <name>sendRichBody</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputParameters>
        <nameSegment>emailSimple</nameSegment>
        <offset>0</offset>
    </actionCalls>
    <apiVersion>54.0</apiVersion>
    <assignments>
        <name>Add_Bug_Value_to_Budget</name>
        <label>Add Bug Value to Budget</label>
        <locationX>4186</locationX>
        <locationY>9738</locationY>
        <assignmentItems>
            <assignToReference>Get_Monthly_Budget.of_Bugs_this_Month__c</assignToReference>
            <operator>Add</operator>
            <value>
                <numberValue>1.0</numberValue>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Push_update_to_Monthly_Budget</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Add_Bug_Value_to_Budget_0</name>
        <label>Subtract Bug Value to Budget</label>
        <locationX>5044</locationX>
        <locationY>12138</locationY>
        <assignmentItems>
            <assignToReference>Get_Reopened_MB.of_Bugs_this_Month__c</assignToReference>
            <operator>Subtract</operator>
            <value>
                <numberValue>1.0</numberValue>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Push_update_to_Monthly_Budget_0</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Add_Dev_Hold_Hours</name>
        <label>Add Dev Hold Hours</label>
        <locationX>5110</locationX>
        <locationY>1524</locationY>
        <assignmentItems>
            <assignToReference>CurrDevHoldHours</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record.Dev_Hold_Hours__c</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>CurrDevHoldHours</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Calculate_Dev_Hold_Hours__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Dev_Hold_Hours</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Add_Loop_to_Full_CC_List</name>
        <label>Add Loop to Full CC List</label>
        <locationX>5090</locationX>
        <locationY>15510</locationY>
        <assignmentItems>
            <assignToReference>$Record.Full_CC_List__c</assignToReference>
            <operator>Add</operator>
            <value>
                <stringValue>,{!Loop_CC_List}</stringValue>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Loop_CC_List</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Assign_Closed_Comment</name>
        <label>Assign Closed Comment</label>
        <locationX>4579</locationX>
        <locationY>15978</locationY>
        <assignmentItems>
            <assignToReference>ClosedComment</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record.External_Notes__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Pass_External_Notes_to_Case_Comments</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>AssignCreatorOwnerPushList</name>
        <label>AssignCreatorOwnerPushList</label>
        <locationX>5242</locationX>
        <locationY>792</locationY>
        <assignmentItems>
            <assignToReference>AssignIPTeamList</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.OwnerId</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>AssignIPTeamList</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.CreatedById</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>AssignInternalTeamPushList</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>AssignInternalTeamPushList</name>
        <label>AssignInternalTeamPushList</label>
        <locationX>5242</locationX>
        <locationY>900</locationY>
        <assignmentItems>
            <assignToReference>PushInternalCSTeam</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Regional_Account_Director__c</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>PushInternalCSTeam</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Account_Manager__c</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>PushInternalCSTeam</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Account.Product_Manager__c</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>PushInternalCSTeam</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.CreatedById</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>PushInternalCSTeam</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Notify_Me__c</elementReference>
            </value>
        </assignmentItems>
        <assignmentItems>
            <assignToReference>PushInternalCSTeam</assignToReference>
            <operator>Add</operator>
            <value>
                <elementReference>$Record.Alerted_User_2__c</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Slack_Automation</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Set_Vendor_Id_Found</name>
        <label>Set Vendor Id (Found)</label>
        <locationX>4758</locationX>
        <locationY>9846</locationY>
        <assignmentItems>
            <assignToReference>varVendorId</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>Get_Vendor_by_Name.Id</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Get_Account_Vendor_Acct_Vendor</targetReference>
        </connector>
    </assignments>
    <assignments>
        <name>Update_Onboarding</name>
        <label>Update Onboarding</label>
        <locationX>5154</locationX>
        <locationY>2448</locationY>
        <assignmentItems>
            <assignToReference>Get_Onboarding.GA4_Case_ID__c</assignToReference>
            <operator>Assign</operator>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </assignmentItems>
        <connector>
            <targetReference>Update_Onboarding_Record</targetReference>
        </connector>
    </assignments>
    <constants>
        <name>CasesManual</name>
        <dataType>String</dataType>
        <value>
            <stringValue>a0NVb000003ojMnMAI</stringValue>
        </value>
    </constants>
    <constants>
        <name>GeneralSupportId</name>
        <dataType>String</dataType>
        <value>
            <stringValue>00G5f000003o8ejEAA</stringValue>
        </value>
    </constants>
    <decisions>
        <name>Account_Changed_gate</name>
        <label>Account Changed Gate</label>
        <locationX>5242</locationX>
        <locationY>5022</locationY>
        <defaultConnector>
            <targetReference>Check_RAD_Gate</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Account_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.AccountId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_RAD_0_0</targetReference>
            </connector>
            <label>Account Changed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Account_Vendor_Exists</name>
        <label>Account Vendor Exists?</label>
        <locationX>4890</locationX>
        <locationY>10146</locationY>
        <defaultConnector>
            <targetReference>Send_Survey</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default</defaultConnectorLabel>
        <rules>
            <name>If_NOT_found_Create_it</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Account_Vendor_Acct_Vendor.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Create_New_3rdPty_Vendor_Record</targetReference>
            </connector>
            <label>If NOT found: Create it</label>
        </rules>
        <rules>
            <name>If_found_Update_it</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Account_Vendor_Acct_Vendor.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Active_Vendor_Record</targetReference>
            </connector>
            <label>If found: Update it</label>
        </rules>
    </decisions>
    <decisions>
        <name>Any_Open_Digital_Cases_assigned_to_Cur_User</name>
        <label>Any Open Digital Cases assigned to Cur User?</label>
        <locationX>2888</locationX>
        <locationY>21792</locationY>
        <defaultConnector>
            <targetReference>Get_Oldest_Open_Digital_Case</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Open_Digital_Cases_assigned_to_Cur_User</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_User_s_Open_Digital_Cases.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <label>Yes, Open Digital Cases assigned to Cur User</label>
        </rules>
    </decisions>
    <decisions>
        <name>Any_People_in_Recipients_0</name>
        <label>Any People in Recipients?</label>
        <locationX>5129</locationX>
        <locationY>16518</locationY>
        <defaultConnector>
            <isGoTo>true</isGoTo>
            <targetReference>Are_There_Any_Recipients_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_People_In_Recipients_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>NotifyInternalCSTeam</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Sent_Notification_0_0</targetReference>
            </connector>
            <label>Yes People In Recipients</label>
        </rules>
    </decisions>
    <decisions>
        <name>Are_There_Any_Recipients_0</name>
        <label>Are There Any Recipients?</label>
        <locationX>4975</locationX>
        <locationY>16734</locationY>
        <defaultConnector>
            <targetReference>Pass_External_Notes_to_Case_Comments</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_0_0_0</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>NotifyWPMFordFDNOwner</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_Second_Batch_Of_Users_Notification_0</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <decisions>
        <name>Case_Closed</name>
        <label>Case Closed?</label>
        <locationX>5242</locationX>
        <locationY>9006</locationY>
        <defaultConnector>
            <targetReference>ReClosed_Case</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Case_Closed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Queue_Owned_Case_Closed</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Yes, Case Closed</label>
        </rules>
        <rules>
            <name>Yes_Case_Closed2</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_CS__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Digital__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_General__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.FD_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Production__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <isGoTo>true</isGoTo>
                <targetReference>Queue_Owned_Case_Closed</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Yes, Case Closed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Case_Stalled_General</name>
        <label>Case Stalled General</label>
        <locationX>9642</locationX>
        <locationY>276</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>General_Stalled_Case</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>General Support</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>On Hold</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Stalled_Case__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Foundation_Record__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Stalled_Case</targetReference>
            </connector>
            <label>General Stalled Case</label>
        </rules>
    </decisions>
    <decisions>
        <name>Changed_Away_from_Waiting_on_Dev</name>
        <label>Changed Away from Waiting on Dev</label>
        <locationX>5242</locationX>
        <locationY>1308</locationY>
        <defaultConnector>
            <targetReference>Resolution_Notes_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Status not Changed or With Dev</defaultConnectorLabel>
        <rules>
            <name>Changed_Away_from_Dev</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>In Progress with Dev</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>Selected for Dev</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>Waiting on Development</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Latest_Sent_to_Dev__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Dev_UnHold_Timestamp</targetReference>
            </connector>
            <label>Changed Away from Dev</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_AM_Gate</name>
        <label>Check AM Gate</label>
        <locationX>5506</locationX>
        <locationY>5430</locationY>
        <defaultConnector>
            <targetReference>Claim_Gate</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>AM_Blank</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Account_Manager__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Account.Account_Manager__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_RAD_0</targetReference>
            </connector>
            <label>AM Blank</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_for_Onboarding</name>
        <label>Check for Onboarding</label>
        <locationX>5242</locationX>
        <locationY>2124</locationY>
        <defaultConnector>
            <targetReference>Owner_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>GA4_Has_Onboarding_Record</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Add Dealer Managed GA4</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Onboarding_ID__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Onboarding</targetReference>
            </connector>
            <label>GA4 Has Onboarding Record</label>
        </rules>
    </decisions>
    <decisions>
        <name>Check_RAD_Gate</name>
        <label>Check RAD Gate</label>
        <locationX>5506</locationX>
        <locationY>5130</locationY>
        <defaultConnector>
            <targetReference>Check_AM_Gate</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>RAD_Blank</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Regional_Account_Director__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Account.Regional_Account_Director__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_RAD</targetReference>
            </connector>
            <label>RAD Blank</label>
        </rules>
    </decisions>
    <decisions>
        <name>Claim_Gate</name>
        <label>Claim Gate</label>
        <locationX>5242</locationX>
        <locationY>5814</locationY>
        <defaultConnector>
            <targetReference>SLA_Match</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Not Claimed</defaultConnectorLabel>
        <rules>
            <name>Claimed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Claim_Ownership__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Claim_It</targetReference>
            </connector>
            <label>Claimed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Closed_Case</name>
        <label>Closed Case</label>
        <locationX>4958</locationX>
        <locationY>15870</locationY>
        <defaultConnector>
            <targetReference>Sent_Notification_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Skip_Notification_because_it_s_Closed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Assign_Closed_Comment</targetReference>
            </connector>
            <label>Skip Notification because it&apos;s Closed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Copy_1_of_Dynamic_Time_Transition</name>
        <label>Dynamic Time Transition?</label>
        <locationX>754</locationX>
        <locationY>1116</locationY>
        <defaultConnector>
            <targetReference>Copy_2_of_Log_Regular_Time</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Copy_1_of_Yes_Internal_Feedback_Needed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Internal Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Log_Regular_Time</targetReference>
            </connector>
            <label>Yes, Internal Feedback Needed</label>
        </rules>
        <rules>
            <name>Copy_1_of_Yes_External_Feedback_Needed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>External Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Log_Regular_Time</targetReference>
            </connector>
            <label>Yes, External Feedback Needed</label>
        </rules>
        <rules>
            <name>Copy_1_of_Closed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Log_Regular_Time</targetReference>
            </connector>
            <label>Closed</label>
        </rules>
        <rules>
            <name>Ready_for_QA</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready For QA</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Log_Regular_Time</targetReference>
            </connector>
            <label>Ready for QA</label>
        </rules>
        <rules>
            <name>Yes_In_Progress</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>In Progress</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Log_Regular_Time</targetReference>
            </connector>
            <label>Yes In Progress</label>
        </rules>
    </decisions>
    <decisions>
        <name>Copy_1_of_Owner_Changed</name>
        <label>Owner Changed?</label>
        <locationX>1106</locationX>
        <locationY>384</locationY>
        <defaultConnector>
            <targetReference>Was_The_Case_Status_Changed_Used_for_Logging_Time</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Copy_1_of_Yes_Owner_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Workday_Hours_Unassigned__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>005</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Time_Stamp_Assigned</targetReference>
            </connector>
            <label>Yes Owner Changed</label>
        </rules>
        <rules>
            <name>Copy_1_of_Owner_Change_V2</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>005</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>00G</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Was_The_Case_Status_Changed_Used_for_Logging_Time</targetReference>
            </connector>
            <label>Owner Change V2</label>
        </rules>
        <rules>
            <name>Copy_1_of_Owner_Change_Slack_Owner</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>005</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Was_The_Case_Status_Changed_Used_for_Logging_Time</targetReference>
            </connector>
            <label>Owner Change (Slack Owner)</label>
        </rules>
    </decisions>
    <decisions>
        <name>Digital_Ticket_Closed</name>
        <label>Digital Ticket Closed?</label>
        <locationX>3141</locationX>
        <locationY>21576</locationY>
        <defaultConnector>
            <targetReference>Which_Contact_Gets_Updated</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Digital_Ticket</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital_Support</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>0055f000009AFNiAAO</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.AccountId</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>SKIPTHIS</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_User_s_Open_Digital_Cases</targetReference>
            </connector>
            <label>Yes, Digital Ticket</label>
        </rules>
    </decisions>
    <decisions>
        <name>Dynamic_Time_Transition</name>
        <label>Dynamic Time Transition?</label>
        <locationX>4912</locationX>
        <locationY>18486</locationY>
        <defaultConnector>
            <targetReference>Log_Regular_Time_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Dev_Hold</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Waiting on Development</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Log_Regular_Time</targetReference>
            </connector>
            <label>Yes, Dev Hold</label>
        </rules>
        <rules>
            <name>Yes_Internal_Feedback_Needed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Internal Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Log_Regular_Time</targetReference>
            </connector>
            <label>Yes, Internal Feedback Needed</label>
        </rules>
        <rules>
            <name>Yes_External_Feedback_Needed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>External Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Log_Regular_Time</targetReference>
            </connector>
            <label>Yes, External Feedback Needed</label>
        </rules>
        <rules>
            <name>Closed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Alert_The_Team</targetReference>
            </connector>
            <label>Closed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Forward_to_FD</name>
        <label>Forward to FD</label>
        <locationX>5506</locationX>
        <locationY>7914</locationY>
        <defaultConnector>
            <targetReference>Was_the_Account_populated</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>FD_Status_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.FD_Status_PL__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Status_Update_FD</targetReference>
            </connector>
            <label>FD Status Changed</label>
        </rules>
        <rules>
            <name>Yes_0_0_0_0_0</name>
            <conditionLogic>1 AND (2 OR 3 OR 4 OR 5)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Sync_FD__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.FD_Date_Opened__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Escalated</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>StatusChanged</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Escalated_To__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Service</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <decisions>
        <name>Forward_to_FD_0_0_0</name>
        <label>Forward to FD</label>
        <locationX>5066</locationX>
        <locationY>14262</locationY>
        <defaultConnector>
            <targetReference>Was_an_External_Note_Added</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_0_0_0_0_0_0_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Sync_FD__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.FD_Date_Opened__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Forward_to_FD_0_0</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <decisions>
        <name>Forward_to_FD_0_0_0_0_0</name>
        <label>Forward to FD</label>
        <locationX>4958</locationX>
        <locationY>17802</locationY>
        <defaultConnector>
            <targetReference>Status_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_0_0_0_0_0_0_0_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Sync_FD__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.FD_Date_Opened__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Forward_to_FD_0_0_0_0</targetReference>
            </connector>
            <label>forward to fd</label>
        </rules>
    </decisions>
    <decisions>
        <name>Forward_to_SD_0</name>
        <label>Forward to SD</label>
        <locationX>4958</locationX>
        <locationY>17502</locationY>
        <defaultConnector>
            <targetReference>Forward_to_FD_0_0_0_0_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital SD XXXXX</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Forward_Case_0</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <decisions>
        <name>Forward_to_SD_0_0</name>
        <label>Forward to SD</label>
        <locationX>5066</locationX>
        <locationY>13962</locationY>
        <defaultConnector>
            <targetReference>Forward_to_FD_0_0_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_0_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital SD XXXXX</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Forward_Case_0_0</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <decisions>
        <name>Forward_to_SD_0_0_0_0</name>
        <label>Forward to SD</label>
        <locationX>5242</locationX>
        <locationY>7806</locationY>
        <defaultConnector>
            <targetReference>Forward_to_FD</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_0_0_0_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital SD</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Was_the_Account_populated</targetReference>
            </connector>
            <label>Yes</label>
        </rules>
    </decisions>
    <decisions>
        <name>Found_Budget</name>
        <label>Found Budget</label>
        <locationX>4318</locationX>
        <locationY>9630</locationY>
        <defaultConnector>
            <targetReference>Send_Survey</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_has_budget</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Monthly_Budget</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Add_Bug_Value_to_Budget</targetReference>
            </connector>
            <label>Yes, has budget</label>
        </rules>
    </decisions>
    <decisions>
        <name>Found_Budget_0</name>
        <label>Found Budget</label>
        <locationX>5176</locationX>
        <locationY>12030</locationY>
        <defaultConnector>
            <targetReference>Mark_Case_Reopened</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_has_budget_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Reopened_MB</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Add_Bug_Value_to_Budget_0</targetReference>
            </connector>
            <label>Yes, has budget</label>
        </rules>
    </decisions>
    <decisions>
        <name>Is_Case_a_Bug</name>
        <label>Is Case a Bug?</label>
        <locationX>4714</locationX>
        <locationY>9414</locationY>
        <defaultConnector>
            <targetReference>X3PV_Case_Just_Closed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Its_a_Bug</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Bug</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Monthly_Budget</targetReference>
            </connector>
            <label>Yes, Its a Bug</label>
        </rules>
    </decisions>
    <decisions>
        <name>Is_Case_a_Bug_0</name>
        <label>Is Case a Bug?</label>
        <locationX>5330</locationX>
        <locationY>11814</locationY>
        <defaultConnector>
            <targetReference>Mark_Case_Reopened</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Its_a_Bug_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Bug</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Reopened_MB</targetReference>
            </connector>
            <label>Yes, Its a Bug</label>
        </rules>
    </decisions>
    <decisions>
        <name>Is_Owner_Currently_CTL</name>
        <label>Is Owner Currently CTL?</label>
        <locationX>5726</locationX>
        <locationY>3672</locationY>
        <defaultConnector>
            <targetReference>Set_Owner_to_WPM_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Change Owner</defaultConnectorLabel>
        <rules>
            <name>Support_Owner</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Owner:User.Profile.Name</leftValueReference>
                <operator>Contains</operator>
                <rightValue>
                    <stringValue>Support</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Was_Jira_ID_Changed</targetReference>
            </connector>
            <label>Support Owner</label>
        </rules>
    </decisions>
    <decisions>
        <name>Is_the_Case_Closed</name>
        <label>Is the Case Open</label>
        <locationX>9202</locationX>
        <locationY>276</locationY>
        <defaultConnectorLabel>No, The Case is Closed</defaultConnectorLabel>
        <rules>
            <name>Yes_The_Case_is_Open</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>Production Complete</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>Waiting on Development</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>In Progress with Dev</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>Selected for Dev</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>On Hold</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Stalled_Case__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Foundation_Record__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Stalled_Case</targetReference>
            </connector>
            <label>Yes, The Case is Open</label>
        </rules>
    </decisions>
    <decisions>
        <name>Notify2_Null_Handling</name>
        <label>Notify2 Null Handling</label>
        <locationX>3141</locationX>
        <locationY>21276</locationY>
        <defaultConnector>
            <targetReference>Digital_Ticket_Closed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Not_Null</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>NotifyWPMFordFDNOwner</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_Case_Closed_Alert_0_0</targetReference>
            </connector>
            <label>Not Null</label>
        </rules>
    </decisions>
    <decisions>
        <name>Null_Handling</name>
        <label>Null Handling</label>
        <locationX>3141</locationX>
        <locationY>20184</locationY>
        <defaultConnector>
            <targetReference>Null_Handling_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No Recipients</defaultConnectorLabel>
        <rules>
            <name>Recipients_Found</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>NotifyInternalCSTeam</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_Case_Closed_Alert</targetReference>
            </connector>
            <label>Recipients Found</label>
        </rules>
    </decisions>
    <decisions>
        <name>Null_Handling_0</name>
        <label>External Notification Null Handling</label>
        <locationX>3141</locationX>
        <locationY>20484</locationY>
        <defaultConnector>
            <targetReference>Was_it_an_Case_Closed_with_open_Slack_Channel</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No Recipients</defaultConnectorLabel>
        <rules>
            <name>Recipients_Found_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>NotifyExternal</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.External_Notes_Rich__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Process_CC_Gate_0_0</targetReference>
            </connector>
            <label>Recipients Found</label>
        </rules>
    </decisions>
    <decisions>
        <name>Null_Handling_0_0</name>
        <label>Null Handling</label>
        <locationX>4978</locationX>
        <locationY>5238</locationY>
        <defaultConnectorLabel>No Recipients</defaultConnectorLabel>
        <rules>
            <name>Recipients_Found_0_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>NotifyInternalCSTeam</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Email_to_GS_Support_0</targetReference>
            </connector>
            <label>Recipients Found</label>
        </rules>
    </decisions>
    <decisions>
        <name>Oldest_Record_Found</name>
        <label>Oldest Record Found?</label>
        <locationX>3086</locationX>
        <locationY>22008</locationY>
        <defaultConnector>
            <targetReference>Which_Contact_Gets_Updated</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Oldest_Record_Found</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Oldest_Open_Digital_Case.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Assign_Current_User_to_Oldest_open_digital_Ticket</targetReference>
            </connector>
            <label>Yes, Oldest Record Found</label>
        </rules>
    </decisions>
    <decisions>
        <name>Owner_Changed</name>
        <label>Owner Changed?</label>
        <locationX>5242</locationX>
        <locationY>2940</locationY>
        <defaultConnector>
            <targetReference>Was_3rd_Party_Integration_Approval_Status_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Owner_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Workday_Hours_Unassigned__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>005</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Time_Stamp_Assigned</targetReference>
            </connector>
            <label>Yes Owner Changed</label>
        </rules>
        <rules>
            <name>Owner_Change_V2</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>005</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>00G</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <isGoTo>true</isGoTo>
                <targetReference>Log_Unassigned_Time</targetReference>
            </connector>
            <label>Owner Change V2</label>
        </rules>
        <rules>
            <name>Owner_Change_Slack_Owner</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>005</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <isGoTo>true</isGoTo>
                <targetReference>Store_Slack_Owner</targetReference>
            </connector>
            <label>Owner Change (Slack Owner)</label>
        </rules>
    </decisions>
    <decisions>
        <name>Process_CC_Gate</name>
        <label>Process CC Gate</label>
        <locationX>5338</locationX>
        <locationY>16086</locationY>
        <defaultConnector>
            <targetReference>Send_External_No_CC</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Cc_List_Exists</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Latest_CC_List_Long__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_External_CC</targetReference>
            </connector>
            <label>Cc List Exists</label>
        </rules>
    </decisions>
    <decisions>
        <name>Process_CC_Gate_0</name>
        <label>Process CC Gate</label>
        <locationX>4958</locationX>
        <locationY>15078</locationY>
        <defaultConnector>
            <targetReference>Closed_Case</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Cc_List_Exists_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Latest_CC_List_Long__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>ConvertCCtoCollection</targetReference>
            </connector>
            <label>Cc List Exists</label>
        </rules>
    </decisions>
    <decisions>
        <name>Process_CC_Gate_0_0</name>
        <label>Process CC Gate</label>
        <locationX>2943</locationX>
        <locationY>20592</locationY>
        <defaultConnector>
            <targetReference>Send_Closed_Email_CC_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Cc_List_Exists_0_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Current_CC_List__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_Closed_Email_CC</targetReference>
            </connector>
            <label>Cc List Exists</label>
        </rules>
    </decisions>
    <decisions>
        <name>Queue_Owned_Case_Closed</name>
        <label>Queue Owned Case Closed?</label>
        <locationX>4714</locationX>
        <locationY>9114</locationY>
        <defaultConnector>
            <targetReference>Update_Owner_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Case_Closed_Without_Owner</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Owner_Type__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>User Owned</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Owner</targetReference>
            </connector>
            <label>Yes, Case Closed Without Owner</label>
        </rules>
    </decisions>
    <decisions>
        <name>Quick_Cancelled</name>
        <label>Quick Cancelled?</label>
        <locationX>5242</locationX>
        <locationY>492</locationY>
        <defaultConnector>
            <targetReference>AssignCreatorOwnerPushList</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Cancelled</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Quick_Cancel__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Cancel_Ticket</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Yes, Cancelled</label>
        </rules>
    </decisions>
    <decisions>
        <name>ReClosed_Case</name>
        <label>ReClosed Case?</label>
        <locationX>5242</locationX>
        <locationY>11406</locationY>
        <defaultConnector>
            <targetReference>Was_the_Status_changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_ReClosed</name>
            <conditionLogic>1 AND ((2 and 5) or 3 or 4)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Reopened_Date__c</leftValueReference>
                <operator>GreaterThan</operator>
                <rightValue>
                    <elementReference>$Record.ClosedDate</elementReference>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital Complete</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Cancelled</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Digital_Feedback_Required__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_ReClosing_Vars</targetReference>
            </connector>
            <label>Yes, ReClosed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Resolution_Notes_Changed</name>
        <label>Resolution Notes Changed?</label>
        <locationX>5242</locationX>
        <locationY>1824</locationY>
        <defaultConnector>
            <targetReference>Check_for_Onboarding</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_resolution_Notes_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Resolution_Notes__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Create_Note</targetReference>
            </connector>
            <label>Yes, resolution Notes Changed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Send_Compliance_Message</name>
        <label>Send Compliance Message?</label>
        <locationX>4714</locationX>
        <locationY>11022</locationY>
        <defaultConnector>
            <targetReference>Set_Close_Date</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Message_Compliance</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Compliance</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Close_Date</targetReference>
            </connector>
            <label>Yes, Message Compliance</label>
        </rules>
    </decisions>
    <decisions>
        <name>Send_Survey</name>
        <label>Send Survey?</label>
        <locationX>4714</locationX>
        <locationY>10614</locationY>
        <defaultConnector>
            <targetReference>Send_Compliance_Message</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Dont Send Survey</defaultConnectorLabel>
        <rules>
            <name>Yes_Send_Survey</name>
            <conditionLogic>1 AND 2 AND 3 AND (4 OR 5 OR 6 OR 7 OR 8 OR 9)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Survey_Sent__c</leftValueReference>
                <operator>IsBlank</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Account.T3__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Contact.Email</leftValueReference>
                <operator>Contains</operator>
                <rightValue>
                    <stringValue>@</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Email</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Phone</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Web</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Email (WS)</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Major Auto Groups</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Lithia</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Create_Survey_Deployment_Link</targetReference>
            </connector>
            <label>Yes, Send Survey</label>
        </rules>
    </decisions>
    <decisions>
        <name>Send_WPM_Info_Needed_Email</name>
        <label>Send WPM Info Needed Email?</label>
        <locationX>4208</locationX>
        <locationY>11922</locationY>
        <defaultConnector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Send_WPM_Info_Needed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Account.Product_Manager__r.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Apollo_Websites</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_WPM_Needs_Info_Alert</targetReference>
            </connector>
            <label>Yes, Send WPM Info Needed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Send_WPM_On_Hold_Email</name>
        <label>Send WPM On Hold Email?</label>
        <locationX>3768</locationX>
        <locationY>11922</locationY>
        <defaultConnector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Send_WPM_On_Hold</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Account.Product_Manager__r.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Apollo_Websites</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_WPM_Alert_0</targetReference>
            </connector>
            <label>Yes, Send WPM On Hold</label>
        </rules>
    </decisions>
    <decisions>
        <name>send_WPM_Stalled_Email</name>
        <label>send WPM Stalled Email?</label>
        <locationX>6078</locationX>
        <locationY>24047</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Send_WPM_Stalled</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Account.Product_Manager__r.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Apollo_Websites</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Send_WPM_Alert</targetReference>
            </connector>
            <label>Yes, Send WPM Stalled</label>
        </rules>
    </decisions>
    <decisions>
        <name>Skip_Onboarding</name>
        <label>Skip Onboarding</label>
        <locationX>5066</locationX>
        <locationY>2340</locationY>
        <defaultConnector>
            <targetReference>Update_Onboarding</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Onboarding_Null</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Onboarding</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Owner_Changed</targetReference>
            </connector>
            <label>Onboarding Null</label>
        </rules>
    </decisions>
    <decisions>
        <name>Skip_Sending_Notification</name>
        <label>Skip Sending Internal Notification</label>
        <locationX>5066</locationX>
        <locationY>13446</locationY>
        <defaultConnector>
            <targetReference>TVM_Internal_Note_Push</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Skip_Send_Internal</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Pass_Internal_Note_to_Internal_External_Notes</targetReference>
            </connector>
            <label>Skip Send Internal</label>
        </rules>
    </decisions>
    <decisions>
        <name>SLA_Match</name>
        <label>SLA Match</label>
        <locationX>5242</locationX>
        <locationY>6114</locationY>
        <defaultConnector>
            <targetReference>Was_RAD_or_SEO_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>SLA Matches</defaultConnectorLabel>
        <rules>
            <name>SLA_Mismatch</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.SLA_Level__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <elementReference>$Record.SLA_Static__c</elementReference>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_SLA_Static</targetReference>
            </connector>
            <label>SLA Mismatch</label>
        </rules>
    </decisions>
    <decisions>
        <name>Slack_Automation</name>
        <label>Slack Automation</label>
        <locationX>5242</locationX>
        <locationY>1008</locationY>
        <defaultConnector>
            <targetReference>Changed_Away_from_Waiting_on_Dev</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Create_an_Opportunity</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.SlackVar__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>CreateOpp</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Create_Buy_Sell_Opp</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Create an Opportunity</label>
        </rules>
    </decisions>
    <decisions>
        <name>Status_Changed</name>
        <label>Was The Status Changed? (Used for Logging Time)</label>
        <locationX>5242</locationX>
        <locationY>18270</locationY>
        <defaultConnector>
            <targetReference>Was_the_Case_Request_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Status_Changed</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_CS__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.FD_Status__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_General__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Digital__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status_Production__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Nullify_Stall</targetReference>
            </connector>
            <label>Yes, Status Changed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Support_Owner234</name>
        <label>Support Owner?</label>
        <locationX>4890</locationX>
        <locationY>3672</locationY>
        <defaultConnector>
            <targetReference>Set_Owner_to_WPM</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Support_Ownner</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Owner:User.Profile.Name</leftValueReference>
                <operator>Contains</operator>
                <rightValue>
                    <stringValue>Support</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Was_Jira_ID_Changed</targetReference>
            </connector>
            <label>Yes Support Ownner</label>
        </rules>
        <rules>
            <name>Check_For_Case_Assigment</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>005</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Owner_Back_to_Support_User</targetReference>
            </connector>
            <label>Check For Case Assigment</label>
        </rules>
    </decisions>
    <decisions>
        <name>Temp_disable</name>
        <label>Temp disable</label>
        <locationX>5550</locationX>
        <locationY>8130</locationY>
        <defaultConnector>
            <targetReference>Update_Attachment_URLS</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Disable</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Id</leftValueReference>
                <operator>EqualTo</operator>
            </conditions>
            <connector>
                <targetReference>Forward_to_FD_0</targetReference>
            </connector>
            <label>Disable</label>
        </rules>
    </decisions>
    <decisions>
        <name>Testing_Decision</name>
        <label>Testing Decision</label>
        <locationX>2514</locationX>
        <locationY>276</locationY>
        <defaultConnector>
            <targetReference>Create_Touch</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Terminate_Flow</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Terminate_Flow__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <label>Terminate Flow</label>
        </rules>
        <rules>
            <name>Set_Testing_FLow</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Major Auto Groups</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Testing_Flow</targetReference>
            </connector>
            <label>Set Testing FLow</label>
        </rules>
        <rules>
            <name>Is_if_Foundation_Record</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Foundation_Record__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Owner_Changed</targetReference>
            </connector>
            <label>Is if Foundation Record</label>
        </rules>
    </decisions>
    <decisions>
        <name>Testing_Element</name>
        <label>Testing Element</label>
        <locationX>4672</locationX>
        <locationY>14862</locationY>
        <defaultConnector>
            <targetReference>Remove_HTML_Tags_from_Comments_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Bypass</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Status_Changed</targetReference>
            </connector>
            <label>Bypass</label>
        </rules>
    </decisions>
    <decisions>
        <name>Update_Full_CC_List</name>
        <label>Update Full CC List</label>
        <locationX>5002</locationX>
        <locationY>15402</locationY>
        <defaultConnector>
            <targetReference>Add_Loop_to_Full_CC_List</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Email_Already_Exists</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Full_CC_List__c</leftValueReference>
                <operator>Contains</operator>
                <rightValue>
                    <elementReference>Loop_CC_List</elementReference>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Loop_CC_List</targetReference>
            </connector>
            <label>Email Already Exists</label>
        </rules>
    </decisions>
    <decisions>
        <name>Valid_Email</name>
        <label>Valid Email?</label>
        <locationX>5242</locationX>
        <locationY>23352</locationY>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Valid_Email</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_GeneralSupport_Queue.Email</leftValueReference>
                <operator>Contains</operator>
                <rightValue>
                    <stringValue>@</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.SuppliedEmail</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>dataandfortelliscases@cdk.com</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Email_to_GS_Support</targetReference>
            </connector>
            <label>Yes Valid Email</label>
        </rules>
    </decisions>
    <decisions>
        <name>Vendor_Found</name>
        <label>Vendor Found?</label>
        <locationX>4890</locationX>
        <locationY>9738</locationY>
        <defaultConnector>
            <targetReference>Create_Vendor</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>yes_found</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Vendor_by_Name.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Vendor_Id_Found</targetReference>
            </connector>
            <label>yes, found</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_3rd_Party_Integration_Approval_Status_Changed</name>
        <label>Was 3rd Party Integration Approval Status Changed?</label>
        <locationX>5242</locationX>
        <locationY>3456</locationY>
        <defaultConnector>
            <targetReference>Was_Jira_ID_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Approval_Status_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.X3rd_Party_Integration_Approval_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Approval Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Time_Stamp_3rd_Party_Started</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Yes, Approval Needed</label>
        </rules>
        <rules>
            <name>Yes_Status_Rejected</name>
            <conditionLogic>(1 OR 2) AND 3</conditionLogic>
            <conditions>
                <leftValueReference>$Record.X3rd_Party_Integration_Approval_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Rejected - Not Executing</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.X3rd_Party_Integration_Approval_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Rejected - Switched to TVM App</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.X3rd_Party_Integration_Approval_Status__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Store_Rejecter</targetReference>
            </connector>
            <label>Yes Status Rejected</label>
        </rules>
        <rules>
            <name>Auto_Approved</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.X3rd_Party_Integration_Approval_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Auto-Approved</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <isGoTo>true</isGoTo>
                <targetReference>Is_Owner_Currently_CTL</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Auto Approved</label>
        </rules>
        <rules>
            <name>Yes_Status_Approved</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.X3rd_Party_Integration_Approval_Status__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Store_Approver</targetReference>
            </connector>
            <label>Yes, Status Approved</label>
        </rules>
    </decisions>
    <decisions>
        <description>Determines if the External Note field was populated.</description>
        <name>Was_an_External_Note_Added</name>
        <label>Was an External Note Added?</label>
        <locationX>5242</locationX>
        <locationY>14646</locationY>
        <defaultConnector>
            <targetReference>Status_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>External Note not added</defaultConnectorLabel>
        <rules>
            <name>Yes_an_External_Note_was_added</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.External_Notes_Rich__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Dealership_Contact_Email_Formula__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>TVM_Send_Error_Email</targetReference>
            </connector>
            <label>Yes, an External Note was added</label>
        </rules>
    </decisions>
    <decisions>
        <description>Determines if the Internal Note field was populated.</description>
        <name>Was_an_Internal_Note_Added</name>
        <label>Was an Internal Note Added?</label>
        <locationX>5242</locationX>
        <locationY>13230</locationY>
        <defaultConnector>
            <targetReference>Was_an_External_Note_Added</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Internal Note not added</defaultConnectorLabel>
        <rules>
            <name>Yes_Internal_Note_added</name>
            <conditionLogic>1</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Internal_Notes_Rich__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Remove_HTML_Tags</targetReference>
            </connector>
            <label>Yes, Internal Note added</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_it_an_Case_Closed_with_open_Slack_Channel</name>
        <label>Was it an Case Closed with open Slack Channel?</label>
        <locationX>3141</locationX>
        <locationY>20976</locationY>
        <defaultConnector>
            <targetReference>Notify2_Null_Handling</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Completed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Slack_Channel_Id__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Archive_Slack_Channel2</targetReference>
            </connector>
            <label>Yes, Completed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_Jira_ID_Changed</name>
        <label>Was Jira ID Changed?</label>
        <locationX>5242</locationX>
        <locationY>4056</locationY>
        <defaultConnector>
            <targetReference>Was_Jira_Status_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Jira_Id_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Waiting_on_Development_Status</targetReference>
            </connector>
            <label>Yes, Jira Id Changed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_Jira_Status_Changed</name>
        <label>Jira Status Changed?</label>
        <locationX>5242</locationX>
        <locationY>4356</locationY>
        <defaultConnector>
            <targetReference>Account_Changed_gate</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>SF_Status_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Was_Jira_Status_Changed_0</targetReference>
            </connector>
            <label>SF Status Changed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_Jira_Status_Changed_0</name>
        <label>Jira Status Changed?</label>
        <locationX>4582</locationX>
        <locationY>4464</locationY>
        <defaultConnector>
            <isGoTo>true</isGoTo>
            <targetReference>Account_Changed_gate</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>SF_Ready_for_Testing_0</name>
            <conditionLogic>(1 AND 2) OR (3 AND 4) OR (5 AND 6) OR (7 AND 8) OR (9 AND 10)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Done</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AER-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready for Review</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>DATA-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready for Review</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>COM-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready for Testing</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AW-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>IM-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready For Review</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Ready_for_Testing_Status</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Ready for Testing</label>
        </rules>
        <rules>
            <name>Waiting_on_Development</name>
            <conditionLogic>(1 AND 2) OR (3 AND 4) OR (5 AND 6) OR (7 AND 8) OR (9 AND 10) OR (11 AND 12)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AER-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Backlog</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>DATA-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>To Do</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>COM-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>To Do</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AW-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Waiting on Dev</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AW-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Back to Dev</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>IM-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Backlog</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Waiting_on_Development_Status4563456</targetReference>
            </connector>
            <label>Waiting on Development</label>
        </rules>
        <rules>
            <name>In_Progress_with_Dev</name>
            <conditionLogic>(1 AND 2) OR (3 AND 4) OR (5 AND 6) OR (7 AND 8) OR (9 AND 10)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AER-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>In Progress</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>DATA-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>In Progress</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>COM-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>In Progress</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AW-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>In Progress with Dev</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>IM-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>In Progress</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_In_Progress_with_Dev_Status</targetReference>
            </connector>
            <label>In Progress with Dev</label>
        </rules>
        <rules>
            <name>Selected_for_Dev</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AW-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Selected for Dev</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_3_of_Set_OnHold_Status</targetReference>
            </connector>
            <label>Selected for Dev</label>
        </rules>
        <rules>
            <name>Needs_Information_AW</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AW-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Need Information</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Internal_Feedback_Needed_Status</targetReference>
            </connector>
            <label>Needs Information AW</label>
        </rules>
        <rules>
            <name>On_Hold_AW</name>
            <conditionLogic>(1 AND 2) OR (3 AND 4)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AW-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>On Hold</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>IM-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Blocked/OnHold/Info</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_OnHold_Status</targetReference>
            </connector>
            <label>On Hold AW</label>
        </rules>
        <rules>
            <name>Done</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Done</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Ready_for_Testing_Status5678e567</targetReference>
            </connector>
            <label>Done</label>
        </rules>
        <rules>
            <name>Won_t_Do</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>IM-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Won&apos;t Do</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Ready_for_Testing_Status5678e567</targetReference>
            </connector>
            <label>Won&apos;t Do</label>
        </rules>
        <rules>
            <name>Canceled</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_ID__c</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>AW-</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Canceled</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Ready_for_Testing_Status5678e567</targetReference>
            </connector>
            <label>Canceled</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_Parent_Account_Found</name>
        <label>Was Parent Account Found?</label>
        <locationX>5077</locationX>
        <locationY>6630</locationY>
        <defaultConnector>
            <targetReference>Forward_to_SD_0_0_0_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No, Parent Account Not Found</defaultConnectorLabel>
        <rules>
            <name>Yes_Parent_Account_Found</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>Get_Parent_Account</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Was_RAD_or_SEO_Changed_0</targetReference>
            </connector>
            <label>Yes, Parent Account Found</label>
        </rules>
    </decisions>
    <decisions>
        <description>The field &apos;Production Complete&apos; will be used to indicate that production was complete and the corresponding case status will also be changed.</description>
        <name>Was_Production_Complete_checked</name>
        <label>Was Production Complete checked</label>
        <locationX>5242</locationX>
        <locationY>12822</locationY>
        <defaultConnector>
            <targetReference>Was_an_Internal_Note_Added</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No, Production Complete was not checked</defaultConnectorLabel>
        <rules>
            <name>Yes_Production_Complete_was_checked</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Production_Complete__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Production_Support_status_if_Production_Complete</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Yes, Production Complete was checked</label>
        </rules>
        <rules>
            <name>CC_List_Update</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Full_CC_List__c</leftValueReference>
                <operator>Contains</operator>
                <rightValue>
                    <stringValue>;</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Initial_CC_List__c</leftValueReference>
                <operator>Contains</operator>
                <rightValue>
                    <stringValue>;</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_CC_Lists</targetReference>
            </connector>
            <label>CC List Update</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_RAD_or_SEO_Changed</name>
        <label>Was RAD or SEO Changed?</label>
        <locationX>5242</locationX>
        <locationY>6414</locationY>
        <defaultConnector>
            <targetReference>Forward_to_SD_0_0_0_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No, RAD or SEO wasn&apos;t changed</defaultConnectorLabel>
        <rules>
            <name>Yes_RAD_or_SEO_was_changed</name>
            <conditionLogic>(1 AND 2) OR (3 AND 4)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Regional_Account_Director__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Regional_Account_Director__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.SEO_Analyst__r.Id</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.SEO_Team_Lead__r.Id</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Parent_Account</targetReference>
            </connector>
            <label>Yes, RAD or SEO was changed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_RAD_or_SEO_Changed_0</name>
        <label>Was RAD Changed?</label>
        <locationX>4923</locationX>
        <locationY>6738</locationY>
        <defaultConnector>
            <targetReference>Was_RAD_or_SEO_Changed_0_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No, RAD changed</defaultConnectorLabel>
        <rules>
            <name>Yes_RAD_or_SEO_was_changed_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Regional_Account_Director__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Regional_Account_Director__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Parent_Account</targetReference>
            </connector>
            <label>Yes, RAD</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_RAD_or_SEO_Changed_0_0</name>
        <label>Was SEO Analyst Changed?</label>
        <locationX>4923</locationX>
        <locationY>7038</locationY>
        <defaultConnector>
            <targetReference>Was_RAD_or_SEO_Changed_0_0_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_RAD_or_SEO_was_changed_0_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Regional_Account_Director__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.SEO_Analyst__r.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Parent_Account_0</targetReference>
            </connector>
            <label>Yes, SEO Analyst Changed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_RAD_or_SEO_Changed_0_0_0</name>
        <label>Was SEO TL Changed?</label>
        <locationX>4923</locationX>
        <locationY>7338</locationY>
        <defaultConnector>
            <targetReference>Forward_to_SD_0_0_0_0</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_RAD_or_SEO_was_changed_0_0_0</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.SEO_Team_Lead__r.Id</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.SEO_Team_Lead__r.Id</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Parent_Account_0_0</targetReference>
            </connector>
            <label>Yes, SEO TL Changed</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_Subcategory_Changed</name>
        <label>Was Subcategory Changed?</label>
        <locationX>5242</locationX>
        <locationY>19344</locationY>
        <defaultConnector>
            <targetReference>Was_the_Case_Category_changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Alert_Ryan</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Subcategory__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Website Reporting</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Analytics Request (Ryan)</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Assign_Ryan_Owner</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Yes, Alert Ryan</label>
        </rules>
        <rules>
            <name>JIRA_Status_Ready_for_Review</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Ready for Review</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Jira_Status__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>set_Ready_for_Review_status</targetReference>
            </connector>
            <label>JIRA Status Ready for Review</label>
        </rules>
    </decisions>
    <decisions>
        <description>Determines if the Account field was just populated.</description>
        <name>Was_the_Account_populated</name>
        <label>Was the Account populated?</label>
        <locationX>5242</locationX>
        <locationY>8706</locationY>
        <defaultConnector>
            <targetReference>Case_Closed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No, the Account field was not populated</defaultConnectorLabel>
        <rules>
            <name>Yes_the_Account_field_was_populated</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.AccountId</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.AccountId</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Populate_Regional_Account_Director_and_Account_Manager</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Yes, the Account field was populated</label>
        </rules>
    </decisions>
    <decisions>
        <description>Determines if the Case Category was changed and if so, to what value.</description>
        <name>Was_the_Case_Category_changed</name>
        <label>Was the Case Category changed?</label>
        <locationX>5242</locationX>
        <locationY>19752</locationY>
        <defaultConnector>
            <isGoTo>true</isGoTo>
            <targetReference>Was_the_Case_Owner_changed_to_a_User</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Case Category was not changed</defaultConnectorLabel>
        <rules>
            <name>Skip_temp_while_merging_FDN</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Salesforce</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Subject</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Add Service Coupons</stringValue>
                </rightValue>
            </conditions>
            <label>Skip (temp while merging FDN)</label>
        </rules>
        <rules>
            <name>Inventory_Support</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Vauto Direct Request</stringValue>
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
                <targetReference>Get_Inventory_Support_Queue</targetReference>
            </connector>
            <label>Inventory Support</label>
        </rules>
        <rules>
            <name>X3rd_Party</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Add 3rd Party Integration</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_3rd_Party_Status</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>3rd Party</label>
        </rules>
        <rules>
            <name>Case_Category_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <isGoTo>true</isGoTo>
                <targetReference>Was_the_Case_Owner_changed_to_a_User</targetReference>
            </connector>
            <label>Case Category Changed</label>
        </rules>
        <rules>
            <name>Apollo_Websites_Support_Queue</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Apollo_Websites</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Subcategory__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue>Website Reporting</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_GeneralSupport_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Apollo Websites Support Queue</label>
        </rules>
        <rules>
            <name>Website_Analytics</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Website Analytics</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <isGoTo>true</isGoTo>
                <targetReference>Get_Website_Analytics_Support_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Website Analytics</label>
        </rules>
        <rules>
            <name>Dealer_Analytics</name>
            <conditionLogic>(1 AND 2) OR 3</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Apollo_Websites</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Subcategory__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Website Reporting</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Website Analytics</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Website_Analytics_Support_Queue</targetReference>
            </connector>
            <label>Dealer Analytics</label>
        </rules>
        <rules>
            <name>Data_Support_Queue</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Data_Support</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Data_Support_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Data Support Queue</label>
        </rules>
        <rules>
            <name>Product_Support_Queue</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Production Support</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Production_Support_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Product Support Queue</label>
        </rules>
        <rules>
            <name>Digital_Support_Queue</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital_Support</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Digital_Support_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Digital Support Queue</label>
        </rules>
        <rules>
            <name>Digital_Reporting</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital Reporting</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Digital_Reporting_Queue</targetReference>
            </connector>
            <label>Digital Reporting</label>
        </rules>
        <rules>
            <name>Digital_OEM</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital OEM</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Digital_OEM_Queue</targetReference>
            </connector>
            <label>Digital OEM</label>
        </rules>
        <rules>
            <name>Digital_SD</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital SD</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Transfer_Case_Creater</targetReference>
            </connector>
            <label>Digital SD</label>
        </rules>
        <rules>
            <name>Foundation_Digital_Support_Queue</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Foundation Digital Support</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Foundation_Data_Support_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Foundation Digital Support Queue</label>
        </rules>
        <rules>
            <name>Marketing_Support_Queue</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Marketing</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Marketing_Support_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Marketing Support Queue</label>
        </rules>
        <rules>
            <name>Apollo_Support_Queue</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Apollo Support</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Apollo_Support_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Apollo Support Queue</label>
        </rules>
        <rules>
            <name>Advid</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Advid Creative</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Advid_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Advid</label>
        </rules>
        <rules>
            <name>Command_Center</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Command Center</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Command_Center_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Command Center</label>
        </rules>
        <rules>
            <name>SEO</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>SEO</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_SEO_Support_Queue</targetReference>
            </connector>
            <label>SEO</label>
        </rules>
        <rules>
            <name>Account_Manager</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>General Support</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Account.Account_Manager__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_GeneralSupport_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Account Manager</label>
        </rules>
        <rules>
            <name>Major_AG_General_Support</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>General Support</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Origin</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Major Auto Groups</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Major_AG_GeneralSupport_Queue</targetReference>
            </connector>
            <label>Major AG General Support</label>
        </rules>
        <rules>
            <name>Pit_Crew</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Account.Pit_Crew__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Assign_to_Pit_Crew__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Transfer_Case_to_GS_Queue_0_0</targetReference>
            </connector>
            <label>Pit Crew</label>
        </rules>
        <rules>
            <name>General_Support</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Category__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>General Support</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_GeneralSupport_Queue</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>General Support</label>
        </rules>
    </decisions>
    <decisions>
        <description>Determines if the Case&apos;s Status was changed to Closed.</description>
        <name>Was_the_Case_Closed</name>
        <label>Was the Case Closed?</label>
        <locationX>2998</locationX>
        <locationY>20076</locationY>
        <defaultConnectorLabel>Case was not Closed</defaultConnectorLabel>
        <rules>
            <name>Case_Closed_V2_Bypass</name>
            <conditionLogic>1 AND (2 OR 3) and 4 AND 5</conditionLogic>
            <conditions>
                <leftValueReference>$Record.ClosedDate</leftValueReference>
                <operator>GreaterThan</operator>
                <rightValue>
                    <dateTimeValue>2024-08-20T05:00:00.000Z</dateTimeValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.External_Notes_Rich__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Internal_Notes_Rich__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.AccountId</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.ClosedDate</leftValueReference>
                <operator>EqualTo</operator>
            </conditions>
            <label>Case Closed V2 Bypass</label>
        </rules>
        <rules>
            <name>Case_Closed_V2</name>
            <conditionLogic>(1 AND 2) OR 3</conditionLogic>
            <conditions>
                <leftValueReference>$Record.ClosedDate</leftValueReference>
                <operator>GreaterThan</operator>
                <rightValue>
                    <dateTimeValue>2024-08-20T05:00:00.000Z</dateTimeValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.ClosedDate</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Closed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Null_Handling</targetReference>
            </connector>
            <label>Case Closed V2</label>
        </rules>
    </decisions>
    <decisions>
        <description>Determines if the Case Owner field is changed to a User.</description>
        <name>Was_the_Case_Owner_changed_to_a_User</name>
        <label>Was the Case Owner changed to a User?</label>
        <locationX>2580</locationX>
        <locationY>19968</locationY>
        <defaultConnector>
            <targetReference>Was_the_Case_Closed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No, the Case Owner was not changed.</defaultConnectorLabel>
        <rules>
            <name>Yes_the_Case_Owner_was_changed_to_a_User</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.OwnerId</leftValueReference>
                <operator>StartsWith</operator>
                <rightValue>
                    <stringValue>005</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Status</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_Status_to_Assigned</targetReference>
            </connector>
            <label>Yes, the Case Owner was changed to a User</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_the_Case_Request_Changed</name>
        <label>Was the Case Request Changed?</label>
        <locationX>5242</locationX>
        <locationY>19044</locationY>
        <defaultConnector>
            <targetReference>Was_Subcategory_Changed</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No</defaultConnectorLabel>
        <rules>
            <name>Yes_Changed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Case_Type_Assignment</targetReference>
            </connector>
            <label>Yes, Changed</label>
        </rules>
        <rules>
            <name>Case_Request_Type_Null</name>
            <conditionLogic>1 AND (2 OR 3)</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Case_Request__c</leftValueReference>
                <operator>NotEqualTo</operator>
                <rightValue>
                    <stringValue></stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Request_Type__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Request_Type__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Error</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <isGoTo>true</isGoTo>
                <targetReference>Case_Type_Assignment</targetReference>
            </connector>
            <label>Case Request Type Null</label>
        </rules>
    </decisions>
    <decisions>
        <name>Was_The_Case_Status_Changed_Used_for_Logging_Time</name>
        <label>Was The Case Status Changed? (Used for Logging Time)</label>
        <locationX>1106</locationX>
        <locationY>900</locationY>
        <defaultConnector>
            <targetReference>Copy_2_of_Set_Status_to_New</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_Case_Status_Changed</name>
            <conditionLogic>or</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Status_Filtered__c</leftValueReference>
                <operator>IsChanged</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Copy_1_of_Nullify_Stall</targetReference>
            </connector>
            <label>Yes, Case Status Changed</label>
        </rules>
    </decisions>
    <decisions>
        <description>Determines if the Status was changed to one of the values that requires an email to be sent.</description>
        <name>Was_the_Status_changed</name>
        <label>Was the Status changed?</label>
        <locationX>5242</locationX>
        <locationY>11706</locationY>
        <defaultConnector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>No, the Status either was not changed or doesn&apos;t require automation</defaultConnectorLabel>
        <rules>
            <name>On_Hold</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>On Hold</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>On_Hold_Notification1</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>On Hold</label>
        </rules>
        <rules>
            <name>Needs_Information</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Internal Feedback Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>TVM_Needs_Information_Email_Push</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Needs Information</label>
        </rules>
        <rules>
            <name>Information_Provided</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Internal Feedback Provided</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>TVM_Information_Provided_Email_Push</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Information Provided</label>
        </rules>
        <rules>
            <name>Digital_Complete</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Digital Complete</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Digital_Feedback_Required__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_to_Complete</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Digital Complete</label>
        </rules>
        <rules>
            <name>Case_Reopened</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Is_Case_a_Bug_0</targetReference>
            </connector>
            <label>Case Reopened</label>
        </rules>
        <rules>
            <name>Approved_For_Upload</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Approved For Upload</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Approved_For_Upload1</targetReference>
            </connector>
            <label>Approved For Upload</label>
        </rules>
        <rules>
            <name>Awaiting_Approval</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Awaiting Approval</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Awaiting_Approval_Email1</targetReference>
            </connector>
            <doesRequireRecordChangedToMeetCriteria>true</doesRequireRecordChangedToMeetCriteria>
            <label>Awaiting Approval</label>
        </rules>
        <rules>
            <name>Changes_Needed</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Changes Needed</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Awaiting_Approval_Email1_0</targetReference>
            </connector>
            <label>Changes Needed</label>
        </rules>
        <rules>
            <name>Waiting_on_Dev</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>ChangedStatus</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Waiting on Development</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Set_To_Waiting_on_Dev</targetReference>
            </connector>
            <label>Waiting on Dev</label>
        </rules>
    </decisions>
    <decisions>
        <name>Which_Contact_Gets_Updated</name>
        <label>Which Contact Gets Updated</label>
        <locationX>3141</locationX>
        <locationY>22476</locationY>
        <defaultConnectorLabel>No Contact</defaultConnectorLabel>
        <rules>
            <name>Has_Contact_Attached</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Contact.Email</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Survey_Eligible__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_Dealer_Contact_Survey</targetReference>
            </connector>
            <label>Has Contact Attached</label>
        </rules>
    </decisions>
    <decisions>
        <name>X3PV_Case_Just_Closed</name>
        <label>(Dep) 3PV Case Just Closed?</label>
        <locationX>5110</locationX>
        <locationY>9522</locationY>
        <defaultConnector>
            <targetReference>Send_Survey</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>Yes_do_vendor_activation_slack</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record__Prior.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.X3rd_Party_Integration_Approval_Status__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Approved</stringValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record__Prior.IsClosed</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Get_Vendor_by_Name</targetReference>
            </connector>
            <label>Yes, do vendor activation + slack</label>
        </rules>
    </decisions>
    <description>When a Case is updated, this flow will evaluate the criteria of the Case to determine which action(s) and/or notification(s) are required.</description>
    <environments>Default</environments>
    <formulas>
        <name>AdMonth</name>
        <dataType>String</dataType>
        <expression>CASE(MONTH(DATEVALUE({!$Record.CreatedDate})),
  1, &quot; January &quot;,
  2, &quot; February &quot;,
  3, &quot; March &quot;,
  4, &quot; April &quot;,
  5, &quot; May &quot;,
  6, &quot; June &quot;,
  7, &quot; July &quot;,
  8, &quot; August &quot;,
  9, &quot; September &quot;,
  10, &quot; October &quot;,
  11, &quot; November &quot;,
  12, &quot; December &quot;,
  &quot; &quot;
)</expression>
    </formulas>
    <formulas>
        <name>CCListFullCleaned</name>
        <dataType>String</dataType>
        <expression>SUBSTITUTE({!$Record.Full_CC_List__c}, &quot;;&quot;, &quot;,&quot;)</expression>
    </formulas>
    <formulas>
        <name>CCListInitialCleaned</name>
        <dataType>String</dataType>
        <expression>SUBSTITUTE({!$Record.Initial_CC_List__c}, &quot;;&quot;, &quot;,&quot;)</expression>
    </formulas>
    <formulas>
        <name>ChangedStatus</name>
        <dataType>String</dataType>
        <expression>if(IsChanged({!$Record.Status}), Text({!$Record.Status}),
if(IsChanged({!$Record.Status_Filtered__c}), Text({!$Record.Status_Filtered__c}),
if(IsChanged({!$Record.Status_CS__c}), Text({!$Record.Status_CS__c}),
if(IsChanged({!$Record.Status_Digital__c}), Text({!$Record.Status_Digital__c}),
if(IsChanged({!$Record.Status_General__c}), Text({!$Record.Status_General__c}),
if(IsChanged({!$Record.Status_Production__c}), Text({!$Record.Status_Production__c}),
if(IsChanged({!$Record.Jira_Status__c}), ({!$Record.Jira_Status__c}),
&quot;&quot;
)))))))</expression>
    </formulas>
    <formulas>
        <name>DevHoldHours</name>
        <dataType>Number</dataType>
        <expression>({!$Flow.CurrentDateTime}-{!$Record.Latest_Sent_to_Dev__c}) * 24</expression>
        <scale>2</scale>
    </formulas>
    <formulas>
        <name>EscalatedTo</name>
        <dataType>String</dataType>
        <expression>if(
Text({!$Record.Status})=&quot;Escalated&quot; &amp;&amp; Text({!$Record.Escalated_To__c})=&quot;&quot;, &quot;FordDirect&quot;, Text({!$Record.Escalated_To__c}))</expression>
    </formulas>
    <formulas>
        <name>ExternalCaseClosedVarText</name>
        <dataType>String</dataType>
        <expression>If({!$Record.IsClosed},
&quot;If you have further issues or questions please don&apos;t hesitate to reach out to your Account Management Team.&quot;,
&quot;Please reply to this email to provide a response.&quot;
)</expression>
    </formulas>
    <formulas>
        <name>ExternalFeedBackNeededBody</name>
        <dataType>String</dataType>
        <expression>&quot;&lt;br&gt;&lt;br&gt;Your Response is Required&quot;</expression>
    </formulas>
    <formulas>
        <name>FDStatus</name>
        <dataType>String</dataType>
        <expression>if(TExt({!$Record.FD_Status_PL__c})=&quot;Closed&quot;, &quot;OEM Feedback Provided&quot;, Text({!$Record.FD_Status_PL__c}))</expression>
    </formulas>
    <formulas>
        <name>NotifyCreatorAddress</name>
        <dataType>String</dataType>
        <expression>if( 
isBlank({!$Record.CreatedBy.Email})=false &amp;&amp;
{!$Record.Notify_Me__r.Email} != {!$Record.CreatedBy.Email} &amp;&amp;
{!$Record.Alerted_User_2__r.Email} != {!$Record.CreatedBy.Email} &amp;&amp;
{!$Record.Account.Regional_Account_Director__r.Email} != {!$Record.CreatedBy.Email} &amp;&amp;
{!$Record.Account.Account_Manager__r.Email} != {!$Record.CreatedBy.Email} &amp;&amp;
{!$Record.Account.Product_Manager__r.Email} != {!$Record.CreatedBy.Email} &amp;&amp;
{!$Record.Owner:User.Email} != {!$Record.CreatedBy.Email} &amp;&amp;
!({!$Record.Sync_FD__c} &amp;&amp; {!$Record.CreatedBy.Email} = &quot;jseurer@teamvelocitymarketing.com&quot;) &amp;&amp;
{!$Record.CreatedBy.Email} != &quot;noreply@salesforce.teamvelocitymarketing.com&quot;
,
{!$Record.CreatedBy.Email}, &quot;&quot;
)</expression>
    </formulas>
    <formulas>
        <name>NotifyExternal</name>
        <dataType>String</dataType>
        <expression>{!$Record.Dealership_Contact_Email_Formula__c}</expression>
    </formulas>
    <formulas>
        <name>NotifyInternalCSTeam</name>
        <dataType>String</dataType>
        <expression>if( isBlank({!$Record.Notify_Me__r.Email}), &quot;&quot;, {!$Record.Notify_Me__r.Email}&amp;&quot;,&quot;)&amp;
If({!$Record.Case_Category_Text__c} = &quot;Digital_Support&quot;, if(isBlank({!$Record.Account.Digital_SME__r.Email}), &quot;&quot;, {!$Record.Account.Digital_SME__r.Email}&amp;&quot;,&quot;),&quot;&quot;)&amp;
if( isBlank({!$Record.Account.Regional_Account_Director__r.Email}), &quot;&quot;, {!$Record.Account.Regional_Account_Director__r.Email}&amp;&quot;,&quot;)&amp;
if( isBlank({!$Record.Account.Account_Manager__r.Email}), &quot;&quot;, {!$Record.Account.Account_Manager__r.Email}&amp;&quot;,&quot;)&amp;
if( isBlank({!NotifyCreatorAddress}), &quot;&quot;, {!NotifyCreatorAddress}&amp;&quot;,&quot;)&amp;
if( isBlank({!$Record.Account.Related_Auto_Group__r.Case_Notification_Alias__c}), &quot;&quot;, {!$Record.Account.Related_Auto_Group__r.Case_Notification_Alias__c})&amp;
if({!$Record.Account.Product_Manager__r.Email}!=&quot;&quot;, &quot;,&quot;&amp;{!$Record.Account.Product_Manager__r.Email}, &quot;&quot;)&amp;
if({!$Record.Alerted_User_2__r.Email}!=&quot;&quot;, &quot;,&quot;&amp;{!$Record.Alerted_User_2__r.Email}, &quot;&quot;)</expression>
    </formulas>
    <formulas>
        <name>NotifyOwner</name>
        <dataType>String</dataType>
        <expression>if(
IsBlank({!$Record.Owner:User.Email}), {!$Record.Owner:Group.Email},{!$Record.Owner:User.Email}
)</expression>
    </formulas>
    <formulas>
        <name>NotifyWPMFordFDNOwner</name>
        <dataType>String</dataType>
        <expression>if({!$Record.Sync_FD__c}, &quot;,jseurer@teamvelocitymarketing.com&quot;, &quot;&quot;)&amp;
if(IsBlank({!$Record.Foundation_Additional_Notification__c}), &quot;&quot;, &quot;,&quot;&amp;{!$Record.Foundation_Additional_Notification__c})&amp;
if({!$Record.Owner:Group.Name}=&quot;Foundation Digital Support&quot;, &quot;,&quot;&amp;&quot;foundationdigitalsupport@teamvelocitymarketing.com&quot;, &quot;&quot;)&amp;
if( isBlank({!$Record.Owner:User.Email}), &quot;&quot;, &quot;,&quot;&amp;{!$Record.Owner:User.Email})</expression>
    </formulas>
    <formulas>
        <name>OrgwideID</name>
        <dataType>String</dataType>
        <expression>{!$Label.TVMSupportOrgWideEmailID}</expression>
    </formulas>
    <formulas>
        <name>OTTccList</name>
        <dataType>String</dataType>
        <expression>IF(ISBLANK({!$Record.Account.Regional_Account_Director__r.Email}), &quot;&quot;, {!$Record.Account.Regional_Account_Director__r.Email} &amp; &quot;,&quot;) &amp;
IF(ISBLANK({!$Record.Account.Account_Manager__r.Email}), &quot;&quot;, {!$Record.Account.Account_Manager__r.Email} &amp; &quot;,&quot;) &amp;
IF(ISBLANK({!NotifyCreatorAddress}), &quot;&quot;, {!NotifyCreatorAddress} &amp; &quot;,&quot;) &amp;
IF(ISBLANK({!NotifyOwner}), &quot;&quot;, {!NotifyOwner} &amp; &quot;,&quot;) &amp;
&quot;astanco@tier10.com&quot;</expression>
    </formulas>
    <formulas>
        <name>PrevOwnerOrGS</name>
        <dataType>String</dataType>
        <expression>if({!$Record.X3rd_Party_Previous_User_ID__c}&lt;&gt;&quot;&quot;, {!$Record.X3rd_Party_Previous_User_ID__c},
&quot;00G5f000003o8ejEAA&quot;)</expression>
    </formulas>
    <formulas>
        <name>RegionalAccountDirector</name>
        <dataType>String</dataType>
        <expression>IF(
NOT(ISBLANK({!$Record.Account.Regional_Account_Director__c})),
{!$Record.Account.Regional_Account_Director__c},
null)</expression>
    </formulas>
    <formulas>
        <name>StatusChanged</name>
        <dataType>Boolean</dataType>
        <expression>ischanged({!$Record.Status_Filtered__c}) || ischanged({!$Record.Status}) || ischanged({!$Record.Status_CS__c}) || ischanged({!$Record.Status_Digital__c}) || ischanged({!$Record.Status_Production__c}) || ischanged({!$Record.Status_General__c})</expression>
    </formulas>
    <formulas>
        <name>SubjectLineNewExternalComment</name>
        <dataType>String</dataType>
        <expression>if({!$Record.SuppliedEmail}!=&quot;&quot;, 
	If({!$Record.IsClosed}, &quot;Closed: RE:&quot;&amp;{!$Record.Subject}, &quot;RE:&quot;&amp;{!$Record.Subject}),
If({!$Record.IsClosed},
&quot;Team Velocity: Case Closed | &quot;&amp;{!$Record.Account.Name}&amp; &quot; | &quot;&amp;{!$Record.CaseNumber},
&quot;Team Velocity: New Case Comment | &quot;&amp;{!$Record.Account.Name}&amp; &quot; | &quot;&amp;{!$Record.CaseNumber}
)
)
&amp; &quot; |::&quot;  &amp;{!$Record.Case_18_ID__c} &amp; &quot;::|&quot;</expression>
    </formulas>
    <formulas>
        <name>SubjectLineNewInternalComment</name>
        <dataType>String</dataType>
        <expression>If({!$Record.IsClosed} || {!ChangedStatus}=&quot;Closed&quot;,
&quot;Case Closed | &quot;&amp;{!$Record.Account.Name}&amp; &quot; | &quot;&amp;{!$Record.CaseNumber},
&quot;New Internal Case Comment | &quot;&amp;{!$Record.Account.Name}&amp; &quot; | &quot;&amp;{!$Record.CaseNumber}
)
&amp; &quot; |::&quot;  &amp;{!$Record.Case_18_ID__c} &amp; &quot;::|&quot;</expression>
    </formulas>
    <formulas>
        <name>SubjectLineNewTicket</name>
        <dataType>String</dataType>
        <expression>Text({!$Record.Case_Category__c})&amp;&quot;: &quot;&amp;{!$Record.Account.Name}&amp;&quot; Case Created&quot; &amp; &quot; |::&quot;  &amp;{!$Record.Case_18_ID__c} &amp; &quot;::|&quot;</expression>
    </formulas>
    <formulas>
        <name>varFirstDayClosed</name>
        <dataType>Date</dataType>
        <expression>DATE(YEAR({!$Record.Last_Closed_Case_Date__c}),MONTH({!$Record.Last_Closed_Case_Date__c}),1)</expression>
    </formulas>
    <formulas>
        <name>varFirstdaycurrentmonth</name>
        <dataType>Date</dataType>
        <expression>DATE(YEAR({!$Flow.CurrentDate}),MONTH({!$Flow.CurrentDate}),1)</expression>
    </formulas>
    <formulas>
        <name>WPMOrGS</name>
        <dataType>String</dataType>
        <expression>if({!$Record.Account.Product_Manager__r.X18_Digit_User_ID__c}&lt;&gt;&quot;&quot;, {!$Record.Account.Product_Manager__r.X18_Digit_User_ID__c}, 
if({!$Record.X3rd_Party_Previous_User_ID__c}&lt;&gt;&quot;&quot;, {!$Record.X3rd_Party_Previous_User_ID__c},
&quot;00G5f000003o8ejEAA&quot;))</expression>
    </formulas>
    <interviewLabel>Case - Updated {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Case - Updated</label>
    <loops>
        <name>Loop_CC_List</name>
        <label>Loop CC List</label>
        <locationX>4826</locationX>
        <locationY>15294</locationY>
        <collectionReference>CCList</collectionReference>
        <iterationOrder>Asc</iterationOrder>
        <nextValueConnector>
            <targetReference>Update_Full_CC_List</targetReference>
        </nextValueConnector>
        <noMoreValuesConnector>
            <targetReference>Closed_Case</targetReference>
        </noMoreValuesConnector>
    </loops>
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
        <name>Create_New_3rdPty_Vendor_Record</name>
        <label>Create New 3rdPty Vendor Record</label>
        <locationX>4626</locationX>
        <locationY>10254</locationY>
        <connector>
            <targetReference>Send_Survey</targetReference>
        </connector>
        <inputAssignments>
            <field>Account__c</field>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Deactivated__c</field>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Name</field>
            <value>
                <elementReference>$Record.X3rd_Party_Vendor__r.Matching_Name__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Vendor__c</field>
            <value>
                <elementReference>varVendorId</elementReference>
            </value>
        </inputAssignments>
        <object>Account_Vendor__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordCreates>
    <recordCreates>
        <name>Create_Note</name>
        <label>Create Note</label>
        <locationX>5110</locationX>
        <locationY>1932</locationY>
        <assignRecordIdToReference>InternalNoteID</assignRecordIdToReference>
        <connector>
            <targetReference>Check_for_Onboarding</targetReference>
        </connector>
        <inputAssignments>
            <field>Case__c</field>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Note__c</field>
            <value>
                <elementReference>ResolutionNoteComment</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Text_Rich__c</field>
            <value>
                <elementReference>ResolutionNoteComment</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Type__c</field>
            <value>
                <stringValue>Internal</stringValue>
            </value>
        </inputAssignments>
        <object>Internal_External_Note__c</object>
    </recordCreates>
    <recordCreates>
        <name>Create_Survey_Deployment_Link</name>
        <label>Create Survey Deployment Link</label>
        <locationX>4582</locationX>
        <locationY>10722</locationY>
        <connector>
            <targetReference>Update_Survey_Date_Time</targetReference>
        </connector>
        <inputAssignments>
            <field>Account__c</field>
            <value>
                <elementReference>$Record.Account.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case__c</field>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Contact__c</field>
            <value>
                <elementReference>$Record.Contact.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Survey_Deployment__c</field>
            <value>
                <elementReference>CasesManual</elementReference>
            </value>
        </inputAssignments>
        <object>Survey_Deployment_Link__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordCreates>
    <recordCreates>
        <name>Create_Vendor</name>
        <label>Create Vendor</label>
        <locationX>5022</locationX>
        <locationY>9846</locationY>
        <assignRecordIdToReference>varVendorId</assignRecordIdToReference>
        <connector>
            <targetReference>Get_Account_Vendor_Acct_Vendor</targetReference>
        </connector>
        <inputAssignments>
            <field>Name</field>
            <value>
                <elementReference>$Record.X3rd_Party_Vendor__r.Matching_Name__c</elementReference>
            </value>
        </inputAssignments>
        <object>Vendor__c</object>
    </recordCreates>
    <recordCreates>
        <name>Pass_External_Notes_to_Case_Comments</name>
        <label>Pass External Notes to Case Comments</label>
        <locationX>4958</locationX>
        <locationY>17286</locationY>
        <assignRecordIdToReference>ExternalNoteID</assignRecordIdToReference>
        <connector>
            <targetReference>Nullify_External_Notes</targetReference>
        </connector>
        <inputAssignments>
            <field>CC_Email_Address__c</field>
            <value>
                <elementReference>$Record.Current_CC_List__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case__c</field>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Note__c</field>
            <value>
                <elementReference>$Record.External_Notes__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Text_Rich__c</field>
            <value>
                <elementReference>$Record.External_Notes_Rich__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Type__c</field>
            <value>
                <stringValue>To External</stringValue>
            </value>
        </inputAssignments>
        <object>Internal_External_Note__c</object>
    </recordCreates>
    <recordCreates>
        <name>Pass_Internal_Note_to_Internal_External_Notes</name>
        <label>Pass Internal Note to Internal/External Notes</label>
        <locationX>5066</locationX>
        <locationY>13746</locationY>
        <assignRecordIdToReference>InternalNoteID</assignRecordIdToReference>
        <connector>
            <targetReference>Nullify_Internal_Notes</targetReference>
        </connector>
        <inputAssignments>
            <field>Case__c</field>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Note__c</field>
            <value>
                <elementReference>$Record.Internal_Notes__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Text_Rich__c</field>
            <value>
                <elementReference>$Record.Internal_Notes_Rich__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Type__c</field>
            <value>
                <stringValue>Internal</stringValue>
            </value>
        </inputAssignments>
        <object>Internal_External_Note__c</object>
    </recordCreates>
    <recordLookups>
        <name>Get_Account_Vendor_Acct_Vendor</name>
        <label>Get Account Vendor (Acct+Vendor)</label>
        <locationX>4890</locationX>
        <locationY>10038</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Account_Vendor_Exists</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Account__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </filters>
        <filters>
            <field>Vendor__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.X3rd_Party_Vendor__c</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Account_Vendor__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Advid_Queue</name>
        <label>Get Advid Queue</label>
        <locationX>7178</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Apollo_Support_Queue_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Advid_Support</stringValue>
            </value>
        </filters>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Apollo_Support_Queue</name>
        <label>Get Apollo Support Queue</label>
        <locationX>6914</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Apollo_Support_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Apollo_Support</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Command_Center_Queue</name>
        <label>Get Command Center Queue</label>
        <locationX>7442</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Apollo_Support_Queue_0_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Command_Center_Support</stringValue>
            </value>
        </filters>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Data_Support_Queue</name>
        <label>Get Data Support Queue</label>
        <locationX>4802</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Data_Support_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Data_Support</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Digital_OEM_Queue</name>
        <label>Get Digital OEM Queue</label>
        <locationX>5858</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Digital_OEM_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Digital_OEM</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Digital_Reporting_Queue</name>
        <label>Get Digital Reporting Queue</label>
        <locationX>5594</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Digital_Reporting_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Digital_Reporting</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Digital_Support_Queue</name>
        <label>Get Digital Support Queue</label>
        <locationX>5330</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Digital_Support_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Digital_Support</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Foundation_Data_Support_Queue</name>
        <label>Get Foundation Data Support Queue</label>
        <locationX>6386</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Data_Support_Queue_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Foundation_Digital_Support</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_GeneralSupport_Queue</name>
        <label>Get GeneralSupport Queue</label>
        <locationX>5242</locationX>
        <locationY>23136</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_GS_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>General_Support</stringValue>
            </value>
        </filters>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Inventory_Support_Queue</name>
        <label>Get Inventory Support Queue</label>
        <locationX>1898</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Apollo_Websites_Support_Queue_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Inventory_Support</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Major_AG_GeneralSupport_Queue</name>
        <label>Get Major AG GeneralSupport Queue</label>
        <locationX>8146</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_GS_Queue_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Major_AG_General_Support</stringValue>
            </value>
        </filters>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Marketing_Support_Queue</name>
        <label>Get Marketing Support Queue</label>
        <locationX>6650</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Marketing_Support</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Marketing_Support</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Monthly_Budget</name>
        <label>Get Monthly Budget</label>
        <locationX>4318</locationX>
        <locationY>9522</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Found_Budget</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Account__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </filters>
        <filters>
            <field>Budget_Month_Date__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>varFirstdaycurrentmonth</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Monthly_Budget__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Oldest_Open_Digital_Case</name>
        <label>Get Oldest Open Digital Case</label>
        <locationX>3086</locationX>
        <locationY>21900</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Oldest_Record_Found</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Sub_Queue__c</field>
            <operator>IsNull</operator>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </filters>
        <filters>
            <field>OwnerId</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>00G5f000003o8dREAQ</stringValue>
            </value>
        </filters>
        <filters>
            <field>Status</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>New</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Case</object>
        <sortField>Case_Age_Workdays_Hours__c</sortField>
        <sortOrder>Desc</sortOrder>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Onboarding</name>
        <label>Get Onboarding</label>
        <locationX>5066</locationX>
        <locationY>2232</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Skip_Onboarding</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>IsComplete__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Account__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Onboarding__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Parent_Account</name>
        <label>Get Parent Account</label>
        <locationX>5077</locationX>
        <locationY>6522</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Was_Parent_Account_Found</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Id</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Account</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Production_Support_Queue</name>
        <label>Get Production Support Queue</label>
        <locationX>5066</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Production_Support_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Production_Support</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Reopened_MB</name>
        <label>Get Reopened MB</label>
        <locationX>5176</locationX>
        <locationY>11922</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Found_Budget_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Account__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </filters>
        <filters>
            <field>Budget_Month_Date__c</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>varFirstDayClosed</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Monthly_Budget__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_SEO_Support_Queue</name>
        <label>Get SEO Support Queue</label>
        <locationX>7706</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_SEO_Support_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>Contains</operator>
            <value>
                <stringValue>SEO</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_User_s_Open_Digital_Cases</name>
        <label>Get User&apos;s Open Digital Cases</label>
        <locationX>2888</locationX>
        <locationY>21684</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Any_Open_Digital_Cases_assigned_to_Cur_User</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>OwnerId</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.OwnerId</elementReference>
            </value>
        </filters>
        <filters>
            <field>IsClosed</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Case_Category__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Digital_Support</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Case</object>
        <queriedFields>Id</queriedFields>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Vendor_by_Name</name>
        <label>Get Vendor (by Name)</label>
        <locationX>4890</locationX>
        <locationY>9630</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Vendor_Found</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Name</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.X3rd_Party_Vendor__r.Matching_Name__c</elementReference>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Vendor__c</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordLookups>
        <name>Get_Website_Analytics_Support_Queue</name>
        <label>Get Website Analytics Support Queue</label>
        <locationX>4538</locationX>
        <locationY>19860</locationY>
        <assignNullValuesIfNoRecordsFound>false</assignNullValuesIfNoRecordsFound>
        <connector>
            <targetReference>Transfer_Case_to_Websites_Analytics_Support_Queue</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Type</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Queue</stringValue>
            </value>
        </filters>
        <filters>
            <field>DeveloperName</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Dealer_Analytics</stringValue>
            </value>
        </filters>
        <getFirstRecordOnly>true</getFirstRecordOnly>
        <object>Group</object>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </recordLookups>
    <recordUpdates>
        <name>Assign_Current_User_to_Oldest_open_digital_Ticket</name>
        <label>Assign Current User to Oldest open Digital Ticket</label>
        <locationX>2954</locationX>
        <locationY>22116</locationY>
        <connector>
            <targetReference>Which_Contact_Gets_Updated</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Id</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>Get_Oldest_Open_Digital_Case.Id</elementReference>
            </value>
        </filters>
        <inputAssignments>
            <field>FD_Status__c</field>
            <value>
                <stringValue>Assigned</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$Record.OwnerId</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status</field>
            <value>
                <stringValue>Assigned</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_CS__c</field>
            <value>
                <stringValue>Assigned</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Digital__c</field>
            <value>
                <stringValue>Assigned</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Filtered__c</field>
            <value>
                <stringValue>Assigned</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_General__c</field>
            <value>
                <stringValue>Assigned</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Production__c</field>
            <value>
                <stringValue>Assigned</stringValue>
            </value>
        </inputAssignments>
        <object>Case</object>
    </recordUpdates>
    <recordUpdates>
        <name>Assign_Ryan_Owner</name>
        <label>Assign Ryan Owner</label>
        <locationX>4978</locationX>
        <locationY>19452</locationY>
        <connector>
            <targetReference>Send_Ryan_Email</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <stringValue>0055f00000DBdoCAAT</stringValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Cancel_Ticket</name>
        <label>Cancel Ticket</label>
        <locationX>5110</locationX>
        <locationY>600</locationY>
        <connector>
            <targetReference>AssignCreatorOwnerPushList</targetReference>
        </connector>
        <inputAssignments>
            <field>Status</field>
            <value>
                <stringValue>Cancelled</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Filtered__c</field>
            <value>
                <stringValue>Cancelled</stringValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Claim_It</name>
        <label>Claim It</label>
        <locationX>5110</locationX>
        <locationY>5922</locationY>
        <connector>
            <targetReference>SLA_Match</targetReference>
        </connector>
        <inputAssignments>
            <field>Assigned_Date_Time__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Claim_Ownership__c</field>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$User.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Clear_CC_List</name>
        <label>Clear CC List</label>
        <locationX>5129</locationX>
        <locationY>16410</locationY>
        <connector>
            <targetReference>Any_People_in_Recipients_0</targetReference>
        </connector>
        <inputAssignments>
            <field>Latest_CC_List_Long__c</field>
            <value>
                <elementReference>Convert_to_CSV.csvString</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Copy_1_of_Nullify_Stall</name>
        <label>Copy 1 of Nullify Stall</label>
        <locationX>754</locationX>
        <locationY>1008</locationY>
        <connector>
            <targetReference>Copy_1_of_Dynamic_Time_Transition</targetReference>
        </connector>
        <inputAssignments>
            <field>Stall_DateTime__c</field>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <description>This is because Slack doesnt allow us to pull in the owner field</description>
        <name>Copy_1_of_Store_Slack_Owner</name>
        <label>Copy 1 of Store Slack Owner</label>
        <locationX>798</locationX>
        <locationY>708</locationY>
        <connector>
            <targetReference>Was_The_Case_Status_Changed_Used_for_Logging_Time</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$Record.Owner:User.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Copy_1_of_Time_Stamp_Assigned</name>
        <label>Copy 1 of Time Stamp Assigned</label>
        <locationX>798</locationX>
        <locationY>492</locationY>
        <connector>
            <targetReference>Copy_1_of_Log_Unassigned_Time</targetReference>
        </connector>
        <inputAssignments>
            <field>Assigned_Date_Time__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Workday_Hours_Unassigned__c</field>
            <value>
                <elementReference>$Record.Case_Age_Workdays_Hours__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Mark_Case_Reopened</name>
        <label>Mark Case Reopened</label>
        <locationX>5330</locationX>
        <locationY>12522</locationY>
        <connector>
            <targetReference>Log_Regular_Time_0_0_0</targetReference>
        </connector>
        <inputAssignments>
            <field>Case_Reopened_Date__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Case_Reopened__c</field>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Nullify_External_Notes</name>
        <label>Nullify External Notes</label>
        <locationX>4958</locationX>
        <locationY>17394</locationY>
        <connector>
            <targetReference>Forward_to_SD_0</targetReference>
        </connector>
        <inputAssignments>
            <field>External_Notes_Rich__c</field>
            <value>
                <stringValue></stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>External_Notes__c</field>
            <value>
                <stringValue></stringValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Nullify_Internal_Notes</name>
        <label>Nullify Internal Notes</label>
        <locationX>5066</locationX>
        <locationY>13854</locationY>
        <connector>
            <targetReference>Forward_to_SD_0_0</targetReference>
        </connector>
        <inputAssignments>
            <field>Internal_Notes_Rich__c</field>
            <value>
                <stringValue></stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Internal_Notes__c</field>
            <value>
                <stringValue></stringValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Nullify_Stall</name>
        <label>Nullify Stall</label>
        <locationX>4912</locationX>
        <locationY>18378</locationY>
        <connector>
            <targetReference>Dynamic_Time_Transition</targetReference>
        </connector>
        <inputAssignments>
            <field>Stall_DateTime__c</field>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Populate_Regional_Account_Director_and_Account_Manager</name>
        <label>Populate Regional Account Director and Account Manager</label>
        <locationX>5110</locationX>
        <locationY>8814</locationY>
        <connector>
            <targetReference>Case_Closed</targetReference>
        </connector>
        <inputAssignments>
            <field>Account_Manager__c</field>
            <value>
                <elementReference>$Record.Account.Account_Manager__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Regional_Account_Director__c</field>
            <value>
                <elementReference>$Record.Account.Regional_Account_Director__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Push_update_to_Monthly_Budget</name>
        <label>Push update to Monthly Budget</label>
        <locationX>4186</locationX>
        <locationY>9846</locationY>
        <connector>
            <targetReference>Send_Survey</targetReference>
        </connector>
        <inputReference>Get_Monthly_Budget</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Push_update_to_Monthly_Budget_0</name>
        <label>Push update to Monthly Budget</label>
        <locationX>5044</locationX>
        <locationY>12246</locationY>
        <connector>
            <targetReference>Mark_Case_Reopened</targetReference>
        </connector>
        <inputReference>Get_Reopened_MB</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Set_Close_Date</name>
        <label>Set Close Date</label>
        <locationX>4714</locationX>
        <locationY>11214</locationY>
        <connector>
            <targetReference>ReClosed_Case</targetReference>
        </connector>
        <inputAssignments>
            <field>Last_Closed_Case_Date__c</field>
            <value>
                <elementReference>$Flow.CurrentDate</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Set_Owner_Back_to_Support_User</name>
        <label>Set Owner Back to Support User</label>
        <locationX>4846</locationX>
        <locationY>3780</locationY>
        <connector>
            <targetReference>Was_Jira_ID_Changed</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$Record.Owner:User.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Set_Owner_to_WPM</name>
        <label>Set Owner to WPM</label>
        <locationX>5110</locationX>
        <locationY>3780</locationY>
        <connector>
            <targetReference>Was_Jira_ID_Changed</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>WPMOrGS</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Set_Owner_to_WPM_0</name>
        <label>Set Owner to WPM</label>
        <locationX>5814</locationX>
        <locationY>3780</locationY>
        <connector>
            <targetReference>Was_Jira_ID_Changed</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>PrevOwnerOrGS</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Set_To_Waiting_on_Dev</name>
        <label>Set To Waiting on Dev</label>
        <locationX>6452</locationX>
        <locationY>11814</locationY>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
        <inputAssignments>
            <field>Latest_Dev_Returned__c</field>
        </inputAssignments>
        <inputAssignments>
            <field>Latest_Sent_to_Dev_Tracking_Only__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Latest_Sent_to_Dev__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Status_Update_FD</name>
        <label>Status Update FD</label>
        <locationX>5154</locationX>
        <locationY>8022</locationY>
        <connector>
            <targetReference>set_Status_to_FD_Status</targetReference>
        </connector>
        <inputAssignments>
            <field>Escalated_To__c</field>
            <value>
                <elementReference>EscalatedTo</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Store_Approver</name>
        <label>Store Approver</label>
        <locationX>5726</locationX>
        <locationY>3564</locationY>
        <connector>
            <targetReference>Is_Owner_Currently_CTL</targetReference>
        </connector>
        <inputAssignments>
            <field>X3rd_Party_Approved__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>X3rd_Party_Approver_Rejecter__c</field>
            <value>
                <elementReference>$User.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Store_Rejecter</name>
        <label>Store Rejecter</label>
        <locationX>4890</locationX>
        <locationY>3564</locationY>
        <connector>
            <targetReference>Support_Owner234</targetReference>
        </connector>
        <inputAssignments>
            <field>X3rd_Party_Approved__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>X3rd_Party_Approver_Rejecter__c</field>
            <value>
                <elementReference>$User.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <description>This is because Slack doesnt allow us to pull in the owner field</description>
        <name>Store_Slack_Owner</name>
        <label>Store Slack Owner</label>
        <locationX>4846</locationX>
        <locationY>3264</locationY>
        <connector>
            <targetReference>Was_3rd_Party_Integration_Approval_Status_Changed</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$Record.Owner:User.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Testing_Flow</name>
        <label>Testing Flow</label>
        <locationX>50</locationX>
        <locationY>384</locationY>
        <inputAssignments>
            <field>Flow_Tracker__c</field>
            <value>
                <stringValue>Major AG Updated - {!$Flow.InterviewStartTime}</stringValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Time_Stamp_3rd_Party_Started</name>
        <label>Time Stamp 3rd Party Started</label>
        <locationX>4406</locationX>
        <locationY>3564</locationY>
        <connector>
            <targetReference>Was_Jira_ID_Changed</targetReference>
        </connector>
        <inputAssignments>
            <field>X3rd_Party_Approval_Started__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>X3rd_Party_Previous_User_ID__c</field>
            <value>
                <elementReference>$Record.OwnerId</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Time_Stamp_Assigned</name>
        <label>Time Stamp Assigned</label>
        <locationX>4846</locationX>
        <locationY>3048</locationY>
        <connector>
            <targetReference>Log_Unassigned_Time</targetReference>
        </connector>
        <inputAssignments>
            <field>Assigned_Date_Time__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Workday_Hours_Unassigned__c</field>
            <value>
                <elementReference>$Record.Case_Age_Workdays_Hours__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_Creater</name>
        <label>Transfer Case Creater</label>
        <locationX>6122</locationX>
        <locationY>19860</locationY>
        <connector>
            <targetReference>Copy_8_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$Record.LastModifiedById</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Apollo_Support_Queue</name>
        <label>Transfer Case to Apollo Support Queue</label>
        <locationX>6914</locationX>
        <locationY>19968</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Apollo_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Apollo_Support_Queue_0</name>
        <label>Transfer Case to Apollo Support Queue</label>
        <locationX>7178</locationX>
        <locationY>19968</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Advid_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Apollo_Support_Queue_0_0</name>
        <label>Transfer Case to Apollo Support Queue</label>
        <locationX>7442</locationX>
        <locationY>19968</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Command_Center_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Apollo_Websites_Support_Queue_0</name>
        <label>Transfer Case to Apollo Websites Support Queue</label>
        <locationX>1898</locationX>
        <locationY>19968</locationY>
        <connector>
            <targetReference>Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Inventory_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Price_Patrol_Historical__c</field>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Data_Support_Queue</name>
        <label>Transfer Case to Data Support Queue</label>
        <locationX>4802</locationX>
        <locationY>19968</locationY>
        <connector>
            <targetReference>Copy_4_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Data_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Data_Support_Queue_0</name>
        <label>Transfer Case to Data Support Queue</label>
        <locationX>6386</locationX>
        <locationY>19968</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Foundation_Data_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Digital_OEM_Queue</name>
        <label>Transfer Case to Digital OEM Queue</label>
        <locationX>5858</locationX>
        <locationY>19968</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Digital_OEM_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Digital_Reporting_Queue</name>
        <label>Transfer Case to Digital Reporting Queue</label>
        <locationX>5594</locationX>
        <locationY>19968</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Digital_Reporting_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Digital_Support_Queue</name>
        <label>Transfer Case to Digital Support Queue</label>
        <locationX>5330</locationX>
        <locationY>19968</locationY>
        <connector>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Digital_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_GS_Queue</name>
        <label>Transfer Case to GS Queue</label>
        <locationX>5242</locationX>
        <locationY>23244</locationY>
        <connector>
            <targetReference>Valid_Email</targetReference>
        </connector>
        <inputAssignments>
            <field>General_Support_Managed__c</field>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_GeneralSupport_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_GS_Queue_0</name>
        <label>Transfer Case to GS Queue</label>
        <locationX>8146</locationX>
        <locationY>19968</locationY>
        <inputAssignments>
            <field>General_Support_Managed__c</field>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Major_AG_GeneralSupport_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_GS_Queue_0_0</name>
        <label>Transfer Case to GS Queue</label>
        <locationX>8410</locationX>
        <locationY>19860</locationY>
        <inputAssignments>
            <field>General_Support_Managed__c</field>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$Record.Account.Pit_Crew__r.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Pit_Crew_Histroical__c</field>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Marketing_Support</name>
        <label>Transfer Case to Marketing Support</label>
        <locationX>6650</locationX>
        <locationY>19968</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Marketing_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Production_Support_Queue</name>
        <label>Transfer Case to Production Support Queue</label>
        <locationX>5066</locationX>
        <locationY>19968</locationY>
        <connector>
            <targetReference>Set_Status_to_New456456</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Production_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_SEO_Support_Queue</name>
        <label>Transfer Case to SEO Support Queue</label>
        <locationX>7706</locationX>
        <locationY>19968</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_5_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_SEO_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Transfer_Case_to_Websites_Analytics_Support_Queue</name>
        <label>Transfer Case to Websites Analytics Support Queue</label>
        <locationX>4538</locationX>
        <locationY>19968</locationY>
        <connector>
            <targetReference>Copy_1_of_Set_Status_to_New</targetReference>
        </connector>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>Get_Website_Analytics_Support_Queue.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_3rd_Party_Status</name>
        <label>Update 3rd Party Status</label>
        <locationX>2580</locationX>
        <locationY>19860</locationY>
        <connector>
            <targetReference>Was_the_Case_Owner_changed_to_a_User</targetReference>
        </connector>
        <inputAssignments>
            <field>Account_Manager__c</field>
            <value>
                <elementReference>$Record.Account.Account_Manager__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Regional_Account_Director__c</field>
            <value>
                <elementReference>$Record.Account.Regional_Account_Director__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>X3rd_Party_Integration_Approval_Status__c</field>
            <value>
                <stringValue>Approval Needed</stringValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Active_Vendor_Record</name>
        <label>Update Active Vendor Record</label>
        <locationX>4890</locationX>
        <locationY>10254</locationY>
        <connector>
            <targetReference>Send_Survey</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Id</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>Get_Account_Vendor_Acct_Vendor.Id</elementReference>
            </value>
        </filters>
        <inputAssignments>
            <field>Deactivated__c</field>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <object>Account_Vendor__c</object>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Attachment_URLS</name>
        <label>Update Attachment URLS</label>
        <locationX>5550</locationX>
        <locationY>8430</locationY>
        <connector>
            <targetReference>Was_the_Account_populated</targetReference>
        </connector>
        <inputAssignments>
            <field>Attachment_URLs__c</field>
            <value>
                <elementReference>Forward_to_FD_0.AttachmentURLS</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status</field>
            <value>
                <elementReference>$Record.FD_Status__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Status_Filtered__c</field>
            <value>
                <elementReference>$Record.FD_Status__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Case</name>
        <label>Update Case</label>
        <locationX>5154</locationX>
        <locationY>2664</locationY>
        <connector>
            <targetReference>Owner_Changed</targetReference>
        </connector>
        <inputAssignments>
            <field>Onboarding_ID__c</field>
            <value>
                <elementReference>Get_Onboarding.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_CC_Lists</name>
        <label>Update CC Lists</label>
        <locationX>5242</locationX>
        <locationY>12930</locationY>
        <connector>
            <targetReference>Was_an_Internal_Note_Added</targetReference>
        </connector>
        <inputAssignments>
            <field>Full_CC_List__c</field>
            <value>
                <elementReference>CCListFullCleaned</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Initial_CC_List__c</field>
            <value>
                <elementReference>CCListInitialCleaned</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Dealer_Contact_Survey</name>
        <label>Update Dealer Contact Survey</label>
        <locationX>3009</locationX>
        <locationY>22584</locationY>
        <inputAssignments>
            <field>Case_Survey_Ready__c</field>
            <value>
                <elementReference>$Flow.CurrentDate</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Latest_Closed_Case_ID__c</field>
            <value>
                <elementReference>$Record.Case_18_ID__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record.Contact</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Dev_Hold_Hours</name>
        <label>Update Dev Hold Hours</label>
        <locationX>5110</locationX>
        <locationY>1632</locationY>
        <connector>
            <targetReference>Resolution_Notes_Changed</targetReference>
        </connector>
        <inputAssignments>
            <field>Dev_Hold_Hours__c</field>
            <value>
                <elementReference>CurrDevHoldHours</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Latest_Sent_to_Dev_Tracking_Only__c</field>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Onboarding_Record</name>
        <label>Update Onboarding Record</label>
        <locationX>5154</locationX>
        <locationY>2556</locationY>
        <connector>
            <targetReference>Update_Case</targetReference>
        </connector>
        <inputReference>Get_Onboarding</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Owner</name>
        <label>Update Owner</label>
        <locationX>4582</locationX>
        <locationY>9222</locationY>
        <connector>
            <targetReference>Is_Case_a_Bug</targetReference>
        </connector>
        <inputAssignments>
            <field>Case_Closed_User_ID__c</field>
            <value>
                <elementReference>$User.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$User.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Owner_0</name>
        <label>Update Owner</label>
        <locationX>4846</locationX>
        <locationY>9222</locationY>
        <connector>
            <targetReference>Is_Case_a_Bug</targetReference>
        </connector>
        <inputAssignments>
            <field>Case_Closed_User_ID__c</field>
            <value>
                <elementReference>$Record.OwnerId</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Parent_Account</name>
        <label>Update Parent Account</label>
        <locationX>4791</locationX>
        <locationY>6846</locationY>
        <connector>
            <targetReference>Was_RAD_or_SEO_Changed_0_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Id</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </filters>
        <inputAssignments>
            <field>Regional_Account_Director__c</field>
            <value>
                <elementReference>$Record.Regional_Account_Director__c</elementReference>
            </value>
        </inputAssignments>
        <object>Account</object>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Parent_Account_0</name>
        <label>Update Parent Account</label>
        <locationX>4791</locationX>
        <locationY>7146</locationY>
        <connector>
            <targetReference>Was_RAD_or_SEO_Changed_0_0_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Id</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </filters>
        <inputAssignments>
            <field>Regional_Account_Director__c</field>
            <value>
                <elementReference>$Record.Regional_Account_Director__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>SEO_Analyst__c</field>
            <value>
                <elementReference>$Record.SEO_Analyst__r.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>SEO_Team_Lead__c</field>
            <value>
                <elementReference>$Record.SEO_Team_Lead__r.Id</elementReference>
            </value>
        </inputAssignments>
        <object>Account</object>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Parent_Account_0_0</name>
        <label>Update Parent Account</label>
        <locationX>4791</locationX>
        <locationY>7446</locationY>
        <connector>
            <targetReference>Forward_to_SD_0_0_0_0</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Id</field>
            <operator>EqualTo</operator>
            <value>
                <elementReference>$Record.AccountId</elementReference>
            </value>
        </filters>
        <inputAssignments>
            <field>SEO_Team_Lead__c</field>
            <value>
                <elementReference>$Record.SEO_Team_Lead__r.Id</elementReference>
            </value>
        </inputAssignments>
        <object>Account</object>
    </recordUpdates>
    <recordUpdates>
        <name>Update_RAD</name>
        <label>Update RAD</label>
        <locationX>5374</locationX>
        <locationY>5238</locationY>
        <connector>
            <targetReference>Check_AM_Gate</targetReference>
        </connector>
        <inputAssignments>
            <field>Regional_Account_Director__c</field>
            <value>
                <elementReference>$Record.Account.Regional_Account_Director__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_RAD_0</name>
        <label>Update RAD</label>
        <locationX>5374</locationX>
        <locationY>5538</locationY>
        <connector>
            <targetReference>Claim_Gate</targetReference>
        </connector>
        <inputAssignments>
            <field>Account_Manager__c</field>
            <value>
                <elementReference>$Record.Account.Account_Manager__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_RAD_0_0</name>
        <label>Update RAD</label>
        <locationX>4978</locationX>
        <locationY>5130</locationY>
        <connector>
            <targetReference>Null_Handling_0_0</targetReference>
        </connector>
        <inputAssignments>
            <field>Account_Manager__c</field>
            <value>
                <elementReference>$Record.Account.Account_Manager__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <field>Regional_Account_Director__c</field>
            <value>
                <elementReference>$Record.Account.Regional_Account_Director__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_ReClosing_Vars</name>
        <label>Update ReClosing Vars</label>
        <locationX>5110</locationX>
        <locationY>11514</locationY>
        <connector>
            <targetReference>Was_the_Status_changed</targetReference>
        </connector>
        <inputAssignments>
            <field>ReClosed_Date_Time__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Service</name>
        <label>Update Service</label>
        <locationX>5550</locationX>
        <locationY>8022</locationY>
        <connector>
            <targetReference>Temp_disable</targetReference>
        </connector>
        <inputAssignments>
            <field>FordDirect_Package_Level__c</field>
            <value>
                <elementReference>$Record.FD_Service__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_SLA_Static</name>
        <label>Update SLA Static</label>
        <locationX>5110</locationX>
        <locationY>6222</locationY>
        <connector>
            <targetReference>Was_RAD_or_SEO_Changed</targetReference>
        </connector>
        <inputAssignments>
            <field>SLA_Static__c</field>
            <value>
                <elementReference>$Record.SLA_Level__c</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_Survey_Date_Time</name>
        <label>Update Survey Date Time</label>
        <locationX>4582</locationX>
        <locationY>10830</locationY>
        <connector>
            <targetReference>Send_Compliance_Message</targetReference>
        </connector>
        <inputAssignments>
            <field>Survey_Sent__c</field>
            <value>
                <elementReference>$Flow.CurrentDateTime</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_to_Complete</name>
        <label>Update to Complete</label>
        <locationX>4780</locationX>
        <locationY>11814</locationY>
        <connector>
            <targetReference>Update_to_Closed</targetReference>
        </connector>
        <filterLogic>and</filterLogic>
        <filters>
            <field>Status</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Digital Complete</stringValue>
            </value>
        </filters>
        <filters>
            <field>Digital_Feedback_Required__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </filters>
        <inputAssignments>
            <field>Case_Reopened__c</field>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>5952</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Testing_Decision</targetReference>
        </connector>
        <object>Case</object>
        <recordTriggerType>Update</recordTriggerType>
        <scheduledPaths>
            <name>X2_Days_After_Last_Update</name>
            <connector>
                <targetReference>Is_the_Case_Closed</targetReference>
            </connector>
            <label>2 Days After Last Update</label>
            <offsetNumber>2</offsetNumber>
            <offsetUnit>Days</offsetUnit>
            <recordField>LastModifiedDate</recordField>
            <timeSource>RecordField</timeSource>
        </scheduledPaths>
        <scheduledPaths>
            <name>X1_Days_After_Last_update</name>
            <connector>
                <targetReference>Case_Stalled_General</targetReference>
            </connector>
            <label>1 Days After Last update</label>
            <offsetNumber>1</offsetNumber>
            <offsetUnit>Days</offsetUnit>
            <recordField>LastModifiedDate</recordField>
            <timeSource>RecordField</timeSource>
        </scheduledPaths>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Obsolete</status>
    <subflows>
        <name>Alert_The_Team</name>
        <label>Alert The Team</label>
        <locationX>5044</locationX>
        <locationY>18594</locationY>
        <connector>
            <targetReference>Log_Regular_Time</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <elementReference>NotifyInternalCSTeam</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>CaseClosedSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>CaseClosedInternalBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Approved_For_Upload1</name>
        <label>Approved For Upload</label>
        <locationX>5660</locationX>
        <locationY>11814</locationY>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <elementReference>$Record.Owner:User.Email</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>StatusChangeSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>StatusChangedBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Archive_Slack_Channel2</name>
        <label>Archive Slack Channel</label>
        <locationX>3009</locationX>
        <locationY>21084</locationY>
        <connector>
            <targetReference>Notify2_Null_Handling</targetReference>
        </connector>
        <flowName>Slack_SEO_Case_Archiver_Subflow</flowName>
        <inputAssignments>
            <name>recordId</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>Type</name>
            <value>
                <stringValue>Case</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Awaiting_Approval_Email1</name>
        <label>Awaiting Approval Email</label>
        <locationX>5924</locationX>
        <locationY>11814</locationY>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <elementReference>$Record.CreatedBy.Email</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>StatusChangeSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>StatusChangedBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Awaiting_Approval_Email1_0</name>
        <label>Awaiting Approval Email</label>
        <locationX>6188</locationX>
        <locationY>11814</locationY>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <elementReference>$Record.Owner:User.Email</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>StatusChangeSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>StatusChangedBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Case_Assigned_Notification</name>
        <label>Case Assigned Notification</label>
        <locationX>2162</locationX>
        <locationY>20184</locationY>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <elementReference>$Record.Owner:User.Email</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>CaseAssignedSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>CaseAssignmentBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Case_Type_Assignment</name>
        <label>Case Type Assignment</label>
        <locationX>4978</locationX>
        <locationY>19152</locationY>
        <connector>
            <targetReference>Was_Subcategory_Changed</targetReference>
        </connector>
        <flowName>Case_Type_Assignment</flowName>
        <inputAssignments>
            <name>Case</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </subflows>
    <subflows>
        <name>Copy_1_of_Log_Regular_Time</name>
        <label>Log Regular Time</label>
        <locationX>754</locationX>
        <locationY>1482</locationY>
        <connector>
            <targetReference>Copy_2_of_Set_Status_to_New</targetReference>
        </connector>
        <flowName>Workday_Hour_Master</flowName>
        <inputAssignments>
            <name>CaseId</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>PriorCaseId</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>RegularTimeStamp</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Copy_1_of_Log_Unassigned_Time</name>
        <label>Copy 1 of Log Unassigned Time</label>
        <locationX>798</locationX>
        <locationY>600</locationY>
        <connector>
            <targetReference>Copy_1_of_Store_Slack_Owner</targetReference>
        </connector>
        <flowName>Workday_Hour_Master</flowName>
        <inputAssignments>
            <name>CaseId</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>IsAssigned</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>PriorCaseId</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Copy_1_of_Set_Status_to_New</name>
        <label>Set Status to New</label>
        <locationX>4538</locationX>
        <locationY>20076</locationY>
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
            <name>Status2Set</name>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Copy_2_of_Log_Regular_Time</name>
        <label>Log Regular Time</label>
        <locationX>1194</locationX>
        <locationY>1224</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Copy_2_of_Set_Status_to_New</targetReference>
        </connector>
        <flowName>Workday_Hour_Master</flowName>
        <inputAssignments>
            <name>CaseId</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>PriorCaseId</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Copy_2_of_Set_Status_to_New</name>
        <label>Copy 2 of Set Status to New</label>
        <locationX>1106</locationX>
        <locationY>1674</locationY>
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
            <name>Status2Set</name>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Copy_3_of_Set_OnHold_Status</name>
        <label>Set Selected for Dev Status</label>
        <locationX>4318</locationX>
        <locationY>4572</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Account_Changed_gate</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Selected for Dev</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Copy_4_of_Set_Status_to_New</name>
        <label>Set Status to New</label>
        <locationX>4802</locationX>
        <locationY>20076</locationY>
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
            <name>Status2Set</name>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Copy_5_of_Set_Status_to_New</name>
        <label>Set Status to New</label>
        <locationX>5330</locationX>
        <locationY>20076</locationY>
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
            <name>Status2Set</name>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Copy_8_of_Set_Status_to_New</name>
        <label>Set Status to New</label>
        <locationX>6122</locationX>
        <locationY>19968</locationY>
        <flowName>Case_Status_Subflow</flowName>
        <inputAssignments>
            <name>Case</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>Status2Set</name>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Create_Buy_Sell_Opp</name>
        <label>Create Buy Sell Opp</label>
        <locationX>5110</locationX>
        <locationY>1116</locationY>
        <connector>
            <targetReference>Changed_Away_from_Waiting_on_Dev</targetReference>
        </connector>
        <flowName>Opportunity_Creator_Subflow</flowName>
        <inputAssignments>
            <name>Case</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Create_Touch</name>
        <label>Create Touch</label>
        <locationX>5242</locationX>
        <locationY>384</locationY>
        <connector>
            <targetReference>Quick_Cancelled</targetReference>
        </connector>
        <flowName>Touch_Creator</flowName>
        <inputAssignments>
            <name>OptionalInput</name>
            <value>
                <stringValue>Case Updated</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>UserID</name>
            <value>
                <elementReference>$User.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <description>This is a backup timestamp</description>
        <name>Dev_UnHold_Timestamp</name>
        <label>Dev Hold Timestamp 2</label>
        <locationX>5110</locationX>
        <locationY>1416</locationY>
        <connector>
            <targetReference>Add_Dev_Hold_Hours</targetReference>
        </connector>
        <flowName>Workday_Hour_Master</flowName>
        <inputAssignments>
            <name>CaseId</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>DevUnhold</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>PriorCaseId</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Forward_Case_0</name>
        <label>Forward Case</label>
        <locationX>4826</locationX>
        <locationY>17610</locationY>
        <connector>
            <targetReference>Forward_to_FD_0_0_0_0_0</targetReference>
        </connector>
        <flowName>Forward_to_SD</flowName>
        <inputAssignments>
            <name>CaseID</name>
            <value>
                <elementReference>$Record.Case_18_ID__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>NoteID</name>
            <value>
                <elementReference>ExternalNoteID</elementReference>
            </value>
        </inputAssignments>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </subflows>
    <subflows>
        <name>Forward_Case_0_0</name>
        <label>Forward Case</label>
        <locationX>4934</locationX>
        <locationY>14070</locationY>
        <connector>
            <targetReference>Forward_to_FD_0_0_0</targetReference>
        </connector>
        <flowName>Forward_to_SD</flowName>
        <inputAssignments>
            <name>CaseID</name>
            <value>
                <elementReference>$Record.Case_18_ID__c</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>NoteID</name>
            <value>
                <elementReference>InternalNoteID</elementReference>
            </value>
        </inputAssignments>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </subflows>
    <subflows>
        <name>Forward_to_FD_0</name>
        <label>Forward to FD</label>
        <locationX>5418</locationX>
        <locationY>8238</locationY>
        <connector>
            <targetReference>Update_Attachment_URLS</targetReference>
        </connector>
        <flowName>Forward_to_FD</flowName>
        <inputAssignments>
            <name>CaseID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </subflows>
    <subflows>
        <name>Forward_to_FD_0_0</name>
        <label>Forward to FD</label>
        <locationX>4934</locationX>
        <locationY>14370</locationY>
        <connector>
            <targetReference>Was_an_External_Note_Added</targetReference>
        </connector>
        <flowName>Forward_to_FD</flowName>
        <inputAssignments>
            <name>CaseID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>NoteID</name>
            <value>
                <elementReference>InternalNoteID</elementReference>
            </value>
        </inputAssignments>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </subflows>
    <subflows>
        <name>Forward_to_FD_0_0_0_0</name>
        <label>Forward to FD</label>
        <locationX>4826</locationX>
        <locationY>17910</locationY>
        <connector>
            <targetReference>Status_Changed</targetReference>
        </connector>
        <flowName>Forward_to_FD</flowName>
        <inputAssignments>
            <name>CaseID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>NoteID</name>
            <value>
                <elementReference>ExternalNoteID</elementReference>
            </value>
        </inputAssignments>
        <storeOutputAutomatically>true</storeOutputAutomatically>
    </subflows>
    <subflows>
        <name>Log_Regular_Time</name>
        <label>Log Regular Time</label>
        <locationX>4912</locationX>
        <locationY>18852</locationY>
        <connector>
            <targetReference>Was_the_Case_Request_Changed</targetReference>
        </connector>
        <flowName>Workday_Hour_Master</flowName>
        <inputAssignments>
            <name>CaseId</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>PriorCaseId</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>RegularTimeStamp</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Log_Regular_Time_0</name>
        <label>Log Regular Time</label>
        <locationX>5308</locationX>
        <locationY>18594</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Was_the_Case_Request_Changed</targetReference>
        </connector>
        <flowName>Workday_Hour_Master</flowName>
        <inputAssignments>
            <name>CaseId</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>PriorCaseId</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Log_Regular_Time_0_0_0</name>
        <label>Log Regular Time</label>
        <locationX>5330</locationX>
        <locationY>12630</locationY>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
        <flowName>Workday_Hour_Master</flowName>
        <inputAssignments>
            <name>CaseId</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>PriorCaseId</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>ReOpened</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Log_Unassigned_Time</name>
        <label>Log Unassigned Time</label>
        <locationX>4846</locationX>
        <locationY>3156</locationY>
        <connector>
            <targetReference>Store_Slack_Owner</targetReference>
        </connector>
        <flowName>Workday_Hour_Master</flowName>
        <inputAssignments>
            <name>CaseId</name>
            <value>
                <elementReference>$Record</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>IsAssigned</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>PriorCaseId</name>
            <value>
                <elementReference>$Record__Prior</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>On_Hold_Notification1</name>
        <label>On Hold Notification</label>
        <locationX>3768</locationX>
        <locationY>11814</locationY>
        <connector>
            <targetReference>Send_WPM_On_Hold_Email</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <elementReference>NotifyInternalCSTeam</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>StatusChangeSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>StatusChangedBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_In_Progress_with_Dev_Status</name>
        <label>Set In Progress with Dev Status</label>
        <locationX>4054</locationX>
        <locationY>4572</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Account_Changed_gate</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>In Progress with Dev</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_Internal_Feedback_Needed_Status</name>
        <label>Set Internal Feedback Needed Status</label>
        <locationX>4582</locationX>
        <locationY>4572</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Account_Changed_gate</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Internal Feedback Needed</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_OnHold_Status</name>
        <label>Set OnHold Status</label>
        <locationX>4846</locationX>
        <locationY>4572</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Account_Changed_gate</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>On Hold</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>set_Ready_for_Review_status</name>
        <label>set Ready for Testing status</label>
        <locationX>5242</locationX>
        <locationY>19452</locationY>
        <connector>
            <targetReference>Was_the_Case_Category_changed</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Ready for Testing</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_Ready_for_Testing_Status</name>
        <label>Set Ready for Testing Status</label>
        <locationX>3526</locationX>
        <locationY>4572</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Account_Changed_gate</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Ready for Testing</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_Ready_for_Testing_Status5678e567</name>
        <label>Set Ready for Testing Status</label>
        <locationX>4582</locationX>
        <locationY>4830</locationY>
        <connector>
            <targetReference>Account_Changed_gate</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Ready for Testing</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_Status_to_Assigned</name>
        <label>Set Status to Assigned</label>
        <locationX>2162</locationX>
        <locationY>20076</locationY>
        <connector>
            <targetReference>Case_Assigned_Notification</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Assigned</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>set_Status_to_FD_Status</name>
        <label>set Status to FD Status</label>
        <locationX>5154</locationX>
        <locationY>8130</locationY>
        <connector>
            <targetReference>Was_the_Account_populated</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <elementReference>FDStatus</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_Status_to_New</name>
        <label>Set Status to New</label>
        <locationX>1898</locationX>
        <locationY>20076</locationY>
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
            <name>Status2Set</name>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_Status_to_New456456</name>
        <label>Set Status to New</label>
        <locationX>5066</locationX>
        <locationY>20076</locationY>
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
            <name>Status2Set</name>
            <value>
                <stringValue>New</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_Waiting_on_Development_Status</name>
        <label>Set Waiting on Development Status</label>
        <locationX>5110</locationX>
        <locationY>4164</locationY>
        <connector>
            <targetReference>Was_Jira_Status_Changed</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Waiting on Development</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Set_Waiting_on_Development_Status4563456</name>
        <label>Set Waiting on Development Status</label>
        <locationX>3790</locationX>
        <locationY>4572</locationY>
        <connector>
            <isGoTo>true</isGoTo>
            <targetReference>Account_Changed_gate</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Waiting on Development</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Stalled_Case</name>
        <label>Stalled Case</label>
        <locationX>6078</locationX>
        <locationY>23939</locationY>
        <connector>
            <targetReference>send_WPM_Stalled_Email</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <elementReference>NotifyInternalCSTeam</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>StalledSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>StalledBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>false</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>TVM_Information_Provided_Email_Push</name>
        <label>TVM Information Provided Email/Push</label>
        <locationX>4516</locationX>
        <locationY>11814</locationY>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <stringValue>{!NotifyCreatorAddress}, {!NotifyOwner}</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>InfoProvidedSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>InfoProvidedBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P1_PushCNAPIName</name>
            <value>
                <stringValue>Case_Information_Provided</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P2_PushUserIDList</name>
            <value>
                <elementReference>AssignIPTeamList</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P3_PushTitle</name>
            <value>
                <elementReference>InfoProvidedSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P4_PushBody</name>
            <value>
                <elementReference>PushInfoProvidedBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>TVM_Internal_Note_Push</name>
        <label>TVM Internal Note/Push</label>
        <locationX>5154</locationX>
        <locationY>13554</locationY>
        <connector>
            <targetReference>Pass_Internal_Note_to_Internal_External_Notes</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <stringValue>{!NotifyInternalCSTeam},{!NotifyWPMFordFDNOwner}</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>SubjectLineNewInternalComment</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>BodyInternalComment</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P1_PushCNAPIName</name>
            <value>
                <stringValue>Case_Internal_Note_Notification</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P2_PushUserIDList</name>
            <value>
                <elementReference>PushInternalCSTeam</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P3_PushTitle</name>
            <value>
                <elementReference>SubjectLineNewInternalComment</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P4_PushBody</name>
            <value>
                <elementReference>BodyInternalCommentPush</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>TVM_Needs_Information_Email_Push</name>
        <label>TVM Needs Information Email/Push</label>
        <locationX>4208</locationX>
        <locationY>11814</locationY>
        <connector>
            <targetReference>Send_WPM_Info_Needed_Email</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <elementReference>NotifyInternalCSTeam</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <elementReference>InfoNeededSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <elementReference>InfoNeededBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E5_SupportFromAddress</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P1_PushCNAPIName</name>
            <value>
                <stringValue>Case_Need_Information</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P2_PushUserIDList</name>
            <value>
                <elementReference>PushInternalCSTeam</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P3_PushTitle</name>
            <value>
                <elementReference>InfoNeededSubject</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P4_PushBody</name>
            <value>
                <elementReference>PushInfoNeededBody</elementReference>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>P_NeedPush</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>recordID</name>
            <value>
                <elementReference>$Record.Id</elementReference>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>TVM_Send_Error_Email</name>
        <label>TVM Send Error Email</label>
        <locationX>4672</locationX>
        <locationY>14754</locationY>
        <connector>
            <targetReference>Testing_Element</targetReference>
        </connector>
        <flowName>TVM_Master_Notification_Deployment</flowName>
        <inputAssignments>
            <name>E1_EmailRecipient</name>
            <value>
                <stringValue>sfintegration@teamvelocitymarketing.com</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E3_EmailSubjectLine</name>
            <value>
                <stringValue>External Comment Used</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E4_EmailBody</name>
            <value>
                <stringValue>External Comment was used, you can&apos;t remove it: https://teamvelocity.lightning.force.com/lightning/r/FlowRecord/2aFVb0000000P9hMAE/view</stringValue>
            </value>
        </inputAssignments>
        <inputAssignments>
            <name>E_NeedEmail</name>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Update_Production_Support_status_if_Production_Complete</name>
        <label>Update Production Support status if Production Complete</label>
        <locationX>4978</locationX>
        <locationY>12930</locationY>
        <connector>
            <targetReference>Production_Complete</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Production Complete</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <subflows>
        <name>Update_to_Closed</name>
        <label>Update to Closed</label>
        <locationX>4780</locationX>
        <locationY>11922</locationY>
        <connector>
            <targetReference>Was_Production_Complete_checked</targetReference>
        </connector>
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
            <name>Status2Set</name>
            <value>
                <stringValue>Closed</stringValue>
            </value>
        </inputAssignments>
    </subflows>
    <textTemplates>
        <name>BodyExternalComment</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;table class=&quot;ql-table-blob&quot; id=&quot;topTable&quot; width=&quot;500&quot;&gt;&lt;tbody&gt;&lt;tr style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: rgb(204, 204, 204);&quot; valign=&quot;top&quot;&gt;&lt;td style=&quot;background-color: rgb(255, 255, 255); font-size: 12pt; font-family: arial;&quot;&gt;&lt;table cellspacing=&quot;5&quot; width=&quot;550&quot; cellpadding=&quot;5&quot; border=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr valign=&quot;top&quot;&gt;&lt;td style=&quot;font-size: 12pt; border-width: 1px; border-color: rgb(0, 0, 255);&quot; id=&quot;c1r1&quot;&gt;&lt;div style=&quot;white-space: pre;&quot;&gt;An update has been added to Team Velocity Case Number: {!$Record.CaseNumber}{!ExternalFeedBackNeededBody}&lt;br&gt;&lt;br&gt;&lt;div&gt;{!$Record.External_Notes__c}&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;{!ExternalCaseClosedVarText}&lt;/div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Thank you!&lt;br&gt;&lt;i&gt;Team Velocity Support&lt;/i&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-size: 8px;&quot;&gt;Case Number: |::{!$Record.Case_18_ID__c}::|&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>BodyExternalComment_ToInternal</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>&lt;table class=&quot;ql-table-blob&quot; id=&quot;topTable&quot; width=&quot;500&quot;&gt;&lt;tbody&gt;&lt;tr style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: rgb(204, 204, 204);&quot; valign=&quot;top&quot;&gt;&lt;td style=&quot;background-color: rgb(255, 255, 255); font-size: 12pt; font-family: arial;&quot;&gt;&lt;table cellspacing=&quot;5&quot; width=&quot;550&quot; cellpadding=&quot;5&quot; border=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr valign=&quot;top&quot;&gt;&lt;td style=&quot;font-size: 12pt; border-width: 1px; border-color: rgb(0, 0, 255);&quot; id=&quot;c1r1&quot;&gt;&lt;div style=&quot;white-space: pre;&quot;&gt;An external comment has been added to Case Number: &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;br&gt;&lt;br&gt;&lt;span style=&quot;background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);&quot;&gt;Case Status: {!$Record.Status}&lt;/span&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;{!$Record.External_Notes__c}&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Thank you!&lt;br&gt;&lt;i&gt;Team Velocity Support&lt;/i&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;span style=&quot;font-size: 8px;&quot;&gt;Case Number: |::{!$Record.Case_18_ID__c}::|&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>BodyInternalComment</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>&lt;table class=&quot;ql-table-blob&quot; id=&quot;topTable&quot; width=&quot;500&quot;&gt;&lt;tbody&gt;&lt;tr style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: rgb(204, 204, 204);&quot; valign=&quot;top&quot;&gt;&lt;td style=&quot;background-color: rgb(255, 255, 255); font-size: 12pt; font-family: arial;&quot;&gt;&lt;table cellspacing=&quot;5&quot; width=&quot;550&quot; cellpadding=&quot;5&quot; border=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr valign=&quot;top&quot;&gt;&lt;td style=&quot;font-size: 12pt; border-width: 1px; border-color: rgb(0, 0, 255);&quot; id=&quot;c1r1&quot;&gt;&lt;div style=&quot;white-space: pre;&quot;&gt;An internal comment has been added to Case Number: &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;br&gt;&lt;br&gt;&lt;span style=&quot;background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);&quot;&gt;Case Status: {!$Record.Status}&lt;/span&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;{!$Record.Internal_Notes__c}{!$Record.External_Notes__c}&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Thank you!&lt;br&gt;&lt;i&gt;Team Velocity Support&lt;/i&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;span style=&quot;font-size: 8px;&quot;&gt;Case Number: |::{!$Record.Case_18_ID__c}::|&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>BodyInternalCommentPush</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>Case Status: {!$Record.Status}
{!$Record.Internal_Notes__c}</text>
    </textTemplates>
    <textTemplates>
        <name>BodyNewTicket</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;&lt;img src=&quot;https://teamvelocity.my.salesforce.com/servlet/servlet.ImageServer?id=0155f000000zTqg&amp;amp;oid=00D5f000005XvQ4&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;An new Ticket has been added&lt;/p&gt;&lt;p&gt;Case Number: &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Origin: {!$Record.Origin}&lt;/p&gt;&lt;p&gt;Dealership Contact: {!$Record.Contact.FirstName} &lt;span style=&quot;color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);&quot;&gt;{!$Record.Contact.LastName}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);&quot;&gt;Dealership Contact Email: {!$Record.Contact.Email}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;Category: {!$Record.Case_Category__c}&lt;/p&gt;&lt;p&gt;Subject: {!$Record.Subject}&lt;/p&gt;&lt;p&gt;Details: {!$Record.Internal_Notes__c}{!$Record.External_Notes__c}&lt;/p&gt;&lt;p&gt;Date/Time: {!$Record.LastModifiedDate}&lt;/p&gt;&lt;p&gt;Case Status: {!$Record.Status}&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>CaseAssignedSubject</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>{!$Record.Account.Name} Case {!$Record.CaseNumber} Was Assigned to You</text>
    </textTemplates>
    <textTemplates>
        <name>CaseAssignmentBody</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;*** &lt;/span&gt;&lt;strong style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;u&gt;NEW CASE ASSIGNMENT NOTIFICATION&lt;/u&gt;&lt;/strong&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt; ***&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;Case &lt;/span&gt;&lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot; style=&quot;color: rgb(27, 151, 208); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt; has been assigned to you. {!$User.Full_Name_Formula__c} is the person that assigned it to you. &lt;/span&gt;See below for details:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Subject&lt;/strong&gt;: {!$Record.Subject}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Category&lt;/strong&gt;: {!$Record.Case_Category__c}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Subcategory&lt;/strong&gt;: {!$Record.Case_Subcategory__c}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Request&lt;/strong&gt;: {!$Record.Case_Request__c}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Status&lt;/strong&gt;: {!$Record.Status_Filtered__c}&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>CaseClosedExternalBody</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;table class=&quot;ql-table-blob&quot; id=&quot;topTable&quot; width=&quot;500&quot;&gt;&lt;tbody&gt;&lt;tr style=&quot;color: #082642; font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: #082642;&quot; valign=&quot;top&quot;&gt;&lt;td style=&quot;background-color: #082642; vertical-align: middle; height: 75px; text-align: center;&quot;&gt;&lt;br&gt;&lt;img src=&quot;https://teamvelocity.my.salesforce.com/servlet/servlet.ImageServer?id=0155f000000zTrF&amp;amp;oid=00D5f000005XvQ4&quot; id=&quot;r5sp1&quot; border=&quot;0&quot;&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: #082642;&quot; valign=&quot;top&quot;&gt;&lt;td style=&quot;background-color: #082642; height: 3px;&quot;&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: rgb(204, 204, 204);&quot; valign=&quot;top&quot;&gt;&lt;td style=&quot;background-color: rgb(255, 255, 255); font-size: 12pt; font-family: arial;&quot;&gt;&lt;table cellspacing=&quot;5&quot; width=&quot;550&quot; cellpadding=&quot;5&quot; border=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr valign=&quot;top&quot;&gt;&lt;td style=&quot;font-size: 12pt; border-width: 1px; border-color: rgb(0, 0, 255);&quot; id=&quot;c1r1&quot;&gt;&lt;div style=&quot;white-space: pre;&quot;&gt;Your Case has been closed!&lt;br&gt;&lt;br&gt;&lt;div&gt;Team Velocity Case Number: {!$Record.CaseNumber}&lt;br&gt;&lt;br&gt;{!ClosedComment}&lt;br&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;If you have further issues or questions please don&apos;t hesitate to reach out to your Account Management Team.&lt;br&gt;&lt;/div&gt;&lt;div&gt;Thank you!&lt;br&gt;&lt;i&gt;Team Velocity Support&lt;/i&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;span style=&quot;font-size: 8px;&quot;&gt;Case Number: |::{!$Record.Case_18_ID__c}::|&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: #082642;&quot; valign=&quot;top&quot;&gt;&lt;td style=&quot;background-color: rgb(255, 255, 255); height: 5px;&quot;&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: #082642;&quot; valign=&quot;top&quot;&gt;&lt;td style=&quot;#082642; vertical-align: middle; height: 75px; text-align: center;&quot;&gt;&lt;br&gt;&lt;img src=&quot;https://teamvelocity.my.salesforce.com/servlet/servlet.ImageServer?id=0155f000000zTrF&amp;amp;oid=00D5f000005XvQ4&quot; id=&quot;r5sp1&quot; border=&quot;0&quot;&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium; background-color: #082642;&quot; valign=&quot;top&quot;&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>CaseClosedInternalBody</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;Case {!$Record.CaseNumber} was just marked closed! Click the following link to see it: &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Subject&lt;/strong&gt;: {!$Record__Prior.Subject}&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Description&lt;/strong&gt;:&lt;/p&gt;&lt;p&gt;{!$Record.Description}&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Comments&lt;/strong&gt;:&lt;/p&gt;&lt;p&gt;{!$Record.Internal_Notes_Rich__c}{!$Record.Resolution_Notes__c}&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>CaseClosedSubject</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>Case {!$Record.CaseNumber} Closed for {!$Record.Account.Name}</text>
    </textTemplates>
    <textTemplates>
        <name>ErrorMessage1</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>Case reopened &amp; Status set to Upload Complete - Ready to Send to Dealer because {!ErrorVariable1}
After fixing the issue you can reclose. If the email successfully sends to the Primary POC, the case will stay closed.

Please reach out to an Admin with a screenshot of this message and a link to this case if you need assistance.</text>
    </textTemplates>
    <textTemplates>
        <description>{!$Record.Subject}</description>
        <name>InfoNeededBody</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Support case&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot; style=&quot;font-family: Arial, sans-serif;&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;needs information from you for&amp;nbsp;{!&lt;/span&gt;$Record&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;.Account}. See below for details.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Case Number:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot; style=&quot;font-family: Arial, sans-serif;&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Subject:&amp;nbsp;{!$Record.Subject}&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Priority:&amp;nbsp;{!$Record.Priority}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Account:&amp;nbsp;{!$Record.AccountId}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Please remember to update the case status to &quot;Information Provided&quot; after you update the information.&lt;/span&gt;&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>InfoNeededSubject</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>Case Needs Information for {!$Record.Name__c}</text>
    </textTemplates>
    <textTemplates>
        <name>InfoProvidedBody</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Support case&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot; style=&quot;font-family: Arial, sans-serif;&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;information has been provided for&amp;nbsp;{!&lt;/span&gt;$Record&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;.Account}. See below for details.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Case Number:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot; style=&quot;font-family: Arial, sans-serif;&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Subject:&amp;nbsp;{!$Record.Subject}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Priority:&amp;nbsp;{!$Record.Priority}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Account:&amp;nbsp;{!$Record.AccountId}&lt;/span&gt;&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>InfoProvidedSubject</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>Case Information Provided for {!$Record.Name__c}</text>
    </textTemplates>
    <textTemplates>
        <name>InformationProvided</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;Additional information has been provided to you for Support case &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;. See below for details.&lt;/p&gt;&lt;p&gt;Case Number: &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Subject: {!$Record.Subject}&lt;/p&gt;&lt;p&gt;Priority: {!$Record.Priority}&lt;/p&gt;&lt;p&gt;Account: {!$Record.Account.Name}&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>NeedsInformation</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;Support case &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt; needs information from you (RAD or AM) for {!$Record.Account.Name}. See below for details.&lt;/p&gt;&lt;p&gt;Case Number: &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Subject: {!$Record.Subject}&lt;/p&gt;&lt;p&gt;Priority: {!$Record.Priority}&lt;/p&gt;&lt;p&gt;Account: {!$Record.Account.Name}&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Please remember to update the case status to &quot;Information Provided&quot; after you update the information.&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>NeedsInformationSubject</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>Case Needs Information for {!$Record.Account.Name}</text>
    </textTemplates>
    <textTemplates>
        <name>OnHold</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;Support case &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt; has just been marked &quot;On Hold&quot; for {!$Record.Account.Name}. See below for details.&lt;/p&gt;&lt;p&gt;Case Number: &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Subject: {!$Record.Subject}&lt;/p&gt;&lt;p&gt;Priority: {!$Record.Priority}&lt;/p&gt;&lt;p&gt;Account: {!$Record.Account.Name}&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>OnHoldSubject</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>Case on Hold for {!$Record.Account.Name}</text>
    </textTemplates>
    <textTemplates>
        <name>OTTMediaUploadTemplateBody</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif; color: rgb(0, 0, 0); font-size: 11pt;&quot;&gt;Hi&amp;nbsp;{!PrimaryPOC.FirstName}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif; color: rgb(0, 0, 0); font-size: 11pt;&quot;&gt;We’re thrilled to share that your{!AdMonth}OTT ads are almost live!&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong style=&quot;font-size: 13px;&quot;&gt;Link to Creative:&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif; color: rgb(0, 0, 0); font-size: 11pt;&quot;&gt;Your spot has been trafficked to the approved audiences and platforms and should be live in 24-48hours. We will be actively monitoring your account performance and look forward to reviewing performance metrics with you when metrics post next month.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif; color: rgb(0, 0, 0); font-size: 11pt;&quot;&gt;Additionally, we have recapped a few benefits/reminders below:&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;strong style=&quot;font-family: Arial, sans-serif; color: rgb(0, 0, 0); font-size: 11pt;&quot;&gt;Benefits of OTT Via Team Velocity:&lt;/strong&gt;&lt;strong style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;Co-op:&lt;/strong&gt;&lt;span style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;&amp;nbsp;package will be compiled and submitted on your behalf where applicable.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;strong style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;Premium Content:&lt;/strong&gt;&lt;span style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;&amp;nbsp;Your ads are prioritized against PREMIUM content (Amazon, Hulu, Paramount+, Peacock, etc)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;strong style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;In-Market Audiences Designed For Your Needs:&lt;/strong&gt;&lt;span style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;&amp;nbsp;Your ads will reach in-market shoppers customized to your unique needs (please see your proposal for a reminder of the specific audiences you are targeting).&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;strong style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;Placement:&lt;/strong&gt;&lt;span style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;&amp;nbsp;Our ads are prioritized across premium platforms on TV screens. Ads will appear in a “leaned back, living room experience” and will be a forced view.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;strong style=&quot;font-family: Arial, sans-serif; color: rgb(0, 0, 0); font-size: 11pt;&quot;&gt;Reminders:&lt;/strong&gt;&lt;strong style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;When Will I See Reporting?&amp;nbsp;&lt;/strong&gt;&lt;span style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;Reporting will be emailed to you once the metrics are posted. This typically happens around the 15th of each month, reflecting last month’s performance.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;strong style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;How Do I Adjust My Monthly Budget?&amp;nbsp;&lt;/strong&gt;&lt;span style=&quot;font-family: Arial, sans-serif; font-size: 11pt;&quot;&gt;Your current OTT budget will carry over M/M unless you notify your RAD during monthly touch points.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif; color: rgb(0, 0, 0); font-size: 11pt;&quot;&gt;Thank you Team Velocity!&lt;/span&gt;&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>PushInfoNeededBody</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>{!$Record.Subject}
This Case needs your attention!</text>
    </textTemplates>
    <textTemplates>
        <name>PushInfoProvidedBody</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>{!$Record.Subject}
This Case Information Provided. Please resolve case.</text>
    </textTemplates>
    <textTemplates>
        <name>ResolutionNoteComment</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>{!$User.Full_Name_Formula__c} Just updated the resolution notes to this:
{!$Record.Resolution_Notes__c}</text>
    </textTemplates>
    <textTemplates>
        <name>Stalled_Case_Email</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;Support case &lt;/span&gt;&lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot; style=&quot;color: rgb(16, 107, 169); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif;&quot;&gt; for &lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;{!$Record.Account.Name}&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif;&quot;&gt; has not been modified in two days and likely requires action. Please do not forget about it. See below for details.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;Case Number:&lt;/span&gt;&lt;span style=&quot;color: rgb(16, 107, 169); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt; &lt;/span&gt;&lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot; style=&quot;color: rgb(16, 107, 169); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;Subject: &lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;{!$Record.Subject}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;Priority: {!$Record.Priority}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;Account: &lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;{!$Record.Account.Name}&lt;/span&gt;&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>Stalled_Case_Subject</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;{!$Record.Case_Category__c} Stalled Case for {!$Record.Account.Name}&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>StalledBody</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;Support case &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt; for {!$Record.Account.Name} is now considered stalled. Please do not forget about it. See below for details:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Subject: {!$Record.Subject}&lt;/p&gt;&lt;p&gt;Category: {!$Record.Case_Category__c}&lt;/p&gt;&lt;p&gt;Subcategory: {!$Record.Case_Subcategory__c}&lt;/p&gt;&lt;p&gt;Request: {!$Record.Case_Request__c}&lt;/p&gt;&lt;p&gt;Status: {!$Record.Status_Filtered__c}&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>StalledSubject</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>{!$Record.Account.Name} Stalled Case {!$Record.Case_Category__c} {!$Record.CaseNumber}</text>
    </textTemplates>
    <textTemplates>
        <name>StatusChangedBody</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;{!$User.Full_Name_Formula__c}&lt;span style=&quot;background-color: rgb(255, 255, 255);&quot;&gt; just changed s&lt;/span&gt;upport case &lt;a href=&quot;https://teamvelocity.lightning.force.com/lightning/r/Case/{!$Record.Id}/view&quot; rel=&quot;noopener noreferrer&quot; target=&quot;_blank&quot;&gt;{!$Record.CaseNumber}&lt;/a&gt; &lt;u&gt;status&lt;/u&gt; to &lt;u&gt;{!$Record.Status_Filtered__c}&lt;/u&gt;. See below for details:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Subject&lt;/strong&gt;: {!$Record.Subject}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Category&lt;/strong&gt;: {!$Record.Case_Category__c}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Subcategory&lt;/strong&gt;: {!$Record.Case_Subcategory__c}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Request&lt;/strong&gt;: {!$Record.Case_Request__c}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Status&lt;/strong&gt;: {!$Record.Status_Filtered__c}&lt;/p&gt;</text>
    </textTemplates>
    <textTemplates>
        <name>StatusChangeSubject</name>
        <isViewedAsPlainText>true</isViewedAsPlainText>
        <text>{!$Record.Account.Name} Case {!$Record.CaseNumber} Changed to {!$Record.Status_Filtered__c}</text>
    </textTemplates>
    <textTemplates>
        <description>Slack message when 3PV case closes</description>
        <name>TT_Slack_Vendor_Activated</name>
        <isViewedAsPlainText>false</isViewedAsPlainText>
        <text>&lt;p&gt;✅ 3rd Party Vendor Activated&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Account: {!$Record.Account.Name}&lt;/p&gt;&lt;p&gt;Vendoer {!$Record.X3rd_Party_Vendor__c}&lt;/p&gt;&lt;p&gt;Case: {!$Record.CaseNumber}&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;</text>
    </textTemplates>
    <variables>
        <name>AssignIPTeamList</name>
        <dataType>String</dataType>
        <isCollection>true</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
    </variables>
    <variables>
        <name>BellNotificationList</name>
        <dataType>String</dataType>
        <isCollection>true</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
    </variables>
    <variables>
        <name>CCList</name>
        <dataType>String</dataType>
        <isCollection>true</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
    </variables>
    <variables>
        <name>ClosedComment</name>
        <dataType>String</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
    </variables>
    <variables>
        <name>ContactList</name>
        <dataType>SObject</dataType>
        <isCollection>true</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <objectType>Contact</objectType>
    </variables>
    <variables>
        <name>CurrDevHoldHours</name>
        <dataType>Number</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <scale>2</scale>
    </variables>
    <variables>
        <name>currentItem_DNC_Filter</name>
        <dataType>SObject</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <objectType>Contact</objectType>
    </variables>
    <variables>
        <name>currentItem_Filter_Primary_POCs</name>
        <dataType>SObject</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <objectType>Contact</objectType>
    </variables>
    <variables>
        <name>currentItem_NLWC_Filter</name>
        <dataType>SObject</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <objectType>Contact</objectType>
    </variables>
    <variables>
        <name>ErrorVariable1</name>
        <dataType>String</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
    </variables>
    <variables>
        <name>ExternalNoteID</name>
        <dataType>String</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>true</isOutput>
    </variables>
    <variables>
        <name>InternalNoteID</name>
        <dataType>String</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>true</isOutput>
    </variables>
    <variables>
        <name>LoopNumber</name>
        <dataType>Number</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <scale>0</scale>
        <value>
            <numberValue>0.0</numberValue>
        </value>
    </variables>
    <variables>
        <name>PrimaryPOC</name>
        <dataType>SObject</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <objectType>Contact</objectType>
    </variables>
    <variables>
        <name>PushInternalCSTeam</name>
        <dataType>String</dataType>
        <isCollection>true</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
    </variables>
    <variables>
        <name>varVendorId</name>
        <dataType>String</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
    </variables>
    <variables>
        <name>x3rdPartyApprovalTime</name>
        <dataType>Number</dataType>
        <isCollection>false</isCollection>
        <isInput>false</isInput>
        <isOutput>false</isOutput>
        <scale>2</scale>
    </variables>
</Flow>
```
