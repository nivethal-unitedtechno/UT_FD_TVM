# Apex Class: CaseStatusUpdateBatch

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `CaseStatusUpdateBatch` |
| Type | Apex Class |
| API Version | 63.0 |
| Status | Active |
| Lines | 131 |

## Related Components

- Test classes: [Test_CaseStatusUpdateBatch](Test_CaseStatusUpdateBatch.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 16 | `'AND (Foundation_Record__c = TRUE OR Case_Category__c = \'New Digital Support\')';` |
| 28 | `'AND (Foundation_Record__c = TRUE OR Case_Category__c = \'New Digital Support\')';` |

## Source

```apex
//Apex from FND 
public class CaseStatusUpdateBatch implements Database.Batchable<sObject> 
{
    public Database.QueryLocator start(Database.BatchableContext context) 
    {
        String query = '';

        If(Test.isRunningTest())
        {
            Date today1 = Date.newInstance(2025, 10, 03); 

            query = 'SELECT Id,Case_Request__c,Future_Case__c,Status_Filtered__c,' +
                    'Digital_Execution_Start_Date__c,SLA_Time__c,Start_Date_Time__c,Due_Date__c ' +
                    'FROM Case ' +
                    'WHERE Digital_Execution_Start_Date__c =: today1 ' +
                    'AND (Foundation_Record__c = TRUE OR Case_Category__c = \'New Digital Support\')'; 
        }
        Else
        {
            Date today = Date.today();
            String futureStatus = 'Future';

            query = 'SELECT Id,Status_Filtered__c,Case_Request__c,Future_Case__c,' +
                    'Digital_Execution_Start_Date__c,SLA_Time__c,Start_Date_Time__c,Due_Date__c ' +
                    'FROM Case ' +
                    'WHERE Digital_Execution_Start_Date__c =: today ' +
                    'AND Status_Filtered__c =: futureStatus ' +
                    'AND (Foundation_Record__c = TRUE OR Case_Category__c = \'New Digital Support\')'; 
        }

        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext context, List<Case> scope)
    {
        List<Case> updateList = new List<Case>();

        for (Case c : scope) 
        {
            c.Status_Filtered__c = 'Assigned';
            c.Future_Case__c = true;

            If(c.Case_Request__c == 'Future Campaign Build - Get Me More')
            {
                c.Case_Request__c = 'Campaign Build - Get Me More';   
            }
            Else If(c.Case_Request__c == 'Future Campaign Build - Client Requested')
            {
                c.Case_Request__c = 'Campaign Build - Client Requested';   
            }
            Else If(c.Case_Request__c == 'Future Campaign Build - Standard')
            {
                c.Case_Request__c = 'Campaign Build - Standard';   
            }
            Else If(c.Case_Request__c == 'Future Budget Change')
            {
                c.Case_Request__c = 'Budget Change';   
            }

            if (c.SLA_Time__c != null) 
            {
                system.debug('---- In first if  ---');

                // Calculate the new due date based on the start date/time and SLA time
                Integer slaTime = Integer.valueOf(c.SLA_Time__c);
                system.debug(' slaTime  ---' + slaTime);

                DateTime createdDateTime = c.Start_Date_Time__c;
                system.debug(' createdDateTime  ---' + createdDateTime);

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
                c.Due_Date__c = dueDate;
            }

            updateList.add(c);
        }

        if (!updateList.isEmpty())
        {
            update updateList;
        }
    }
    
    // Check if the given datetime falls within business hours
    public static Boolean isBusinessHour(DateTime dt) 
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
    
    public void finish(Database.BatchableContext context)
    {
        System.debug('Batch job finished.');
    }

    public class CaseStatusUpdateBatchException extends Exception {}
}
```
