# Apex Test Class: SLARemainingTimeSendEmailBatchTest

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `SLARemainingTimeSendEmailBatchTest` |
| Type | Apex Test Class |
| API Version | 63.0 |
| Status | Active |
| Lines | 77 |

## Related Components

Tests: [SLARemainingTimeSendEmailBatch](SLARemainingTimeSendEmailBatch.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 36 | `Case_Category__c = 'New Digital Support',` |
| 45 | `Case_Category__c = 'New Digital Support',` |

## Source

```apex
@isTest
public class SLARemainingTimeSendEmailBatchTest {

    public static Account createTestData() {
        // Fetch a profile to use for the test user
        Profile profile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1]; // Adjust profile if needed

        String unique = 'slauser' + System.currentTimeMillis() + Math.abs(Crypto.getRandomInteger());
        User testUser = new User(
            Alias = 'slauser',
            Email = unique + '@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'BatchTester',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = profile.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = unique + '@example.com'
        );
        insert testUser;

        Account acc;
        System.runAs(testUser) {

            acc = new Account(
                Name = 'Test SLA Acc',
                Account_Technician__c = testUser.Id,
                Regional_performance_manager__c = testUser.Id
            );
            insert acc;

            // Case 1 (should be picked by batch)
            Case cs1 = new Case(
                AccountId = acc.Id,
                Status_Filtered__c = 'InProgress',
                Case_Category__c = 'New Digital Support',
                Mail_Sent__c = false
            );
            insert cs1;

          /*  // Case 2 (already closed, should not be picked)
            Case cs2 = new Case(
                AccountId = acc.Id,
                Status_Filtered__c = 'Closed',
                Case_Category__c = 'New Digital Support',
                Mail_Sent__c = true
            );
            insert cs2; */
        }
        return acc;
    }

    @isTest
    static void testBatchExecution() {
        Account acct = createTestData();

        Test.startTest();
        SLARemainingTimeSendEmailBatch batchJob = new SLARemainingTimeSendEmailBatch();
        Database.executeBatch(batchJob, 1);
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Integer callouts = Limits.getCallouts();
        Test.stopTest();
    }

  /*  @isTest
    static void testScheduledExecution() {
        Account acct = createTestData();

        Test.startTest();
        SLARemainingTimeSendEmailBatchSchedule scheduleJob = new SLARemainingTimeSendEmailBatchSchedule();
        String sch = '0 0 23 * * ?';
        System.schedule('Test SLA Batch Schedule', sch, scheduleJob);
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Integer callouts = Limits.getCallouts();
        Test.stopTest();
    }*/
}
```
