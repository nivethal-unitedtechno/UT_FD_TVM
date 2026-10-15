# Apex Test Class: UpdateOpportunityStageAsLostBatchTest

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `UpdateOpportunityStageAsLostBatchTest` |
| Type | Apex Test Class |
| API Version | 64.0 |
| Status | Active |
| Lines | 80 |

## Related Components

Tests: [UpdateOpportunityStageAsLostBatch](UpdateOpportunityStageAsLostBatch.md)

## Foundation Record / New Digital Support References

_No direct references; included as the test class for the components above._

## Source

```apex
@isTest
private class UpdateOpportunityStageAsLostBatchTest {

    // ✅ Generate a short numeric suffix to keep Quickbase Record ID within 20 chars
    private static String uniqueSuffix() {        
        Integer rnd = Math.abs(Math.mod(Crypto.getRandomInteger(), 1000000));
        return String.valueOf(rnd);
    }

    @isTest
    static void testFullCoverageSingleMethod() {
        String suf = uniqueSuffix();

        RecordType accRT = [SELECT Id FROM RecordType WHERE SObjectType = 'Account' AND DeveloperName = 'Foundation_Dealership' LIMIT 1];   
        RecordType oppRT = [SELECT Id FROM RecordType WHERE SObjectType = 'Opportunity' AND DeveloperName = 'Foundation_Opportunity' LIMIT 1];

        // ---- Account 1: Opportunity will be updated to Lost
        Account acc1 = new Account(
            Name = 'Acc1_' + suf,
            Active__c = true,
            Regional_Performance_Manager__c = UserInfo.getUserId(),
            Quickbase_Record_Id__c = suf + '1', // numeric suffix, safe for length
            RecordTypeId = accRT.Id
        );
        insert acc1;

        Opportunity opp1 = new Opportunity(
            Name = acc1.Name,
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(1),
            Last_Day_of_Service__c = Date.today().addDays(-1),
            AccountId = acc1.Id,
            RecordTypeId = oppRT.Id
        );
        insert opp1;

        // ---- Account 2: No live opportunities → triggers account deactivation
        Account acc2 = new Account(
            Name = 'Acc2_' + suf,
            Active__c = true,
            Regional_Performance_Manager__c = UserInfo.getUserId(),
            Quickbase_Record_Id__c = suf + '2', // numeric suffix
            RecordTypeId = accRT.Id
        );
        insert acc2;

        Opportunity opp2 = new Opportunity(
            Name = acc2.Name,
            StageName = 'Closed Lost',
            CloseDate = Date.today().addDays(-2),
            Last_Day_of_Service__c = Date.today().addDays(-2),
            AccountId = acc2.Id,
            RecordTypeId = oppRT.Id
        );
        insert opp2;

        Test.startTest();
        UpdateOpportunityStageAsLostBatch batch = new UpdateOpportunityStageAsLostBatch();

        // execute batch to cover start(), execute(), processAccountsForInactiveStatus()
        Database.executeBatch(batch, 10);

        // cover finish() explicitly
        batch.finish(null);

        // cover testForceAccountProcessing()
        batch.testForceAccountProcessing();

        // cover empty scope branch
        batch.execute(null, new List<Opportunity>());
        Test.stopTest();

        // ---- Assertions to verify logic
        Opportunity updatedOpp = [SELECT StageName FROM Opportunity WHERE Id = :opp1.Id];
        System.assertEquals('Lost', updatedOpp.StageName, 'Opportunity should be updated to Lost');

        Account deactivatedAcc = [SELECT Active__c FROM Account WHERE Id = :acc2.Id];
        System.assertEquals(false, deactivatedAcc.Active__c, 'Account should be deactivated if no live opportunities');
    }
}
```
