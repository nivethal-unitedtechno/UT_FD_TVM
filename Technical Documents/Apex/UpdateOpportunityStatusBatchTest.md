# Apex Test Class: UpdateOpportunityStatusBatchTest

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `UpdateOpportunityStatusBatchTest` |
| Type | Apex Test Class |
| API Version | 63.0 |
| Status | Active |
| Lines | 144 |

## Related Components

Tests: [UpdateOpportunityStatusBatch](UpdateOpportunityStatusBatch.md)

## Foundation Record / New Digital Support References

_No direct references; included as the test class for the components above._

## Source

```apex
@IsTest
public class UpdateOpportunityStatusBatchTest {
    private static String uniqueSuffix() {
        return String.valueOf(Math.abs(Crypto.getRandomInteger()));
    }
    
    @istest(SeeAllData=true)
    static void setupTestData() {
        Auto_Group__c caseQueue = new Auto_Group__c(
            Name = 'Action', // any unique name
            Quickbase_Record_ID__c =  'QB-' + System.currentTimeMillis()
            
        );
        insert caseQueue;
        Auto_Group__c caseQueue1 = new Auto_Group__c(
            Name = 'Action', // any unique name
            Quickbase_Record_ID__c =  'DB-' + System.currentTimeMillis()
            
        );
        insert caseQueue1;
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        //Auto_Group__c caseQueue = [select id from caseQueue limit 1];
        
        RecordType accRT = [SELECT Id FROM RecordType WHERE SObjectType = 'Account' AND DeveloperName = 'Foundation_Dealership' LIMIT 1];
        RecordType oppRT = [SELECT Id FROM RecordType WHERE SObjectType = 'Opportunity' AND DeveloperName = 'Foundation_Opportunity' LIMIT 1];
        String suf = uniqueSuffix();
        
        // Create parent accounts for NCM groups
        // Account ncmParent1 = new Account(Name = 'Parent Account1 (NCM20)',Related_Auto_Group__c=caseQueue.id,
        //                                Type__c='NCM 20 Group',Count_NCM_20_Group__c = 0,Count_NCM_20_Group_2__c =3,Count_NCM_Management_Group__c=9);
        //   Account ncmParent2 = new Account(Name = 'PaAccount2 (NCM20)'+suf,recordtypeid = accRT.id,Related_Auto_Group__c=caseQueue.id,
        //                                  Type__c='NCM 20 Group',Count_NCM_20_Group__c = 12,Count_NCM_20_Group_2__c=3,Count_NCM_Management_Group__c=9);
        // insert new List<Account>{ncmParent1};
        Account ncmParent1= [ SELECT id , Type__c,Name,Count_NCM_20_Group__c,Count_NCM_20_Group_2__c,Count_NCM_Management_Group__c from Account where Type__c = 'NCM 20 Group' and Count_NCM_20_Group__c !=null limit 1];
        // Create child accounts linking to parent NCM groups
        Account acc1 = new Account(
            Name = 'Child Account 1',
            NCM_Management_Group__c = ncmParent1.Id,
            recordtypeid = accRT.id,
            Related_Auto_Group__c = caseQueue1.id
            // NCM_20_Group_2__c = ncmParent2.Id,
            //NCM_20_Group_2__r = ncmParent2
        );
        /*  Account acc2 = new Account(
Name = 'ChildAcc 2',
NCM_20_Group_2__c = ncmParent1.Id,
recordtypeid = accRT.id,
Related_Auto_Group__c = caseQueue.id

);*/
        insert new List<Account>{acc1};
            
            // Create Opportunities linked to child accounts
            List<Opportunity> oppList = new List<Opportunity>();
        oppList.add(new Opportunity(
            Name = acc1.Name,
            StageName = 'Enrollment Pending',
            CloseDate = Date.today().addDays(10),
            AccountId = acc1.Id,
            recordtypeid = oppRT.id,
            Type__c = 'NCM',
            NCM_20_Group_Code__c = 'NCM20',
            Contract_Signed_Date__c =Date.today()	
        ));
        /*oppList.add(new Opportunity(
Name = 'Opp 2',
StageName = 'Enrollment Pending',
CloseDate = Date.today().addDays(15),
AccountId = acc2.Id,
Type__c = 'NCM',
recordtypeid = oppRT.id,
NCM_20_Group_Code__c = 'NCM20',
Contract_Signed_Date__c = Date.today()
));*/
        insert oppList;
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        
        UpdateOpportunityStatusBatch batch = new UpdateOpportunityStatusBatch();
        // Execute batch with batch size 1 to ensure coverage of all logic
        Database.executeBatch(batch);
        
        Test.stopTest();
        
    }
    
    /* @IsTest
static void testBatchExecution() {
Test.startTest();
Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());

UpdateOpportunityStatusBatch batch = new UpdateOpportunityStatusBatch();
// Execute batch with batch size 1 to ensure coverage of all logic
Database.executeBatch(batch);

Test.stopTest();

// Validate that Opportunities stage changed from 'Enrollment Pending' to 'Onboarding'
List<Opportunity> updatedOpps = [SELECT Id, StageName FROM Opportunity];
for (Opportunity opp : updatedOpps) {
System.assertEquals('Onboarding', opp.StageName, 'Opportunity stage should be updated.');
}

// Validate that Accounts count fields are updated
List<Account> accounts = [SELECT Id, Count_NCM_Management_Group__c, Count_NCM_20_Group_2__c FROM Account];
for (Account acc : accounts) {
// System.assert(acc.Count_NCM_Management_Group__c != null, 'NCM Management Group count should be updated.');
//  System.assert(acc.Count_NCM_20_Group_2__c != null, 'NCM 20 Group 2 count should be updated.');
}
}*/
    @isTest
    static void testScheduleExecution() {
        Account acc1 = new Account(
            Name = 'Child Account 1'
            // NCM_Management_Group__c = ncmParent1.Id,
            //  recordtypeid = accRT.id,
            //Related_Auto_Group__c = caseQueue1.id
            // NCM_20_Group_2__c = ncmParent2.Id,
            //NCM_20_Group_2__r = ncmParent2
        );
        insert acc1;
        RecordType oppRT = [SELECT Id FROM RecordType WHERE SObjectType = 'Opportunity' AND DeveloperName = 'Foundation_Opportunity' LIMIT 1];
        
        List<Opportunity> oppList = new List<Opportunity>();
        oppList.add(new Opportunity(
            Name = acc1.Name,
            StageName = 'Enrollment Pending',
            CloseDate = Date.today().addDays(10),
            AccountId = acc1.Id,
            recordtypeid = oppRT.id,
            Type__c = 'NCM',
            NCM_20_Group_Code__c = 'NCM20',
            Contract_Signed_Date__c =Date.today()	
        ));
        insert oppList;
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Test.startTest();
        UpdateOpportunityStatusBatchSchedule scheduleJob = new UpdateOpportunityStatusBatchSchedule();
        String sch = '0 0 23 * * ?';
        System.schedule('Test SLA Batch Schedule', sch, scheduleJob);
        Test.stopTest();
    }
    
}
```
