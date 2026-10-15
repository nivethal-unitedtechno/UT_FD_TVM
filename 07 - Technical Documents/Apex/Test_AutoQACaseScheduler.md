# Apex Test Class: Test_AutoQACaseScheduler

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `Test_AutoQACaseScheduler` |
| Type | Apex Test Class |
| API Version | 65.0 |
| Status | Active |
| Lines | 100 |

## Related Components

Tests: [AutoQACaseScheduler](AutoQACaseScheduler.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 15 | `* solely on Case_Category__c = 'New Digital Support' to make` |
| 76 | `System.assertEquals('New Digital Support', foundationCases[0].Case_Category__c);` |

## Source

```apex
/*
 * IMPORTANT: This class uses hardcoded record Ids ('001Vb00000aCIHfIAO' and
 * '012Vb000007oEJtIAM') to build the ORIGINAL (unchanged/legacy) Case block
 * only. Regular org data (like an existing Account) is NOT visible inside a
 * standard @IsTest method unless SeeAllData=true is used - so this test class
 * requires it purely because that legacy block was written with hardcoded Ids
 * rather than dynamic lookups. This is a known fragile pattern: these Ids are
 * specific to ONE org and will not resolve in any other sandbox/org, and that
 * block (and this test) will fail with an invalid cross-reference error
 * anywhere else. If that block is ever refactored to look up the Account/
 * RecordType dynamically instead of hardcoding Ids, this SeeAllData dependency
 * (and the portability problem) goes away entirely.
 *
 * The NEW Foundation block does NOT use a RecordTypeId at all - it relies
 * solely on Case_Category__c = 'New Digital Support' to make
 * Foundation_Record__c evaluate true, since what actually drives that formula
 * is not fixed and may change independently of this test.
 */
@IsTest(SeeAllData=true)
private class Test_AutoQACaseScheduler {

    private class QACalloutMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"success": true}');
            return res;
        }
    }

    @IsTest
    static void testAutoQACaseScheduler_CreatesOriginalAndFoundationCases() {

        // Confirm the hardcoded references this class depends on actually
        // exist in this org before relying on them - if either of these
        // queries returns nothing, the scheduler itself cannot succeed here.
        List<Account> acc = [SELECT Id FROM Account WHERE Id = '001Vb00000aCIHfIAO' LIMIT 1];
        List<RecordType> rt = [SELECT Id FROM RecordType WHERE Id = '012Vb000007oEJtIAM' LIMIT 1];
        System.assert(!acc.isEmpty(),
            'Hardcoded AccountId 001Vb00000aCIHfIAO must exist in this org for the scheduler to run.');
        System.assert(!rt.isEmpty(),
            'Hardcoded RecordTypeId 012Vb000007oEJtIAM must exist in this org for the scheduler to run.');

        Test.setMock(HttpCalloutMock.class, new QACalloutMock());

        Test.startTest();

        String cronExp = '0 0 0 1 1 ? 2099';
        AutoQACaseScheduler scheduler = new AutoQACaseScheduler();
        System.schedule('Test Auto QA Case Scheduler', cronExp, scheduler);

        Test.stopTest();

        // --- Original block ---
        List<Case> originalCases = [
            SELECT Id, Subject, Foundation_Request_Type__c, Origin, Status
            FROM Case
            WHERE Subject = 'Performance Alert Review'
        ];
        System.assertEquals(1, originalCases.size(),
          'The original (unchanged) block should create exactly one Case');
        System.assertEquals('Performance Alert Review', originalCases[0].Foundation_Request_Type__c);
        System.assertEquals('System', originalCases[0].Origin);
        System.assertEquals('New', originalCases[0].Status);

        // --- New Foundation block ---
        List<Case> foundationCases = [
            SELECT Id, Subject, Case_Request__c, Case_Category__c, Origin, Status_Filtered__c
            FROM Case
            WHERE Subject = 'Performance Alert Review (Foundation)'
        ];
        System.assertEquals(1, foundationCases.size(),
            'The new Foundation-gated block should create exactly one additional Case');
        System.assertEquals('Performance Alert Review', foundationCases[0].Case_Request__c,
            'Case_Request__c should hold the value the original block put in Foundation_Request_Type__c');
        System.assertEquals('New Digital Support', foundationCases[0].Case_Category__c);
        System.assertEquals(true, [SELECT Foundation_Record__c FROM Case WHERE Id = :foundationCases[0].Id].Foundation_Record__c,
            'Foundation_Record__c should evaluate true from Case_Category__c alone, with no RecordTypeId set');
        System.assertEquals('System', foundationCases[0].Origin);
        System.assertEquals('New', foundationCases[0].Status_Filtered__c,
            'Status_Filtered__c should hold the value the original block put in Status');
    }

    @IsTest
    static void testAutoQACaseScheduler_SchedulesSuccessfully() {
        // Lightweight second test: confirms the job itself schedules and
        // reports as expected, independent of the record-creation assertions
        // above (also contributes coverage of the Schedulable interface path).
        Test.startTest();
        String jobId = System.schedule(
            'Test Auto QA Case Scheduler 2',
            '0 0 0 2 1 ? 2099',
            new AutoQACaseScheduler()
        );
        Test.stopTest();

        CronTrigger ct = [SELECT Id, CronExpression, State FROM CronTrigger WHERE Id = :jobId];
        System.assertEquals('0 0 0 2 1 ? 2099', ct.CronExpression);
    }
}
```
