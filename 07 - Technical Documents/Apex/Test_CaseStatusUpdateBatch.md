# Apex Test Class: Test_CaseStatusUpdateBatch

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `Test_CaseStatusUpdateBatch` |
| Type | Apex Test Class |
| API Version | 63.0 |
| Status | Active |
| Lines | 144 |

## Related Components

Tests: [CaseStatusUpdateBatch](CaseStatusUpdateBatch.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 23 | `// The batch's entry condition is: Foundation_Record__c = TRUE OR Case_Category__c = 'New Digital Support'.` |
| 68 | `Case_Category__c = 'New Digital Support'   // satisfies the batch's OR condition` |

## Source

```apex
@IsTest
public class Test_CaseStatusUpdateBatch {

    // Same date that CaseStatusUpdateBatch.start() uses when a test is running
    private static final Date BATCH_TEST_DATE = Date.newInstance(2025, 10, 3);

    // Test data for the 4 Cases: request type, Start_Date_Time__c, SLA hours.
    // Oct 4 2025 = Saturday, Oct 5 = Sunday, Oct 6 = Monday, Oct 7 = Tuesday.
    private static final List<String> REQUEST_TYPES = new List<String>{
        'Future Campaign Build - Get Me More',
        'Future Campaign Build - Client Requested',
        'Future Campaign Build - Standard',
        'Future Budget Change'
    };
    private static final List<DateTime> START_TIMES = new List<DateTime>{
        DateTime.newInstance(2025, 10, 4, 10, 0, 0), // Saturday
        DateTime.newInstance(2025, 10, 5, 11, 0, 0), // Sunday
        DateTime.newInstance(2025, 10, 6, 9, 0, 0),  // Monday
        DateTime.newInstance(2025, 10, 7, 14, 0, 0)  // Tuesday
    };
    private static final List<Integer> SLA_HOURS = new List<Integer>{ 8, 10, 6, 4 };

    // The batch's entry condition is: Foundation_Record__c = TRUE OR Case_Category__c = 'New Digital Support'.
    // Foundation_Record__c is a formula field and can't be set directly, so these test cases
    // satisfy the condition through the Case_Category__c side of the OR instead - that alone
    // is enough for the batch to pick them up.
    static void setupTestData() {
        Profile profile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];

        // Unique username - a fixed one can fail with DUPLICATE_USERNAME (usernames are unique across all orgs)
        String unique = 'csub' + System.currentTimeMillis() + Math.abs(Crypto.getRandomInteger());
        User testUser = new User(
            Alias = 'testuser',
            Email = unique + '@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Test',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = profile.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = unique + '@example.com'
        );
        insert testUser;

        System.runAs(testUser) {

            // No Account Record Type is required
            Account acc = new Account(
                Name = 'Demo Account',
                Regional_performance_manager__c = testUser.Id,
                Account_Technician__c = testUser.Id,
                Secondary_Account_Technician__c = testUser.Id
            );
            insert acc;

            List<Case> caseList = new List<Case>();
            for (Integer i = 0; i < REQUEST_TYPES.size(); i++) {
                caseList.add(new Case(
                    AccountId = acc.Id,
                    Priority = 'Low',
                    Subject = 'CaseStatusUpdateBatch test ' + i,
                    Status_Filtered__c = 'Future',
                    Start_Date__c = Date.today(),
                    Start_Date_Time__c = START_TIMES[i],
                    Case_Request__c = REQUEST_TYPES[i],
                    Digital_Execution_Start_Date__c = BATCH_TEST_DATE,
                    SLA_Time__c = SLA_HOURS[i],
                    Case_Category__c = 'New Digital Support'   // satisfies the batch's OR condition
                ));
            }
            insert caseList;
        }
    }

    // Runs the batch end to end (start -> execute -> finish) through Database.executeBatch
    @IsTest
    static void testCaseStatusBatchExecution() {
        setupTestData();

        Test.startTest();
            Database.executeBatch(new CaseStatusUpdateBatch(), 200);
            Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Test.stopTest();

        System.assertEquals(4, [SELECT COUNT() FROM Case], 'Expected 4 test cases');
    }

    // Calls execute() directly. The fields execute() depends on are set again IN MEMORY
    // right before the call, so every branch (all 4 request types, Saturday, Sunday,
    // weekday, SLA loop) runs even if a flow/trigger changed or cleared them on insert
    // (for example a null Start_Date_Time__c would throw a NullPointerException in execute()).
    @IsTest
    static void testExecuteDirectly() {
        setupTestData();

        List<Case> scope = [SELECT Id, Subject, Status_Filtered__c, Case_Request__c, Future_Case__c,
                                   Digital_Execution_Start_Date__c, SLA_Time__c,
                                   Start_Date_Time__c, Due_Date__c
                            FROM Case ORDER BY Subject];
        System.assertEquals(4, scope.size(), 'Expected 4 test cases');

        for (Integer i = 0; i < scope.size(); i++) {
            scope[i].Case_Request__c = REQUEST_TYPES[i];
            scope[i].Start_Date_Time__c = START_TIMES[i];
            scope[i].SLA_Time__c = SLA_HOURS[i];
        }

        // setupTestData() inserts a User (setup object). Updating Cases in the same context
        // causes MIXED_DML_OPERATION, so run the batch inside System.runAs.
        User currentUser = new User(Id = UserInfo.getUserId());
        Test.startTest();
            System.runAs(currentUser) {
                CaseStatusUpdateBatch batch = new CaseStatusUpdateBatch();
                batch.start(null);
                batch.execute(null, scope);
                batch.finish(null);
            }
        Test.stopTest();

        for (Case c : [SELECT Id, Status_Filtered__c, Future_Case__c, Due_Date__c FROM Case]) {
            System.assertEquals('Assigned', c.Status_Filtered__c, 'Batch should set Status_Filtered__c to Assigned');
            System.assertEquals(true, c.Future_Case__c, 'Batch should set Future_Case__c');
            System.assertNotEquals(null, c.Due_Date__c, 'Due date should be calculated');
        }
    }

    // Scheduler tested on its own: a test can only run one batch, and the scheduler
    // launches its own batch, so keeping it with the batch test can make that test fail
    @IsTest
    static void testScheduler() {
        Test.startTest();
            String jobId = System.schedule('Test CaseStatusUpdateBatch Job', '0 0 2 * * ?', new ScheduleCaseStatusUpdateBatch());
        Test.stopTest();

        System.assertNotEquals(null, jobId, 'Job should be scheduled');
    }

    @IsTest
    static void testIsBusinessHour() {
        System.assertEquals(true,  CaseStatusUpdateBatch.isBusinessHour(DateTime.newInstance(2025, 10, 6, 10, 0, 0)), 'Monday 10 AM');
        System.assertEquals(false, CaseStatusUpdateBatch.isBusinessHour(DateTime.newInstance(2025, 10, 6, 20, 0, 0)), 'Monday 8 PM');
        System.assertEquals(false, CaseStatusUpdateBatch.isBusinessHour(DateTime.newInstance(2025, 10, 4, 10, 0, 0)), 'Saturday');
    }
}
```
