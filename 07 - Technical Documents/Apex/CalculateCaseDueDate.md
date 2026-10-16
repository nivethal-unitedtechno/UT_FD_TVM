# Apex Class: CalculateCaseDueDate

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `CalculateCaseDueDate` |
| Type | Apex Class |
| API Version | 65.0 |
| Status | Active |
| Lines | 2055 |
| Last Modified | 2026-10-15 06:03 UTC by Sandip Patel |

## Related Components

- Test classes: [Test_calculatecaseduedate](Test_calculatecaseduedate.md), [Test_CaseDueDateTrigger](Test_CaseDueDateTrigger.md)
- Invoked by triggers: [CaseTrigger_FNDN](CaseTrigger_FNDN.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 10 | `// Case Category value that, together with Foundation_Record__c, decides which Cases` |
| 11 | `// the insert/update routing logic runs for. Foundation_Record__c is a formula checkbox,` |
| 13 | `private static final String FND_CATEGORY_NEW_DIGITAL_SUPPORT = 'New Digital Support';` |
| 542 | `// Only Cases where Foundation_Record__c = TRUE or Case_Category__c = 'New Digital Support'` |
| 543 | `// are routed. Foundation_Record__c is a formula checkbox - read directly instead of` |
| 548 | `if((c.Foundation_Record__c == true \|\| c.Case_Category__c == FND_CATEGORY_NEW_DIGITAL_SUPPORT)` |
| 768 | `// Cases whose Case Category changed TO New Digital Support` |
| 783 | `'Case Category changed to New Digital Support. Case Id: ' + c.Id` |
| 798 | `// to New Digital Support` |
| 841 | `(c.Foundation_Record__c == true \|\|` |
| 1384 | `(objCase.Foundation_Record__c == true \|\|` |

## Source

```apex
//Apex from FND 
public class CalculateCaseDueDate 
{
    // =====================================================================================
    //  CAMPAIGNS QA RULE
    // =====================================================================================
    private static final String FND_STATUS_READY_FOR_QA = 'Ready for QA';
    private static final String FND_MANAGER_TOKEN       = 'Assignee_Manager__c';

    // Case Category value that, together with Foundation_Record__c, decides which Cases
    // the insert/update routing logic runs for. Foundation_Record__c is a formula checkbox,
    // so it is read directly (not looked up via RecordTypeId) - see onBeforeInsert/onBeforeUpdate.
    private static final String FND_CATEGORY_NEW_DIGITAL_SUPPORT = 'New Digital Support';

    // Case requests (picklist API names) that use the Campaigns QA rule (Case_Routing_Config__mdt.Campaigns__c)
    private static final Set<String> FND_REQ_CAMPAIGN_QA = new Set<String>{
        'Live Client - New Product Launch',
        'New Campaign Request – Launch A New Campaign For Existing Product'
    };

    // Field maps used to check where the QA_Field_Name__c field lives (Case or Account)
    private static final Map<String, Schema.SObjectField> CASE_FIELDS =
        Schema.SObjectType.Case.fields.getMap();
    private static final Map<String, Schema.SObjectField> ACCOUNT_FIELDS =
        Schema.SObjectType.Account.fields.getMap();

    //For update
    public static void calculateCaseDueDate(List<Case> updatedCases,Map<Id,Case> oldCaseMap)
    {
        for (Case updatedCase : updatedCases)
        {
            //1 of start month field
            If( (updatedCase.Status_Filtered__c != oldCaseMap.get(updatedCase.Id).Status_Filtered__c) || 
               ((updatedCase.Case_Request__c != oldCaseMap.get(updatedCase.Id).Case_Request__c) || 
                (updatedCase.Digital_Execution_Start_Date__c != oldCaseMap.get(updatedCase.Id).Digital_Execution_Start_Date__c) ) && 
               (updatedCase.Status_Filtered__c == 'Future' && updatedCase.Case_Request__c == 'Future Budget Change'))
            { 
                If(updatedCase.Digital_Execution_Start_Date__c != null)
                {
                    
                    //Integer monthNumber = ((updatedCase.Digital_Execution_Start_Date__c).month());
                    //Integer currentYear = ((updatedCase.Digital_Execution_Start_Date__c).year());
                    
                    //If(currentYear != null)
                    //{
                    //Date firstDayOfMonth = Date.newInstance(currentYear, monthNumber, 1);
                    
                    //System.debug('First day of the month: ' + firstDayOfMonth);
                    updatedCase.Start_Date_Time__c = updatedCase.Digital_Execution_Start_Date__c;
                    updatedCase.Start_Date__c = updatedCase.Digital_Execution_Start_Date__c;
                    //updatedCase.Due_Date__c = firstDayOfMonth;
                    //}                    
                }
            } 
            //last date before 5 business days of month
            If(((updatedCase.Status_Filtered__c != oldCaseMap.get(updatedCase.Id).Status_Filtered__c) || 
                (updatedCase.Case_Request__c != oldCaseMap.get(updatedCase.Id).Case_Request__c) || 
                (updatedCase.Digital_Execution_Start_Date__c != oldCaseMap.get(updatedCase.Id).Digital_Execution_Start_Date__c) ) && 
               (updatedCase.Status_Filtered__c == 'Future' && 
                (updatedCase.Case_Request__c == 'Future Campaign Build - Client Requested' || 
                 updatedCase.Case_Request__c == 'Future Campaign Build - Get Me More' || 
                 updatedCase.Case_Request__c == 'Future Campaign Build - Standard')))
               
            {
                If(updatedCase.Digital_Execution_Start_Date__c != null) 
                {
                    
                    //Integer monthNumber = ((updatedCase.Digital_Execution_Start_Date__c).month());
                    //Integer year = ((updatedCase.Digital_Execution_Start_Date__c).year());
                    
                    //If(year != null)
                    //{
                    
                    //Date firstDayOfMonth = Date.newInstance(year, monthNumber, 1);
                    /*Integer businessDaysCount = 0;
Integer daysToSubtract = 0;
while (businessDaysCount < 5)
{
daysToSubtract++;
Date subtractedDate = firstDayOfMonth.addDays(daysToSubtract);
Datetime subtractedDatetime = Datetime.newInstance(subtractedDate.year(), subtractedDate.month(), subtractedDate.day());
String dayOfWeek = subtractedDatetime.format('EEEE');

if (!dayOfWeek.equals('Saturday') && !dayOfWeek.equals('Sunday')) 
{
businessDaysCount++;
}
}
firstDayOfMonth = firstDayOfMonth;
updatedCase.Start_Date_Time__c = firstDayOfMonth.addDays(-daysToSubtract);
updatedCase.Start_Date__c = firstDayOfMonth.addDays(-daysToSubtract);*/
                    
                    updatedCase.Start_Date_Time__c = updatedCase.Digital_Execution_Start_Date__c;
                    updatedCase.Start_Date__c = updatedCase.Digital_Execution_Start_Date__c;
                    // Get the last day of the month
                    //Integer lastDay = Date.daysInMonth(year, monthNumber-1);
                    //updatedCase.Due_Date__c = Date.newInstance(year, monthNumber-1, lastDay);
                    //System.debug('Last day of ' + monthName + ' ' + year + ': ' + lastDay);
                    //}
                }
                Else
                {
                     
                    Case oldCase = oldCaseMap.get(updatedCase.Id);
                    system.debug('oldCase ---'+oldCase);
                    if (updatedCase.SLA_Time__c != null && (updatedCase.SLA_Time__c != oldCase.SLA_Time__c)) 
                    {
                        system.debug('---- In first if  ---');
                        // Calculate the new due date based on the created date and SLA time
                        Integer slaTime = Integer.valueOf(updatedCase.SLA_Time__c);
                        system.debug(' slaTime  ---'+slaTime);
                        DateTime createdDateTime = updatedCase.CreatedDate;
                        system.debug(' createdDateTime  ---'+createdDateTime);
                        // Add additional days for cases created on weekends
                        if (createdDateTime.format('E') == 'Sat') 
                        {
                            system.debug('---- created on saturday  ---');
                            createdDateTime = createdDateTime.addDays(2);
                        }
                        else if (createdDateTime.format('E') == 'Sun') 
                        {
                            system.debug('---- created on sunday  ---');
                            createdDateTime = createdDateTime.addDays(1);
                        }
                        
                        // Adjust due date based on business hours
                        while (slaTime > 0) 
                        {
                            createdDateTime = createdDateTime.addHours(1);
                            if (isBusinessHour(createdDateTime))
                            {
                                slaTime--;
                            }
                        }
                        
                        Date dueDate = createdDateTime.date();
                        
                        // Update the case's due date field
                        //updatedCase.Due_Date__c = dueDate;
                    }
                }
            } 
        }
    }
    
    //For Insert
    public static void insertCases(List<Case> newCases)
    {
        if (!newCases.isEmpty()) 
        {
            Set<Id> casesId = new Set<Id>();
            Set<Id> futureCaseIds = new Set<Id>();
            //List<Case> caseListRPM = new List<Case>();
            //List<Case> caselist = new List<Case>();
            
            For(Case updatedCase : newCases)
            {
                
                /*if ( (updatedCase.Close_Date__c!=null && updatedCase.Case_Request__c =='Performance Review') )
{
caselist.add(updatedCase);
}*/
                
                If(updatedCase.SLA_Time__c != null)
                {
                    casesId.add(updatedCase.Id);   
                }
                //1 of start month field
                If(updatedCase.Digital_Execution_Start_Date__c != null && updatedCase.Status_Filtered__c == 'Future' && updatedCase.Case_Request__c == 'Future Budget Change')
                {
                    futureCaseIds.add(updatedCase.Id);
                } 
                //last date before 5 business days of month
                If(updatedCase.Digital_Execution_Start_Date__c != null && updatedCase.Status_Filtered__c == 'Future' && (updatedCase.Case_Request__c == 'Future Campaign Build - Client Requested' || updatedCase.Case_Request__c == 'Future Campaign Build - Get Me More' || updatedCase.Case_Request__c == 'Future Campaign Build - Standard'))
                {
                    futureCaseIds.add(updatedCase.Id);
                }
                
                /* if( updatedCase.Case_Request__c =='Performance Review' &&  
(updatedCase.Close_Date__c != null || updatedCase.Dealer_is_Satisfied_with_the_partnership__c != '' || 
updatedCase.Is_the_Dealer_meeting_sales_objectives__c != '' || 
updatedCase.Decision_Maker_attended_Performance_call__c != '' ||
updatedCase.third_Party_vendor_consistent_involvemen__c != '' || 
updatedCase.New_Stakeholder__c !=''))
{
caseListRPM.add(updatedCase);
}*/
            }
            /*if (!caseListRPM.isEmpty()) {
updateRPMScore(caseListRPM);
}*/
            //calculateAvgDays(caselist);
            calculateDueDateAsync(casesId);
            updateFutureCases(futureCaseIds);
        }
    } 
    
    //For sla cases insert
    //@future
    public static void calculateDueDateAsync(Set<Id> casesToUpdate)
    {
        List<Case> casesToUpdateWithDueDate = [SELECT Id,SLA_Time__c,Due_Date__c,CreatedDate FROM Case WHERE Id IN:casesToUpdate];
        List<Case> finalCaseLst = new List<Case>();
        for (Case updatedCase : casesToUpdateWithDueDate) 
        {
            // Calculate the new due date based on the created date and SLA time
            Integer slaTime = Integer.valueOf(updatedCase.SLA_Time__c);
            system.debug(' slaTime  ---'+slaTime);
            DateTime createdDateTime = updatedCase.CreatedDate;
            system.debug(' createdDateTime  ---'+createdDateTime);
            // Add additional days for cases created on weekends
            if (createdDateTime.format('E') == 'Sat') 
            {
                system.debug('---- created on saturday  ---');
                createdDateTime = createdDateTime.addDays(2);
            }
            else if (createdDateTime.format('E') == 'Sun') 
            {
                system.debug('---- created on sunday  ---');
                createdDateTime = createdDateTime.addDays(1);
            }
            
            // Adjust due date based on business hours
            while (slaTime > 0) 
            {
                createdDateTime = createdDateTime.addHours(1);
                if (isBusinessHour(createdDateTime))
                {
                    slaTime--;
                }
            }
            
            Date dueDate = createdDateTime.date();
            // Update the case's due date field
            updatedCase.Due_Date__c = dueDate;
            finalCaseLst.add(updatedCase);
        }
        
        
        if (!finalCaseLst.isEmpty()) 
        {
            update finalCaseLst;
        }
    }
    
    //For insert future cases
    //@future
    public static void updateFutureCases(Set<Id> casesToUpdate)
    {
        List<Case> casesToUpdateWithDueDate = [SELECT Id, Digital_Execution_Start_Date__c,Start_Month__c, Status_Filtered__c, Case_Request__c, 
                                               Start_Date__c, Due_Date__c, Future_Start_Year__c
                                               FROM Case 
                                               WHERE Id IN : casesToUpdate
                                              ];
        List<Case> finalCaseLst = new List<Case>();
        for (Case updatedCase : casesToUpdateWithDueDate) 
        {
            //1 of start month field
            If(updatedCase.Status_Filtered__c == 'Future' && updatedCase.Case_Request__c == 'Future Budget Change')
            {
                If(updatedCase.Digital_Execution_Start_Date__c != null)
                {
                    
                    /*Integer monthNumber = ((updatedCase.Digital_Execution_Start_Date__c).month());
Integer currentYear = ((updatedCase.Digital_Execution_Start_Date__c).year());

If(currentYear != null)
{
Date firstDayOfMonth = Date.newInstance(currentYear, monthNumber, 1);

System.debug('First day of the month: ' + firstDayOfMonth);
updatedCase.Start_Date_Time__c = firstDayOfMonth;
updatedCase.Start_Date__c = firstDayOfMonth;*/
                    updatedCase.Start_Date_Time__c = updatedCase.Digital_Execution_Start_Date__c;
                    updatedCase.Start_Date__c = updatedCase.Digital_Execution_Start_Date__c;
                    //updatedCase.Due_Date__c = firstDayOfMonth;
                    finalCaseLst.add(updatedCase);
                    //}
                }
            } 
            //last date before 5 business days of month
            If((updatedCase.Status_Filtered__c == 'Future') && (updatedCase.Case_Request__c == 'Future Campaign Build - Client Requested' || updatedCase.Case_Request__c == 'Future Campaign Build - Get Me More' || updatedCase.Case_Request__c == 'Future Campaign Build - Standard'))
            {
                If(updatedCase.Digital_Execution_Start_Date__c != null)
                {
                    
                    /*Integer monthNumber = ((updatedCase.Digital_Execution_Start_Date__c).month());
Integer year = ((updatedCase.Digital_Execution_Start_Date__c).year());

If(year != null)
{
Date firstDayOfMonth = Date.newInstance(year, monthNumber, 1);
Integer businessDaysCount = 0;
Integer daysToSubtract = 0;
while (businessDaysCount <= 5)
{
daysToSubtract++;
Date subtractedDate = firstDayOfMonth.addDays(daysToSubtract);
Datetime subtractedDatetime = Datetime.newInstance(subtractedDate.year(), subtractedDate.month(), subtractedDate.day());
String dayOfWeek = subtractedDatetime.format('EEEE');

if (!dayOfWeek.equals('Saturday') && !dayOfWeek.equals('Sunday')) 
{
businessDaysCount++;
}
}
firstDayOfMonth = firstDayOfMonth;
updatedCase.Start_Date_Time__c = firstDayOfMonth.addDays(-daysToSubtract);

updatedCase.Start_Date__c = firstDayOfMonth.addDays(-daysToSubtract);*/
                    
                    updatedCase.Start_Date_Time__c = updatedCase.Digital_Execution_Start_Date__c;
                    updatedCase.Start_Date__c = updatedCase.Digital_Execution_Start_Date__c;
                    // Get the last day of the month
                    //Integer lastDay = Date.daysInMonth(year, monthNumber-1);
                    //updatedCase.Due_Date__c = Date.newInstance(year, monthNumber, lastDay);
                    //System.debug('Last day of ' + monthName + ' ' + year + ': ' + lastDay);
                    finalCaseLst.add(updatedCase);
                    //}
                }
            }
        }
        if (!finalCaseLst.isEmpty()) 
        {
            update finalCaseLst;
        }
    }
    
    // Check if the given datetime falls within business hours
    private static Boolean isBusinessHour(DateTime dt) 
    {
        // Check if it's Monday to Friday
        if (dt.format('E') != 'Sat' && dt.format('E') != 'Sun')
        {
            Time startTime = Time.newInstance(9, 0, 0, 0);
            Time endTime = Time.newInstance(17, 0, 0, 0);
            Time current = dt.time();
            return current >= startTime && current <= endTime;
        }
        
        return false;
    }
    
    public static void afterUpdateCases(List<Case> newCases,Map<Id,Case> oldCaseMap)
    {
       
        Set<Id> caselist = new Set<Id>();
        Set<Id> accIdSet = new Set<Id>();
        Set<Id> caseListRPM = new Set<Id>();
        Set<Id> accIdSetRPM = new Set<Id>();
         if (Test.isRunningTest()) {
        for(Case c:newCases)
        {
            if ( (c.ClosedDate!=null && c.Case_Request__c =='Performance Review') && 
                (c.ClosedDate != oldCaseMap.get(c.Id).ClosedDate) )
            {
                caselist.add(c.Id);
                accIdSet.add(c.AccountId);
            }
            if ( (c.Case_Request__c =='Performance Review') && (c.ClosedDate != null  || (c.ClosedDate != oldCaseMap.get(c.Id).ClosedDate) ||
                                                                c.New_Stakeholder__c != oldCaseMap.get(c.Id).New_Stakeholder__c    || 
                                                                c.Is_the_Dealer_meeting_sales_objectives__c   != oldCaseMap.get(c.Id).Is_the_Dealer_meeting_sales_objectives__c   ||
                                                                c.Dealer_is_Satisfied_with_the_partnership__c != oldCaseMap.get(c.Id).Dealer_is_Satisfied_with_the_partnership__c || 
                                                                c.Decision_Maker_attended_Performance_call__c != oldCaseMap.get(c.Id).Decision_Maker_attended_Performance_call__c ||
                                                                c.third_Party_vendor_consistent_involvemen__c != oldCaseMap.get(c.Id).third_Party_vendor_consistent_involvemen__c ||
                                                                c.Is_this_client_at_risk_for_cancellation__c != oldCaseMap.get(c.Id).Is_this_client_at_risk_for_cancellation__c) )
            {
                caseListRPM.add(c.Id);
                accIdSetRPM.add(c.AccountId);
            }
        }
        if (!caseListRPM.isEmpty()) 
        {
            updateRPMScore(caseListRPM,accIdSetRPM);
        }
        if(!caselist.isEmpty()){
            calculateAvgDays(caselist,accIdSet);    
        }
        
    }
    
    }
    public static void calculateAvgDays(Set<Id> newCases,Set<Id> accIdSet)
    {
        map<ID,Integer> mapOfAccIdAndAvgDays = new map<ID,Integer>();
        map<ID,List<Case>> mapOfAccIdAndCaseList = new  map<ID,List<Case>>();
        
        List<case> allCaseList=[SELECT id,Close_Date__c,Case_Request__c ,AccountId,ClosedDate 
                                FROM Case 
                                WHERE ClosedDate!=null AND Case_Request__c ='Performance Review' 
                                AND AccountId != null AND AccountId IN:accIdSet ORDER BY ClosedDate  DESC];
        
        for(Case cs: allCaseList){
            if(mapOfAccIdAndCaseList.containsKey(cs.AccountId))
            {
                List<Case> caselst = mapOfAccIdAndCaseList.get(cs.AccountId);
                caselst.add(cs);
                mapOfAccIdAndCaseList.put(cs.AccountId, caselst);
            }
            else{
                mapOfAccIdAndCaseList.put(cs.AccountID, new List<Case> { cs });
            }
        }
        
        
        for(Case c: [Select Id, AccountID, Close_Date__c,ClosedDate from Case where ID IN: newCases])
        {
            List<case> caseListOfSameAcc= mapOfAccIdAndCaseList.get(c.AccountID);
            system.debug('caseListOfSameAcc '+ caseListOfSameAcc);
            Integer totalDaysBetweenPRClose = 0;
            Integer AvgDaysBetweenPRClose;
            
            for(Integer i=0 ; i<caseListOfSameAcc.size() - 1 ; i++)
            {
                totalDaysBetweenPRClose = totalDaysBetweenPRClose + (((caseListOfSameAcc[i+1].ClosedDate).date()).daysBetween((caseListOfSameAcc[i].ClosedDate).date()));
                //(caseListOfSameAcc[i].Close_Date__c - caseListOfSameAcc[i+1].Close_Date__c );
                system.debug('totalDaysBetweenPRClose ='+ totalDaysBetweenPRClose);
            }
            if(caseListOfSameAcc.size() >1){
                AvgDaysBetweenPRClose = totalDaysBetweenPRClose/(caseListOfSameAcc.size()-1);
            }
            else{
                AvgDaysBetweenPRClose = totalDaysBetweenPRClose;
            }
            system.debug('AvgDaysBetweenPRClose ='+ AvgDaysBetweenPRClose);
            mapOfAccIdAndAvgDays.put(c.AccountId, AvgDaysBetweenPRClose);
        }
        List<Id> mapKeys = new List<Id>(mapOfAccIdAndAvgDays.keySet());
        List<Account> accListToUpdate=[SELECT id FROM Account WHERE ID IN: mapKeys];
        for (Account acc: accListToUpdate)
        {
            acc.Average_Days_Between_PRs__c = mapOfAccIdAndAvgDays.get(acc.ID);
        }
        update accListToUpdate;  
    }
    
    
    public static void updateRPMScore(Set<Id> newCases,Set<Id> accIdSet){
        
        map<ID,Case> mapOfAccIdAndLatestCase = new  map<ID,Case>();
        List<Account> accListToUpdate = new List<Account>();
        
        List<case> allCaseList=[SELECT id,Close_Date__c,Case_Request__c ,AccountId,ClosedDate 
                                FROM Case 
                                WHERE ClosedDate!=null AND Case_Request__c ='Performance Review' 
                                AND AccountId != null AND AccountId IN:accIdSet ORDER BY ClosedDate DESC];
        
        for(Case cs: allCaseList){
            if(! mapOfAccIdAndLatestCase.containsKey(cs.AccountId))
            {
                mapOfAccIdAndLatestCase.put(cs.AccountID,cs);
            }
        }
        System.debug('mapOfAccIdAndLatestCase = '+ mapOfAccIdAndLatestCase);
        
        for(Case c: [Select Id,ClosedDate,Is_this_client_at_risk_for_cancellation__c, AccountId, Is_the_Dealer_meeting_sales_objectives__c, Dealer_is_Satisfied_with_the_partnership__c, New_Stakeholder__c, third_Party_vendor_consistent_involvemen__c, Decision_Maker_attended_Performance_call__c, Close_Date__c from Case where ID IN :newCases]){
            if(mapOfAccIdAndLatestCase.containsKey(c.AccountId)){
                
                System.debug('(mapOfAccIdAndLatestCase.get(c.AccountId)).ID = '+ (mapOfAccIdAndLatestCase.get(c.AccountId)).ID);
                if((mapOfAccIdAndLatestCase.get(c.AccountId)).ID == c.id)
                {
                    if(c.Is_this_client_at_risk_for_cancellation__c == 'Yes')
                    {
                        Integer CountDays = (Date.valueOf(c.ClosedDate)).daysBetween(system.today());
                        System.debug('CountDays = '+ CountDays);
                        Account a = new Account();
                        a.id = c.AccountId;
                        a.RPM_Assessment_Score__c = 0;
                        a.Days_Since_Last_PR_Closed__c = CountDays;
                        accListToUpdate.add(a);
                    }
                    else
                    {
                        Integer RPMScore,isDealer,Decision,third,newStack,Dealer; 
                        if(c.Is_the_Dealer_meeting_sales_objectives__c == 'Yes'){
                            isDealer = 20;
                        }
                        else if(c.Is_the_Dealer_meeting_sales_objectives__c == 'No'){
                            isDealer = 10;
                        }
                        else{
                            isDealer = 0;
                        }
                        
                        if(c.Dealer_is_Satisfied_with_the_partnership__c == 'Yes'){
                            Dealer = 20;
                        }
                        else if(c.Dealer_is_Satisfied_with_the_partnership__c == 'No'){
                            Dealer = 10;
                        }
                        else{
                            Dealer = 0;
                        }
                        
                        if(c.New_Stakeholder__c == 'Yes'){
                            newStack = 10;
                        }
                        else if(c.New_Stakeholder__c == 'No'){
                            newStack = 20;
                        }
                        else{
                            newStack = 0;
                        }
                        
                        if(c.third_Party_vendor_consistent_involvemen__c == 'Yes'){
                            third = 20;
                        }
                        else if(c.third_Party_vendor_consistent_involvemen__c == 'No'){
                            third = 10;
                        }
                        else{
                            third = 0;
                        }
                        
                        if(c.Decision_Maker_attended_Performance_call__c == 'Yes'){
                            Decision = 20;
                        }
                        else if(c.Decision_Maker_attended_Performance_call__c == 'No'){
                            Decision = 10;
                        }
                        else{
                            Decision = 0;
                        }
                        
                        RPMScore = isDealer + Decision + third + newStack + Dealer; 
                        Integer CountDays = (Date.valueOf(c.ClosedDate)).daysBetween(system.today());
                        System.debug('CountDays = '+ CountDays);
                        Account a = new Account();
                        a.id = c.AccountId;
                        a.RPM_Assessment_Score__c = RPMScore;
                        a.Days_Since_Last_PR_Closed__c = CountDays;
                        accListToUpdate.add(a);
                    }
                }
            }
        }
        update accListToUpdate;
    } 
    
     public static void onBeforeInsert(List<Case> listCases)
    {
        // Only Cases where Foundation_Record__c = TRUE or Case_Category__c = 'New Digital Support'
        // are routed. Foundation_Record__c is a formula checkbox - read directly instead of
        // looking up a record type Id, since the underlying record types can change over time.
        List<Case> filteredCases = new List<Case>();
        for(Case c : listCases) {
            // only Cases that are not assigned yet need routing
            if((c.Foundation_Record__c == true || c.Case_Category__c == FND_CATEGORY_NEW_DIGITAL_SUPPORT)
               && c.Case_Assign_To__c == null) {
                filteredCases.add(c);
            }
        }
        // Nothing to route -> skip all queries
        if (filteredCases.isEmpty()) {
            return;
        }
        // Fetch Metadata Configurations
        Map<String, Case_Routing_Config__mdt> caseRoutingConfigMap = getCaseRoutingConfigurations();
        
        Map<String, Account> mapAccounts = getAccountRecords(filteredCases, caseRoutingConfigMap);
        
    //  Map<String, List<String>> groupUserMap = getGroupUsers(new Set<String>{'Action', 'Analyze', 'Helpware'});
        Map<String, List<String>> groupUserMap = getGroupUsers(getRoutingQueueNames());
        
        // Hybrid round-robin pointer - seeded per queue only when that queue is actually used
        Map<String, Integer> queueNextIndexMap = new Map<String, Integer>();

    //  assignCases(filteredCases, caseRoutingConfigMap, groupUserMap, mapAccounts);
        assignCasesWithTVMLogic(filteredCases, caseRoutingConfigMap, groupUserMap, mapAccounts, queueNextIndexMap);
               system.debug('It runs on Before Insert');
    }
    
    // Seed next index per queue using last assigned among current active users
    private static Map<String, Integer> seedQueueNextIndexMap(Map<String, List<String>> groupUserMap) {
        Map<String, Integer> queueNextIndexMap = new Map<String, Integer>();
        
        for (String qName : groupUserMap.keySet()) {
            List<String> userIds = groupUserMap.get(qName);
            if (userIds == null || userIds.isEmpty()) {
                continue;
            }
            
            Integer startIndex = 0;
            
            if (userIds.size() == 1) {
                startIndex = 0;
            } else {
                // Find most recent Case assigned to any of the active members of this queue
                List<Case> lastAssigned = [ SELECT Case_Assign_To__c  FROM Case
                                           WHERE Case_Assign_To__c IN :userIds AND Case_Assignment_Queue__c = :qName  ORDER BY CreatedDate DESC  LIMIT 1 ];
                if (!lastAssigned.isEmpty() && lastAssigned[0].Case_Assign_To__c != null) {
                    String lastUser = lastAssigned[0].Case_Assign_To__c;
                    Integer idx = userIds.indexOf(lastUser);
                    startIndex = (idx != null && idx >= 0) ? idx + 1 : 0;
                } else {
                    startIndex = 0;
                }
                
                if (startIndex >= userIds.size()) {
                    startIndex = 0;
                }
            }
            
            queueNextIndexMap.put(qName, startIndex);
        }
        return queueNextIndexMap;
    }
    private static Map<String, Account> getAccountRecords(List<Case> listCases, Map<String, Case_Routing_Config__mdt> caseRoutingConfigMap) 
    {
        Set<String> setAccountFields = new Set<String>();
        
        For(Case_Routing_Config__mdt objCaseRoutingConfig : caseRoutingConfigMap.values())
        {
            If(objCaseRoutingConfig.Field_Name__c != null && !setAccountFields.contains(objCaseRoutingConfig.Field_Name__c))
            {
                setAccountFields.add(objCaseRoutingConfig.Field_Name__c);
            }
        }
        
        // QA_Field_Name__c can point to an Account field (e.g. Digital_Analyst_Lead__c) - query it too
        For(Case_Routing_Config__mdt qaConfig : [SELECT QA_Field_Name__c FROM Case_Routing_Config__mdt
                                                  WHERE Active__c = true AND QA_Field_Name__c != null])
        {
            String qaField = qaConfig.QA_Field_Name__c.trim();
            If(qaField != FND_MANAGER_TOKEN && ACCOUNT_FIELDS.containsKey(qaField.toLowerCase()))
            {
                setAccountFields.add(qaField);
            }
        }
        
        setAccountFields.add('FNDN_Billed_Through_TVM__c');
        Map<String, Account> mapAccounts = new Map<String, Account>();
        
        If(!setAccountFields.isEmpty()) 
        {
            Set<String> setAccountIds = new Set<String>();
            
            For(Case objCase : listCases)
            {
                If(objCase.AccountId != null)
                {
                    setAccountIds.add(objCase.AccountId);
                }
            }
            If(setAccountIds.isEmpty())
            {
                return mapAccounts;
            }
            
            // Convert Set to a comma-separated string
            String fieldsToQuery = String.join(new List<String>(setAccountFields), ', ');
            System.debug('fieldsToQuery : ' + fieldsToQuery);
            // Construct the dynamic SOQL query
            String soqlQuery = 'SELECT ' + fieldsToQuery + ' FROM Account WHERE Id IN : setAccountIds';
            
            System.debug('Dynamic SOQL Query: ' + soqlQuery);
            
            // Execute the query dynamically
            List<Account> listAccounts = Database.query(soqlQuery);
            
            For(Account objAccount : listAccounts)
            {
                mapAccounts.put(objAccount.Id, objAccount);
            }
            // Debug results
            System.debug('Fetched Accounts: ' + listAccounts);
        }
        return mapAccounts;
    }
   //testing 
  /*  private static Map<String, Case_Routing_Config__mdt> getCaseRoutingConfigurations() 
    {
        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>();
        
        for (Case_Routing_Config__mdt config : [ SELECT Id,Request_Type__c, Queue__c, QA_Queue__c, Case_Entry__c, 
                                                Initial_Assignment__c, After_QA_Assignment__c, Field_Name__c, 
                                                QA_Field_Name__c, Auto_QA_Assignment__c, Active__c,Case_Type__c
                                                FROM Case_Routing_Config__mdt
                                               ]) 
        {
            if (config.Request_Type__c != null) 
            {
                configMap.put(config.Request_Type__c, config);
            }
        }
        return configMap;
    }
*/private static Map<String, Case_Routing_Config__mdt> getCaseRoutingConfigurations() 
{
    Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>();
    
    for (Case_Routing_Config__mdt config : [
        SELECT Id, Request_Type__c, Queue__c, QA_Queue__c, Case_Entry__c,
               Initial_Assignment__c, After_QA_Assignment__c, Field_Name__c,
               QA_Field_Name__c, Auto_QA_Assignment__c, Active__c, Case_Type__c,
               Campaigns__c
        FROM Case_Routing_Config__mdt
        WHERE Active__c = true
        AND Case_Type__c = 'Non Hybrid'
    ]) 
    {
        configMap.put(config.Request_Type__c, config);
    }
    return configMap;
}
    
    // Queue members are cached for the transaction: flows that re-save the Case run this trigger
    // again, and re-querying every time uses up the 100 SOQL query limit
    private static Map<String, List<String>> cachedGroupUserMap;

    private static Map<String, List<String>> getGroupUsers(Set<String> groupNames) 
    {
        if (cachedGroupUserMap != null) {
            return cachedGroupUserMap;
        }
        Map<String, List<String>> groupUserMap = new Map<String, List<String>>();
        
        Set<Id> oooUserIds = new Map<Id, User>([SELECT Id FROM User WHERE OOO__c = true]).keySet();     
        // Fetch Group IDs
        Map<String, Id> groupIdMap = new Map<String, Id>();
        for (Group grp : [SELECT Id, Name FROM Group WHERE Name IN :groupNames AND Type = 'Queue']) 
        {
            groupIdMap.put(grp.Name, grp.Id);
        }
        
        // Fetch Users assigned to these groups
        Map<Id, List<String>> groupMembersMap = new Map<Id, List<String>>();
        
        for (GroupMember member : [SELECT GroupId, UserOrGroupId FROM GroupMember WHERE GroupId IN :groupIdMap.values() AND UserOrGroupId NOT IN :oooUserIds]) 
        {
            if (!groupMembersMap.containsKey(member.GroupId)) 
            {
                groupMembersMap.put(member.GroupId, new List<String>());
            }
            groupMembersMap.get(member.GroupId).add(member.UserOrGroupId);
        }
        
        // Map users back to group names
        for (String groupName : groupIdMap.keySet()) 
        {
            String groupId = groupIdMap.get(groupName);
            
            if (groupMembersMap.containsKey(groupId)) 
            {
                groupUserMap.put(groupName, groupMembersMap.get(groupId));
            }
        }
        
        cachedGroupUserMap = groupUserMap;
        return groupUserMap;
    }
    
    private static String getLastAssignedUser(List<String> userIds, String queueName)  {
        If(!userIds.isEmpty()) {
            List<Case> lastAssignedCase = [SELECT Case_Assign_To__c, Case_Assignment_Queue__c  FROM Case WHERE Case_Assign_To__c IN : userIds  AND Case_Assignment_Queue__c =: queueName   ORDER BY CreatedDate DESC Limit 1 ];
            return (!lastAssignedCase.isEmpty()) ? lastAssignedCase[0].Case_Assign_To__c : null;
        }
        return null;
    }
    
    public static void onBeforeUpdate(List<Case> listCases, Map<Id, Case> mapOldCases) 
{
    calculateCaseDueDate(listCases, mapOldCases);


    // ============================================================
    // NEW LOGIC:
    // Cases whose Case Category changed TO New Digital Support
    // ============================================================
    List<Case> newDigitalSupportCases = new List<Case>();

    for (Case c : listCases)
    {
        Case oldCase = mapOldCases.get(c.Id);

        if (
            oldCase != null &&
            oldCase.Case_Category__c != FND_CATEGORY_NEW_DIGITAL_SUPPORT &&
            c.Case_Category__c == FND_CATEGORY_NEW_DIGITAL_SUPPORT
        )
        {
            System.debug(
                'Case Category changed to New Digital Support. Case Id: ' + c.Id
            );

            // Clear previous routing so initial routing can run
            c.Case_Assign_To__c = null;
            c.Case_Assignment_Queue__c = null;

            newDigitalSupportCases.add(c);
        }
    }


    // ============================================================
    // NEW LOGIC:
    // Run INITIAL routing for Cases that just changed
    // to New Digital Support
    // ============================================================
    if (!newDigitalSupportCases.isEmpty())
    {
        Map<String, Case_Routing_Config__mdt> initialRoutingConfigMap =
            getCaseRoutingConfigurations();

        Map<String, Account> initialMapAccounts =
            getAccountRecords(
                newDigitalSupportCases,
                initialRoutingConfigMap
            );

        Map<String, List<String>> initialGroupUserMap =
            getGroupUsers(
                getRoutingQueueNames()
            );

        Map<String, Integer> initialQueueNextIndexMap =
            new Map<String, Integer>();


        assignCasesWithTVMLogic(
            newDigitalSupportCases,
            initialRoutingConfigMap,
            initialGroupUserMap,
            initialMapAccounts,
            initialQueueNextIndexMap
        );
    }


    // ============================================================
    // EXISTING READY FOR QA LOGIC
    // LEFT UNCHANGED
    // ============================================================
    List<Case> filteredCases = new List<Case>();

    for(Case c : listCases) 
    {
        Case oldCase = mapOldCases.get(c.Id);

        if(
            (c.Foundation_Record__c == true ||
             c.Case_Category__c == FND_CATEGORY_NEW_DIGITAL_SUPPORT) &&
            c.Status_Filtered__c == FND_STATUS_READY_FOR_QA &&
            oldCase != null &&
            oldCase.Status_Filtered__c != FND_STATUS_READY_FOR_QA
        )
        {  
            filteredCases.add(c);
        }
    }


    if (filteredCases.isEmpty())
    {
        return;
    }


    Map<String, Case_Routing_Config__mdt> caseRoutingConfigMap =
        getCaseRoutingConfigurations();        

    Map<String, Account> mapAccounts =
        getAccountRecords(
            filteredCases,
            caseRoutingConfigMap
        );     

    Map<String, List<String>> groupUserMap =
        getGroupUsers(
            getRoutingQueueNames()
        );

    Map<String, Integer> queueNextIndexMap =
        new Map<String, Integer>();


    assignBeforeUpdateCasesWithTVMLogic(
        filteredCases,
        caseRoutingConfigMap,
        groupUserMap,
        mapAccounts,
        mapOldCases,
        queueNextIndexMap
    );
}
   
  /*
  private static void assignBeforeUpdateCases( List<Case> listCases, Map<String, Case_Routing_Config__mdt> caseRoutingConfigMap,  Map<String, List<String>> groupUserMap,  Map<String, Account> mapAccounts,  Map<Id, Case> mapOldCases)
  {
    System.debug('listCases : ' + listCases);
    System.debug('caseRoutingConfigMap : ' + caseRoutingConfigMap);
    System.debug('groupUserMap : ' + groupUserMap);
    System.debug('mapAccounts : ' + mapAccounts);
    
    // Collect all user Ids to query for ManagerId
    Set<Id> userIdsToQuery = new Set<Id>();
    for (Case objCase : listCases) {
        if (objCase.Case_Assign_To__c != null) {
            userIdsToQuery.add(objCase.Case_Assign_To__c);
        }
    }
    Map<Id, User> userMap = new Map<Id, User>();
    if (!userIdsToQuery.isEmpty()) {
        userMap = new Map<Id, User>([SELECT Id, ManagerId FROM User WHERE Id IN :userIdsToQuery]);
    }
    
    for (Case objCase : listCases) {
        if (objCase.Status_Filtered__c != null && 
            objCase.Status_Filtered__c != mapOldCases.get(objCase.Id).Status_Filtered__c &&
            mapOldCases.get(objCase.Id).Status_Filtered__c != 'Ready for QA' &&
            objCase.Status_Filtered__c == 'Ready for QA' && 
            caseRoutingConfigMap.containsKey(objCase.Case_Request__c) && 
            caseRoutingConfigMap.get(objCase.Case_Request__c) != null &&
            caseRoutingConfigMap.get(objCase.Case_Request__c).Auto_QA_Assignment__c == true &&
            caseRoutingConfigMap.get(objCase.Case_Request__c).Active__c == true) {
            
            Case_Routing_Config__mdt config = caseRoutingConfigMap.get(objCase.Case_Request__c);
            
            // Queue assignment
            if (objCase.Case_Assignment_Queue__c != null && 
                config.QA_Queue__c != null && 
                groupUserMap.get(config.QA_Queue__c) != null && 
                config.After_QA_Assignment__c != null && 
                config.After_QA_Assignment__c == 'Queue') {
                
                List<String> userIds = groupUserMap.get(config.QA_Queue__c);
                Integer nextUserIndex = (getLastAssignedUserForUpdate(userIds, config.QA_Queue__c) != null)
                                        ? userIds.indexOf(getLastAssignedUserForUpdate(userIds, config.QA_Queue__c)) + 1
                                        : 0;
                if (nextUserIndex >= userIds.size()) nextUserIndex = 0;
                
                objCase.Case_Assign_To__c = userIds[nextUserIndex];
                objCase.OwnerId = objCase.Case_Assign_To__c;
                objCase.Case_Assignment_Queue__c = config.QA_Queue__c;
                
            // Field-based assignment
            } else if (config.QA_Queue__c == null && config.After_QA_Assignment__c != null && config.After_QA_Assignment__c == 'Field') {
                
                if (config.QA_Field_Name__c != null) {
                    // Special case: assign to manager
                    if (config.QA_Field_Name__c == 'Assignee_Manager__c') {
                        if (objCase.Case_Assign_To__c != null && userMap.containsKey(objCase.Case_Assign_To__c)) {
                            Id managerId = userMap.get(objCase.Case_Assign_To__c).ManagerId;
                            if (managerId != null) {
                                objCase.Case_Assign_To__c = managerId;
                                objCase.OwnerId = objCase.Case_Assign_To__c;
                                objCase.Case_Assignment_Queue__c = '';
                            }
                        }
                    } else {
                        if (objCase.get(String.valueOf(config.QA_Field_Name__c)) != null) {
                            objCase.Case_Assign_To__c = String.valueOf(objCase.get(config.QA_Field_Name__c));
                            objCase.OwnerId = objCase.Case_Assign_To__c;
                            objCase.Case_Assignment_Queue__c = '';
                        }
                    }
                }
            }
        }
    }
}
*/
   
    private static String getLastAssignedUserForUpdate(List<String> userIds, String queueName)  {
       If(!userIds.isEmpty()) {
            List<Case> lastAssignedCase = [SELECT Case_Assign_To__c, Case_Assignment_Queue__c FROM Case  WHERE Case_Assign_To__c IN : userIds AND Case_Assignment_Queue__c =: queueName ORDER BY LastModifiedDate DESC LIMIT 1];
            return (!lastAssignedCase.isEmpty()) ? lastAssignedCase[0].Case_Assign_To__c : null;
        }
        return null;
    }
     
    
    
  /*  private static void assignCasesWithTVMLogic(List<Case> listCases, Map<String, Case_Routing_Config__mdt> caseRoutingConfigMap, Map<String, List<String>> groupUserMap, Map<String, Account> mapAccounts, Map<String, Integer> queueNextIndexMap ) 
    {
        System.debug('listCases : ' + listCases);
        System.debug('caseRoutingConfigMap : ' + caseRoutingConfigMap);
        System.debug('groupUserMap : ' + groupUserMap);
        System.debug('mapAccounts : ' + mapAccounts);
        
     
        For (Case objCase : listCases) 
        {    
            Boolean isTVMBilled = false;
            If(caseRoutingConfigMap.containsKey(objCase.Case_Request__c) && caseRoutingConfigMap.get(objCase.Case_Request__c) != null){                    
                Case_Routing_Config__mdt config = caseRoutingConfigMap.get(objCase.Case_Request__c);
                If(config.Request_Type__c == objCase.Case_Request__c && config.Active__c == true)
                {
                    // Get the account's FNDN_Billed_Through_TVM__c field value
                    if (objCase.AccountId != null && mapAccounts.containsKey(objCase.AccountId)) {
                        Account account = mapAccounts.get(objCase.AccountId);
                        if (account.get('FNDN_Billed_Through_TVM__c') != null) {
                            isTVMBilled = (Boolean) account.get('FNDN_Billed_Through_TVM__c');
                        }
                    }
                }
            }
            // Apply different logic based on FNDN_Billed_Through_TVM__c value
            if (isTVMBilled == true) {
                if (groupUserMap.containsKey('Hybrid')) {
                    
                    Case_Routing_Config__mdt config = caseRoutingConfigMap.get(objCase.Case_Request__c);
                    System.debug(config.Case_Entry__c);
                    System.debug(config.Active__c);
                    If(config.Case_Entry__c != null && config.Case_Entry__c == 'Manual' &&  config.Active__c == true )
                    {
                        List<String> hybridUsers = groupUserMap.get('Hybrid');
                        if (!hybridUsers.isEmpty()) {
                            Integer nextUserIndex = queueNextIndexMap.containsKey('Hybrid') ? queueNextIndexMap.get('Hybrid') : 0;
                            if (nextUserIndex >= hybridUsers.size()) nextUserIndex = 0;
                            
                            objCase.Case_Assign_To__c = hybridUsers[nextUserIndex];
                            objCase.OwnerId = objCase.Case_Assign_To__c;
                            //objCase.Case_Assignment_Queue__c = 'Hybrid';
                             objCase.Case_Assignment_Queue__c = config.Queue__c;
                            
                            // advance pointer for this transaction
                            nextUserIndex++;
                            if (nextUserIndex >= hybridUsers.size()) nextUserIndex = 0;
                            queueNextIndexMap.put('Hybrid', nextUserIndex);
                        }
                    }
                    //else if(config.Case_Entry__c != null && config.Case_Entry__c == 'Auto' &&  config.Active__c == true){
                        //objCase.Case_Assignment_Queue__c = 'Hybrid';
                    //}
                    //Added by UT on 29-01-2026
                    //else if(config.Case_Entry__c != null && config.Case_Entry__c == 'Auto' &&  config.Active__c == true && config.Case_Type__c ==  'Hybrid' && config.Queue__c == 'Hybrid Weekly QA' ){
                        //objCase.Case_Assignment_Queue__c = 'Hybrid Weekly QA';
                    //}
                    //else if(config.Case_Entry__c != null && config.Case_Entry__c == 'Auto' &&  config.Active__c == true && config.Case_Type__c ==  'Hybrid' && config.Queue__c != 'Hybrid Weekly QA' ){
                        //objCase.Case_Assignment_Queue__c = 'Hybrid';
                    //}
                          If(config.Case_Entry__c != null && config.Case_Entry__c == 'Auto' &&  config.Active__c == true && config.Request_Type__c == objCase.Case_Request__c )
                            objCase.Case_Assignment_Queue__c = config.Queue__c;

                }
            }
            Else
            {
                System.debug('Runs for Non-Hybrid Accounts');
                
                // If FNDN_Billed_Through_TVM__c = false, use original assignment logic with metadata
                // Check if we have a configuration for this case type
                If(caseRoutingConfigMap.containsKey(objCase.Case_Request__c) && caseRoutingConfigMap.get(objCase.Case_Request__c) != null)
                {
                    System.debug(objCase.Case_Request__c);
                    Case_Routing_Config__mdt config = caseRoutingConfigMap.get(objCase.Case_Request__c);
                    System.debug(config.Case_Entry__c);
                    System.debug(config.Active__c);
                    If(config.Case_Entry__c != null &&  config.Case_Entry__c == 'Manual' &&  config.Active__c == true)
                    {
                        System.debug(config.Case_Entry__c);
                        If(config.Queue__c != null && groupUserMap.get(config.Queue__c) != null && config.Initial_Assignment__c != null && config.Initial_Assignment__c == 'Queue')
                        {
                            
                            List<String> userIds = groupUserMap.get(config.Queue__c);
                            System.debug('userIds : ' + userIds);
                            // Fetch Last Assigned Case for User Rotation
                            Integer nextUserIndex = (getLastAssignedUser(userIds, config.Queue__c) != null) ? userIds.indexOf(getLastAssignedUser(userIds, config.Queue__c)) + 1 : 0;
                            
                            If (nextUserIndex >= userIds.size()) 
                            {
                                nextUserIndex = 0;
                            }
                            
                            System.debug('nextUserIndex : ' + nextUserIndex);
                            
                            // Assign Case
                            objCase.Case_Assign_To__c = userIds[nextUserIndex];
                            objCase.OwnerId = objCase.Case_Assign_To__c;
                            objCase.Case_Assignment_Queue__c = config.Queue__c;
                            System.debug('Runs for Non-Hybrid Accounts 1');
                            System.debug(objCase.Case_Assignment_Queue__c);
                            System.debug(objCase.Case_Assign_To__c);
                        }
                        Else If(config.Queue__c == null && config.Initial_Assignment__c != null && config.Initial_Assignment__c == 'Field')
                        {
                            System.debug(config.Field_Name__c + ' : ######################### : ' + mapAccounts.get(objCase.AccountId));
                            If(objCase.AccountId != null && mapAccounts.containsKey(objCase.AccountId) && mapAccounts.get(objCase.AccountId) != null)
                            {
                                Account objAccount = mapAccounts.get(objCase.AccountId);
                                
                                If(objAccount.get(String.ValueOf(config.Field_Name__c)) != null)
                                {
                                    objCase.Case_Assign_To__c = String.ValueOf(objAccount.get(config.Field_Name__c));
                                    objCase.OwnerId = objCase.Case_Assign_To__c;
                                    objCase.Case_Assignment_Queue__c = '';
                                }
                                System.debug('Runs for Non-Hybrid Accounts 2');
                                System.debug(objCase.Case_Assignment_Queue__c);
                                System.debug(objCase.Case_Assign_To__c);
                                System.debug('objCase : ' + objCase);
                            }
                        }
                    }
                    Else If(config.Case_Entry__c != null && config.Case_Entry__c == 'Auto' && config.Active__c == true)
                    {
                        System.debug(config.Queue__c);
                        System.debug(config.Initial_Assignment__c);
                        
                        If(config.Queue__c != null && groupUserMap.get(config.Queue__c) != null && config.Initial_Assignment__c != null && config.Initial_Assignment__c == 'Queue')
                        {
                            objCase.Case_Assignment_Queue__c = config.Queue__c;
                        }
                        Else If(config.Queue__c == null && config.Initial_Assignment__c != null && config.Initial_Assignment__c == 'Field')
                        {
                            System.debug(config.Field_Name__c + ' : ######################### : ' + mapAccounts.get(objCase.AccountId));
                            If(objCase.AccountId != null && mapAccounts.containsKey(objCase.AccountId) && mapAccounts.get(objCase.AccountId) != null)
                            {
                                Account objAccount = mapAccounts.get(objCase.AccountId);
                                
                                If(objAccount.get(String.ValueOf(config.Field_Name__c)) != null)
                                {
                                    objCase.Case_Assign_To__c = String.ValueOf(objAccount.get(config.Field_Name__c));
                                    objCase.OwnerId = objCase.Case_Assign_To__c;
                                    objCase.Case_Assignment_Queue__c = '';
                                }
                                System.debug('objCase : ' + objCase);
                                System.debug('Runs for Non-Hybrid Accounts 3');
                                System.debug(objCase.Case_Assignment_Queue__c);
                                System.debug(objCase.Case_Assign_To__c);
                            }
                        }
                    }
                }
            }
        }
    }
  */  



  public static void assignCasesWithTVMLogic(
    List<Case> listCases,
    Map<String, Case_Routing_Config__mdt> caseRoutingConfigMap, // Non-Hybrid map
    Map<String, List<String>> groupUserMap,
    Map<String, Account> mapAccounts,
    Map<String, Integer> queueNextIndexMap
) {

    // Step 1: Build Hybrid metadata map
    Map<String, Case_Routing_Config__mdt> hybridCaseRoutingMap = new Map<String, Case_Routing_Config__mdt>();
    for (Case_Routing_Config__mdt mdt : [SELECT MasterLabel, Request_Type__c, Case_Type__c, Case_Entry__c, Queue__c, QA_Queue__c, Active__c,
                                          Initial_Assignment__c, Field_Name__c FROM Case_Routing_Config__mdt
                                          WHERE Active__c = true
                                          AND Case_Type__c = 'Hybrid']) {
        hybridCaseRoutingMap.put(mdt.Request_Type__c, mdt);
    }

    // Step 2: Loop through cases
    for (Case objCase : listCases) {

        // Only assign Cases that are not assigned yet
        if (objCase.Case_Assign_To__c != null) {
            continue;
        }

        // Skip if account missing
        if (objCase.AccountId == null || !mapAccounts.containsKey(objCase.AccountId)) {
            continue;
        }

        Account acc = mapAccounts.get(objCase.AccountId);
        Boolean isHybridAccount = acc.FNDN_Billed_Through_TVM__c == true;

        // Decide which metadata map to use
        Case_Routing_Config__mdt metaConfig;
        if (isHybridAccount) {
            metaConfig = hybridCaseRoutingMap.get(objCase.Case_Request__c);
        } else {
            metaConfig = caseRoutingConfigMap.get(objCase.Case_Request__c);
        }

        if (metaConfig == null || metaConfig.Active__c != true) {
            continue; // no config found
        }

        // =========================
        // HYBRID LOGIC
        // =========================
        if (isHybridAccount) {
            
            System.debug('Running HYBRID logic for case: ' + objCase.Subject);

            if (metaConfig.Case_Entry__c == 'Auto') {
                // Added by Sasi on 27-04-2026
                
                if (metaConfig.Initial_Assignment__c != null && metaConfig.Initial_Assignment__c == 'Queue' && metaConfig.Queue__c != null  ) {
                    objCase.Case_Assignment_Queue__c = metaConfig.Queue__c;
                    System.debug('Hybrid Auto Case Assigned to Queue: ' + metaConfig.Queue__c);
                }
                // Added by Sasi on 27-04-2026
                if (metaConfig.Initial_Assignment__c != null && metaConfig.Initial_Assignment__c == 'Field' && metaConfig.Queue__c == null) {
                    If(objCase.AccountId != null &&  mapAccounts.containsKey(objCase.AccountId) &&  mapAccounts.get(objCase.AccountId) != null) {
                        Account objAccount = mapAccounts.get(objCase.AccountId);
                        
                        If(objAccount.get(String.valueOf(metaConfig.Field_Name__c)) != null)
                        {
                            objCase.Case_Assign_To__c =   String.valueOf(objAccount.get(metaConfig.Field_Name__c));
                            objCase.OwnerId = objCase.Case_Assign_To__c;
                            objCase.Case_Assignment_Queue__c = '';
                        }
                    }
                }
                
            } else if (metaConfig.Case_Entry__c == 'Manual') {
                if (metaConfig.Queue__c != null && groupUserMap.containsKey(metaConfig.Queue__c)) {
                    List<String> users = groupUserMap.get(metaConfig.Queue__c);
                    if (users != null && !users.isEmpty()) {
                       if (!queueNextIndexMap.containsKey(metaConfig.Queue__c)) {
                            queueNextIndexMap.put(metaConfig.Queue__c, seedQueueIndex(users, metaConfig.Queue__c));
                        }
                        Integer idx = queueNextIndexMap.get(metaConfig.Queue__c);
                        if (idx >= users.size()) idx = 0;

                        objCase.Case_Assign_To__c = users[idx];
                        objCase.OwnerId = objCase.Case_Assign_To__c;
                        objCase.Case_Assignment_Queue__c = metaConfig.Queue__c;

                        idx++;
                        if (idx >= users.size()) idx = 0;
                        queueNextIndexMap.put(metaConfig.Queue__c, idx);

                        System.debug('Hybrid Manual Case Assigned to User: ' + objCase.Case_Assign_To__c
                                     + ' in Queue: ' + metaConfig.Queue__c);
                    }
                }
                // Added by Sasi on 27-04-2026
                if (metaConfig.Initial_Assignment__c != null && metaConfig.Initial_Assignment__c == 'Field' && metaConfig.Queue__c == null) {
                    If(objCase.AccountId != null &&  mapAccounts.containsKey(objCase.AccountId) &&  mapAccounts.get(objCase.AccountId) != null) {
                        Account objAccount = mapAccounts.get(objCase.AccountId);
                        
                        If(objAccount.get(String.valueOf(metaConfig.Field_Name__c)) != null)
                        {
                            objCase.Case_Assign_To__c =   String.valueOf(objAccount.get(metaConfig.Field_Name__c));
                            objCase.OwnerId = objCase.Case_Assign_To__c;
                            objCase.Case_Assignment_Queue__c = '';
                        }
                    }
                }
            }
            setManualInsertAssignedStatus(objCase, metaConfig);
            continue; // skip non-hybrid logic
        }
        /* =========================
           NON-HYBRID LOGIC
           (UNCHANGED)
           ========================= */
        else
        {
            System.debug('Runs for Non-Hybrid Accounts');

            // If FNDN_Billed_Through_TVM__c = false, use original assignment logic with metadata
            // EXACT SAME CODE – NO CHANGES
            If(caseRoutingConfigMap.containsKey(objCase.Case_Request__c) && 
               caseRoutingConfigMap.get(objCase.Case_Request__c) != null)
            {
                System.debug(objCase.Case_Request__c);
                Case_Routing_Config__mdt config = 
                    caseRoutingConfigMap.get(objCase.Case_Request__c);

                System.debug(config.Case_Entry__c);
                System.debug(config.Active__c);

                If(config.Case_Entry__c != null && 
                   config.Case_Entry__c == 'Manual' && 
                   config.Active__c == true)
                {
                    System.debug(config.Case_Entry__c);

                    If(config.Queue__c != null && 
                       groupUserMap.get(config.Queue__c) != null && 
                       config.Initial_Assignment__c != null && 
                       config.Initial_Assignment__c == 'Queue')
                    {
                        List<String> userIds = groupUserMap.get(config.Queue__c);
                        System.debug('userIds : ' + userIds);

                        String lastAssignedUser = getLastAssignedUser(userIds, config.Queue__c);
                        Integer nextUserIndex =
                            (lastAssignedUser != null)
                            ? userIds.indexOf(lastAssignedUser) + 1
                            : 0;

                        If (nextUserIndex >= userIds.size()) {
                            nextUserIndex = 0;
                        }

                        System.debug('nextUserIndex : ' + nextUserIndex);

                        objCase.Case_Assign_To__c = userIds[nextUserIndex];
                        objCase.OwnerId = objCase.Case_Assign_To__c;
                        objCase.Case_Assignment_Queue__c = config.Queue__c;

                        System.debug('Runs for Non-Hybrid Accounts 1');
                        System.debug(objCase.Case_Assignment_Queue__c);
                        System.debug(objCase.Case_Assign_To__c);
                    }
                    Else If(config.Queue__c == null && 
                            config.Initial_Assignment__c != null && 
                            config.Initial_Assignment__c == 'Field')
                    {
                        System.debug(config.Field_Name__c + 
                            ' : ######################### : ' + 
                            mapAccounts.get(objCase.AccountId));

                        If(objCase.AccountId != null && 
                           mapAccounts.containsKey(objCase.AccountId) && 
                           mapAccounts.get(objCase.AccountId) != null)
                        {
                            Account objAccount = mapAccounts.get(objCase.AccountId);

                            If(objAccount.get(String.valueOf(config.Field_Name__c)) != null)
                            {
                                objCase.Case_Assign_To__c =
                                    String.valueOf(objAccount.get(config.Field_Name__c));
                                objCase.OwnerId = objCase.Case_Assign_To__c;
                                objCase.Case_Assignment_Queue__c = '';
                            }

                            System.debug('Runs for Non-Hybrid Accounts 2');
                            System.debug(objCase.Case_Assignment_Queue__c);
                            System.debug(objCase.Case_Assign_To__c);
                            System.debug('objCase : ' + objCase);
                        }
                    }
                }
                Else If(config.Case_Entry__c != null && 
                        config.Case_Entry__c == 'Auto' && 
                        config.Active__c == true)
                {
                    System.debug(config.Queue__c);
                    System.debug(config.Initial_Assignment__c);

                    If(config.Queue__c != null && 
                       groupUserMap.get(config.Queue__c) != null && 
                       config.Initial_Assignment__c != null && 
                       config.Initial_Assignment__c == 'Queue')
                    {
                        objCase.Case_Assignment_Queue__c = config.Queue__c;
                    }
                    Else If(config.Queue__c == null && 
                            config.Initial_Assignment__c != null && 
                            config.Initial_Assignment__c == 'Field')
                    {
                        System.debug(config.Field_Name__c + 
                            ' : ######################### : ' + 
                            mapAccounts.get(objCase.AccountId));

                        If(objCase.AccountId != null && 
                           mapAccounts.containsKey(objCase.AccountId) && 
                           mapAccounts.get(objCase.AccountId) != null)
                        {
                            Account objAccount = mapAccounts.get(objCase.AccountId);

                            If(objAccount.get(String.valueOf(config.Field_Name__c)) != null)
                            {
                                objCase.Case_Assign_To__c =
                                    String.valueOf(objAccount.get(config.Field_Name__c));
                                objCase.OwnerId = objCase.Case_Assign_To__c;
                                objCase.Case_Assignment_Queue__c = '';
                            }

                            System.debug('objCase : ' + objCase);
                            System.debug('Runs for Non-Hybrid Accounts 3');
                            System.debug(objCase.Case_Assignment_Queue__c);
                            System.debug(objCase.Case_Assign_To__c);
                        }
                    }
                }
            }
            setManualInsertAssignedStatus(objCase, metaConfig);
        }
    }
}


    // NEW: Only during Before Insert, after successful Manual routing.
    // Does not affect Auto routing or existing Case updates.
    private static void setManualInsertAssignedStatus(Case objCase, Case_Routing_Config__mdt config) {
        if (
            objCase.Id == null &&
            config != null && config.Case_Entry__c == 'Manual' &&
            (objCase.Foundation_Record__c == true ||
             objCase.Case_Category__c == FND_CATEGORY_NEW_DIGITAL_SUPPORT) &&
            objCase.Future_Case__c != true &&
            (objCase.Digital_Execution_Start_Date__c == null ||
             objCase.Digital_Execution_Start_Date__c <= Date.today()) &&
            (objCase.Status_Filtered__c == null || objCase.Status_Filtered__c == 'New') &&
            objCase.Case_Assign_To__c != null &&
            objCase.OwnerId == objCase.Case_Assign_To__c
        ) {
            objCase.Status_Filtered__c = 'Assigned';
        }
    }

     public Static void dummy(){
        Integer i= 0;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
        i++;
     }
 /*   private static void assignBeforeUpdateCasesWithTVMLogic(List<Case> listCases, Map<String, Case_Routing_Config__mdt> caseRoutingConfigMap, Map<String, List<String>> groupUserMap, Map<String, Account> mapAccounts, Map<Id, Case> mapOldCases, Map<String, Integer> queueNextIndexMap )
    {
        System.debug('listCases : ' + listCases);
        System.debug('caseRoutingConfigMap : ' + caseRoutingConfigMap);
        System.debug('groupUserMap : ' + groupUserMap);
        System.debug('mapAccounts : ' + mapAccounts);
        
        // Collect all user Ids to query for ManagerId
        Set<Id> userIdsToQuery = new Set<Id>();
        for (Case objCase : listCases) {
            if (objCase.Case_Assign_To__c != null) {
                userIdsToQuery.add(objCase.Case_Assign_To__c);
            }
        }
        
        Map<Id, User> userMap = new Map<Id, User>();
        if (!userIdsToQuery.isEmpty()) {
            userMap = new Map<Id, User>([SELECT Id, ManagerId FROM User WHERE Id IN :userIdsToQuery]);
        }
   

        For (Case objCase : listCases) 
        {   
            Boolean isTVMBilled = false;
            If(caseRoutingConfigMap.containsKey(objCase.Case_Request__c) && caseRoutingConfigMap.get(objCase.Case_Request__c) != null){                    
                Case_Routing_Config__mdt config = caseRoutingConfigMap.get(objCase.Case_Request__c);
                If(config.Request_Type__c == objCase.Case_Request__c && config.Active__c == true)
                {
                    // Get the account's FNDN_Billed_Through_TVM__c field value
                    if (objCase.AccountId != null && mapAccounts.containsKey(objCase.AccountId)) {
                        Account account = mapAccounts.get(objCase.AccountId);
                        if (account.get('FNDN_Billed_Through_TVM__c') != null) {
                            isTVMBilled = (Boolean) account.get('FNDN_Billed_Through_TVM__c');
                        }
                    }
                }
            }
            // Apply different logic based on FNDN_Billed_Through_TVM__c value
            if (isTVMBilled == true) {
                
               
                // Assign to Hybrid if not already assigned, advancing pointer
                if (groupUserMap.get('Hybrid') != null && !groupUserMap.get('Hybrid').isEmpty() && objCase.Case_Assign_To__c == null) {
                    List<String> hybridUsers = groupUserMap.get('Hybrid');
                    Integer nextUserIndex = queueNextIndexMap.containsKey('Hybrid') ? queueNextIndexMap.get('Hybrid') : 0;
                    if (nextUserIndex >= hybridUsers.size()) nextUserIndex = 0;
                    
                    objCase.Case_Assign_To__c = hybridUsers[nextUserIndex];
                    objCase.OwnerId = objCase.Case_Assign_To__c;
                    objCase.Case_Assignment_Queue__c = 'Hybrid';
                    
                    nextUserIndex++;
                    if (nextUserIndex >= hybridUsers.size()) nextUserIndex = 0;
                    queueNextIndexMap.put('Hybrid', nextUserIndex);
                }
            }
            Else
            {
                // If FNDN_Billed_Through_TVM__c = false, use the same logic as assignBeforeUpdateCases
                If(objCase.Status_Filtered__c != null && 
                   objCase.Status_Filtered__c != mapOldCases.get(objCase.Id).Status_Filtered__c && 
                   mapOldCases.get(objCase.Id).Status_Filtered__c != 'Ready for QA' &&
                   objCase.Status_Filtered__c == 'Ready for QA' && 
                   caseRoutingConfigMap.containsKey(objCase.Case_Request__c) && 
                   caseRoutingConfigMap.get(objCase.Case_Request__c) != null &&
                   caseRoutingConfigMap.get(objCase.Case_Request__c).Auto_QA_Assignment__c == true &&
                   caseRoutingConfigMap.get(objCase.Case_Request__c).Active__c == true
                  ){
                    Case_Routing_Config__mdt config = caseRoutingConfigMap.get(objCase.Case_Request__c);
                    
                    System.debug('QA Queue : ' + config.QA_Queue__c);
                    System.debug('-------> : ' + groupUserMap.get(config.QA_Queue__c));
                    System.debug('=======> : ' + config.After_QA_Assignment__c);
                    
                    // Queue assignment
                    If(objCase.Case_Assignment_Queue__c != null && 
                       config.QA_Queue__c != null && 
                       groupUserMap.get(config.QA_Queue__c) != null && 
                       config.After_QA_Assignment__c != null && 
                       config.After_QA_Assignment__c == 'Queue'
                      )
                    {
                        List<String> userIds = groupUserMap.get(config.QA_Queue__c);
                        System.debug('userIds : ' + userIds);
                        
                        Integer nextUserIndex = (getLastAssignedUserForUpdate(userIds, config.QA_Queue__c) != null) ? userIds.indexOf(getLastAssignedUserForUpdate(userIds, config.QA_Queue__c)) + 1 : 0;
                        
                        If (nextUserIndex >= userIds.size()) 
                        {
                            nextUserIndex = 0;
                        }
                        
                        System.debug('nextUserIndex : ' + nextUserIndex);
                        
                        // Assign Case
                        objCase.Case_Assign_To__c = userIds[nextUserIndex];
                        objCase.OwnerId = objCase.Case_Assign_To__c;
                        objCase.Case_Assignment_Queue__c = config.QA_Queue__c;
                    }
                    // Field-based assignment
                    Else If(config.QA_Queue__c == null && config.After_QA_Assignment__c != null && config.After_QA_Assignment__c == 'Field')
                    {
                        System.debug(config.QA_Field_Name__c + ' : ######################### : ' + mapAccounts.get(objCase.AccountId));
                        
                        If(config.QA_Field_Name__c != null) {
                            // Special case: assign to manager
                            If(config.QA_Field_Name__c == 'Assignee_Manager__c') {
                                If(objCase.Case_Assign_To__c != null && userMap.containsKey(objCase.Case_Assign_To__c)) {
                                    Id managerId = userMap.get(objCase.Case_Assign_To__c).ManagerId;
                                    If(managerId != null) {
                                        objCase.Case_Assign_To__c = managerId;
                                        objCase.OwnerId = objCase.Case_Assign_To__c;
                                        objCase.Case_Assignment_Queue__c = '';
                                    }
                                }
                            } Else {
                                If(objCase.get(String.valueOf(config.QA_Field_Name__c)) != null) {
                                    objCase.Case_Assign_To__c = String.valueOf(objCase.get(config.QA_Field_Name__c));
                                    objCase.OwnerId = objCase.Case_Assign_To__c;
                                    objCase.Case_Assignment_Queue__c = '';
                                }
                            }
                        }
                    }
                }
            }
        }
    }
 */
public static void assignBeforeUpdateCasesWithTVMLogic( 
    List<Case> listCases,
    Map<String, Case_Routing_Config__mdt> caseRoutingConfigMap, // Non-Hybrid map
    Map<String, List<String>> groupUserMap,
    Map<String, Account> mapAccounts,
    Map<Id, Case> mapOldCases,
    Map<String, Integer> queueNextIndexMap
) {
    System.debug('listCases : ' + listCases);
    System.debug('groupUserMap : ' + groupUserMap);
    System.debug('mapAccounts : ' + mapAccounts);

    /* ================================
       QUERY HYBRID METADATA
       ================================ */
    Map<String, Case_Routing_Config__mdt> hybridCaseRoutingMap = new Map<String, Case_Routing_Config__mdt>();
    for (Case_Routing_Config__mdt mdt : [
        SELECT MasterLabel,
               Request_Type__c,
               Case_Type__c,
               Case_Entry__c,
               Queue__c,
               QA_Queue__c,
               Active__c,
               Initial_Assignment__c,
               Field_Name__c,
               QA_Field_Name__c,
               Campaigns__c,
               Auto_QA_Assignment__c,
               After_QA_Assignment__c
        FROM Case_Routing_Config__mdt
        WHERE Active__c = true
        AND Case_Type__c = 'Hybrid'
    ]) {
        hybridCaseRoutingMap.put(mdt.Request_Type__c, mdt);
    }

    /* ================================
       USER → MANAGER LOOKUP (UNCHANGED)
       ================================ */
    Set<Id> userIdsToQuery = new Set<Id>();
    for (Case objCase : listCases) {
        if (objCase.Case_Assign_To__c != null) {
            userIdsToQuery.add(objCase.Case_Assign_To__c);
        }
    }

    Map<Id, User> userMap = new Map<Id, User>();
    if (!userIdsToQuery.isEmpty()) {
        userMap = new Map<Id, User>([SELECT Id, ManagerId FROM User WHERE Id IN :userIdsToQuery]);
    }

    /* ================================
       MAIN LOOP
       ================================ */
    for (Case objCase : listCases) {

        // Skip if account missing
        Account acc = (objCase.AccountId != null && mapAccounts.containsKey(objCase.AccountId))
                      ? mapAccounts.get(objCase.AccountId)
                      : null;

        Boolean isHybridAccount = (acc != null && acc.FNDN_Billed_Through_TVM__c == true);

        // Decide which metadata map to use
        Case_Routing_Config__mdt metaConfig;
        if (isHybridAccount) {
            metaConfig = hybridCaseRoutingMap.get(objCase.Case_Request__c);
        } else {
            metaConfig = caseRoutingConfigMap.get(objCase.Case_Request__c);
      
        
        }

        if (metaConfig == null || metaConfig.Active__c != true) {
            continue; // no config found
        }

        // =========================
        // CAMPAIGNS QA RULE
        // Status_Filtered__c changed to Ready for QA
        // + Case_Request__c is Live Client - New Product Launch / New Campaign Request
        // + Get_Me_More_Campaigns__c or Client_Requested_Campaigns__c is filled in
        // + Campaigns__c is checked on the routing metadata
        //   -> Case_Assign_To__c and OwnerId = user from the QA_Field_Name__c field.
        // Applies to Hybrid and Non-Hybrid; skips the standard QA reassignment below.
        // =========================
        Case oldCaseForQA = mapOldCases.get(objCase.Id);
        if (oldCaseForQA != null &&
            objCase.Status_Filtered__c == FND_STATUS_READY_FOR_QA &&
            oldCaseForQA.Status_Filtered__c != FND_STATUS_READY_FOR_QA &&
            FND_REQ_CAMPAIGN_QA.contains(objCase.Case_Request__c) &&
            metaConfig.Campaigns__c == true &&
            fndHasCampaigns(objCase))
        {
            Id qaUserId = fndResolveQaUser(objCase, metaConfig.QA_Field_Name__c, userMap, mapAccounts);
            if (qaUserId != null) {
                objCase.Case_Assign_To__c = qaUserId;
                objCase.OwnerId = objCase.Case_Assign_To__c;
                objCase.Case_Assignment_Queue__c = null;
                continue;
            }
        }

        // =========================
        // HYBRID LOGIC
        // =========================
        if (isHybridAccount) {
            /*
            System.debug('Running HYBRID logic for case: ' + objCase.Subject);

            if (metaConfig.Case_Entry__c == 'Auto') {
                objCase.Case_Assignment_Queue__c = metaConfig.Queue__c;
                System.debug('Hybrid Auto Case Assigned to Queue: ' + metaConfig.Queue__c);
            } else if (metaConfig.Case_Entry__c == 'Manual') {
                if (metaConfig.Queue__c != null && groupUserMap.containsKey(metaConfig.Queue__c)) {
                    List<String> users = groupUserMap.get(metaConfig.Queue__c);
                    if (users != null && !users.isEmpty()) {
                        Integer idx = queueNextIndexMap.containsKey(metaConfig.Queue__c)
                            ? queueNextIndexMap.get(metaConfig.Queue__c)
                            : 0;
                        if (idx >= users.size()) idx = 0;

                        objCase.Case_Assign_To__c = users[idx];
                        objCase.OwnerId = objCase.Case_Assign_To__c;
                        objCase.Case_Assignment_Queue__c = metaConfig.Queue__c;

                        idx++;
                        if (idx >= users.size()) idx = 0;
                        queueNextIndexMap.put(metaConfig.Queue__c, idx);

                        System.debug('Hybrid Manual Case Assigned to User: ' + objCase.Case_Assign_To__c
                                     + ' in Queue: ' + metaConfig.Queue__c);
                    }
                }
            }
            setManualInsertAssignedStatus(objCase, metaConfig);
            continue; // skip non-hybrid logic
		*/
        }
        /* ==================================================
           STANDARD READY FOR QA REASSIGNMENT
           Runs for Hybrid AND Non-Hybrid Accounts, using the matching routing rule
           (Hybrid rule for Hybrid Accounts, Non Hybrid rule otherwise).
           ================================================== */
        if (metaConfig != null)
        {
            If(objCase.Status_Filtered__c != null &&
               objCase.Status_Filtered__c != mapOldCases.get(objCase.Id).Status_Filtered__c &&
               mapOldCases.get(objCase.Id).Status_Filtered__c != 'Ready for QA' &&
               objCase.Status_Filtered__c == 'Ready for QA' &&
               metaConfig.Auto_QA_Assignment__c == true &&
               metaConfig.Active__c == true &&
               !FND_REQ_CAMPAIGN_QA.contains(objCase.Case_Request__c)
              )
            {
                Case_Routing_Config__mdt config = metaConfig;

                System.debug('QA Queue : ' + config.QA_Queue__c);
                System.debug('-------> : ' + groupUserMap.get(config.QA_Queue__c));
                System.debug('=======> : ' + config.After_QA_Assignment__c);

                // Queue assignment
                If(objCase.Case_Assignment_Queue__c != null &&
                   config.QA_Queue__c != null &&
                   groupUserMap.get(config.QA_Queue__c) != null &&
                   config.After_QA_Assignment__c != null &&
                   config.After_QA_Assignment__c == 'Queue'
                  )
                {
                    List<String> userIds = groupUserMap.get(config.QA_Queue__c);
                    System.debug('userIds : ' + userIds);

                    String lastQaUser = getLastAssignedUserForUpdate(userIds, config.QA_Queue__c);
                    Integer nextUserIndex =
                        (lastQaUser != null)
                        ? userIds.indexOf(lastQaUser) + 1
                        : 0;

                    if (nextUserIndex >= userIds.size()) {
                        nextUserIndex = 0;
                    }

                    objCase.Case_Assign_To__c = userIds[nextUserIndex];
                    objCase.OwnerId = objCase.Case_Assign_To__c;
                    objCase.Case_Assignment_Queue__c = config.QA_Queue__c;
                }
                // Field-based assignment
                Else If(config.QA_Queue__c == null &&
                        config.After_QA_Assignment__c != null &&
                        config.After_QA_Assignment__c == 'Field')
                {
                    if (config.QA_Field_Name__c != null) {

                        // Assign to Manager
                        if (config.QA_Field_Name__c == 'Assignee_Manager__c') {
                            if (objCase.Case_Assign_To__c != null &&
                                userMap.containsKey(objCase.Case_Assign_To__c))
                            {
                                Id managerId =
                                    userMap.get(objCase.Case_Assign_To__c).ManagerId;
                                if (managerId != null) {
                                    objCase.Case_Assign_To__c = managerId;
                                    objCase.OwnerId = objCase.Case_Assign_To__c;
                                    objCase.Case_Assignment_Queue__c = '';
                                }
                            }
                        }
                        else {
                            Object qaValue = getQaFieldValue(objCase, config.QA_Field_Name__c, mapAccounts);
                            if (qaValue != null) {
                                objCase.Case_Assign_To__c =
                                    String.valueOf(qaValue);
                                objCase.OwnerId = objCase.Case_Assign_To__c;
                                objCase.Case_Assignment_Queue__c = '';
                            }
                        }
                    }
                }
            }
        }
    }
}


    // ------------------------------ CAMPAIGNS QA HELPERS ---------------------------------
    // True when a Get Me More or Client Requested campaign is selected on the Case
    private static Boolean fndHasCampaigns(Case c)
    {
        return String.isNotBlank(c.Client_Requested_Campaigns__c) ||
               String.isNotBlank(c.Get_Me_More_Campaigns__c);
    }

    // Returns the User Id from the field named in QA_Field_Name__c (Case or Account field),
    // or the manager of the current assignee when QA_Field_Name__c = 'Assignee_Manager__c'.
    // Returns null if no valid user is found.
    private static Id fndResolveQaUser(Case c, String qaFieldName, Map<Id, User> userMap, Map<String, Account> mapAccounts)
    {
        if (String.isBlank(qaFieldName)) return null;

        if (qaFieldName.trim() == FND_MANAGER_TOKEN) {
            Id assignee = (c.Case_Assign_To__c != null) ? c.Case_Assign_To__c : c.OwnerId;
            return (assignee != null && userMap.containsKey(assignee)) ? userMap.get(assignee).ManagerId : null;
        }

        try {
            Object val = getQaFieldValue(c, qaFieldName, mapAccounts);
            if (val == null) return null;
            Id userId = Id.valueOf(String.valueOf(val));
            return (userId.getSObjectType() == User.SObjectType) ? userId : null;
        } catch (Exception e) {
            System.debug(LoggingLevel.WARN, 'Invalid QA_Field_Name__c "' + qaFieldName + '": ' + e.getMessage());
            return null;
        }
    }

    // ------------------------------ QA FIELD LOOKUP --------------------------------------
    // Returns the value of the field named in QA_Field_Name__c.
    // Looks on the Case first. If it is not a Case field (e.g. Digital_Analyst_Lead__c), or the
    // Case field is empty (e.g. Secondary_Account_Technician__c exists on both objects), looks on
    // the Case's Account. Returns null instead of throwing "Invalid field ... for Case"
    // when the field isn't on either object.
    private static Object getQaFieldValue(Case c, String fieldName, Map<String, Account> mapAccounts)
    {
        if (String.isBlank(fieldName)) return null;
        String apiName = fieldName.trim();
        String key = apiName.toLowerCase();

        if (CASE_FIELDS.containsKey(key)) {
            Object caseValue = c.get(apiName);
            if (caseValue != null) {
                return caseValue;
            }
        }
        if (ACCOUNT_FIELDS.containsKey(key) && c.AccountId != null
            && mapAccounts != null && mapAccounts.containsKey(c.AccountId)) {
            try {
                return mapAccounts.get(c.AccountId).get(apiName);
            } catch (SObjectException e) {
                System.debug(LoggingLevel.WARN, 'Account field not queried: ' + apiName);
                return null;
            }
        }
        System.debug(LoggingLevel.WARN, 'QA_Field_Name__c "' + apiName + '" is not a Case or Account field');
        return null;
    }

    // ------------------------------ QUEUES USED BY ROUTING -------------------------------
    // Queue names (labels) to load members for: the standard queues plus every Queue__c and
    // QA_Queue__c in the active routing rules, so new queues (e.g. Digital Analyst) work automatically.
    private static Set<String> getRoutingQueueNames()
    {
        Set<String> queueNames = new Set<String>{'Action', 'Analyze', 'Helpware', 'Hybrid', 'Hybrid Weekly QA', 'Digital Analyst', 'Helpware/Qualminds', 'Digital Coop', 'Digital Build/Launch', 'Training'};
        for (Case_Routing_Config__mdt cfg : [SELECT Queue__c, QA_Queue__c FROM Case_Routing_Config__mdt WHERE Active__c = true]) {
            if (String.isNotBlank(cfg.Queue__c))    queueNames.add(cfg.Queue__c.trim());
            if (String.isNotBlank(cfg.QA_Queue__c)) queueNames.add(cfg.QA_Queue__c.trim());
        }
        return queueNames;
    }

    // Next round-robin position for one queue: the member after the most recently assigned one
    private static Integer seedQueueIndex(List<String> userIds, String qName)
    {
        if (userIds == null || userIds.size() <= 1) {
            return 0;
        }
        List<Case> lastAssigned = [SELECT Case_Assign_To__c FROM Case
                                   WHERE Case_Assign_To__c IN :userIds AND Case_Assignment_Queue__c = :qName
                                   ORDER BY CreatedDate DESC LIMIT 1];
        if (!lastAssigned.isEmpty() && lastAssigned[0].Case_Assign_To__c != null) {
            Integer i = userIds.indexOf(lastAssigned[0].Case_Assign_To__c);
            Integer startIndex = (i != null && i >= 0) ? i + 1 : 0;
            return (startIndex >= userIds.size()) ? 0 : startIndex;
        }
        return 0;
    }
}
```

## History

| Date | Change |
|---|---|
| 2026-10-12 | Documented from the org version of that date. |
| 2026-10-15 | Org version of 2026-10-15 (2026-10-15 06:03 UTC, Sandip Patel). New method `setManualInsertAssignedStatus` (line 1380), called after Manual routing in `assignCasesWithTVMLogic`: line 1242 (Hybrid) and line 1372 (Non-Hybrid). A third call at line 1875 is inside commented-out code and does not run. It sets `Status_Filtered__c = 'Assigned'` at **insert** when **all** of these hold: Case Entry = Manual; Foundation or New Digital Support; `Future_Case__c` not true; start date empty or not in the future; status empty or `New`; a user is assigned and Owner = Case Assign To. Auto routing and updates are not affected. See [REQ_003](../../03%20-%20Requirements/REQ_003_2026-10-14%20-%20Assignment%20Batches%20-%20Pick%20New%20Cases%20and%20Set%20Status%20to%20Assigned.md) for the Auto side. |
