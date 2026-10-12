# Apex Class: SLARemainingTimeSendEmailBatch

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `SLARemainingTimeSendEmailBatch` |
| Type | Apex Class |
| API Version | 63.0 |
| Status | Active |
| Lines | 28 |

## Related Components

- Test classes: [SLARemainingTimeSendEmailBatchTest](SLARemainingTimeSendEmailBatchTest.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 4 | `String query = 'SELECT Id, Status_Filtered__c, Remaining_Hours__c,OwnerId,SLA_Time_fe__c,Account.Regional_performance_manager__c, Mail_Sent__c FROM Case where Foundation_Record__c = True OR Case_Category__c = \'New Digit` |

## Source

```apex
//Apex from FND 
global class SLARemainingTimeSendEmailBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Status_Filtered__c, Remaining_Hours__c,OwnerId,SLA_Time_fe__c,Account.Regional_performance_manager__c, Mail_Sent__c FROM Case where Foundation_Record__c = True OR Case_Category__c = \'New Digital Support\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Case> caseList) {
        List<Case> lstcase =  New List<Case>();
        for(Case cs : caseList) {
            if((cs.Remaining_Hours__c == 0 && cs.Mail_Sent__c != true && cs.Status_Filtered__c != 'Future' && cs.Status_Filtered__c != 'Closed') &&
              (cs.SLA_Time_fe__c != 0 && cs.SLA_Time_fe__c != NULL)){
               cs.Mail_Sent__c = true; 
            }
            lstcase.add(cs);
        }
        try {
            update lstcase;
            
        } catch(Exception e) {
            System.debug(e);
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
    }
}
```
