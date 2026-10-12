# Apex Test Class: UpdateAccountFromOpportunityBatch_Test

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `UpdateAccountFromOpportunityBatch_Test` |
| Type | Apex Test Class |
| API Version | 58.0 |
| Status | Active |
| Lines | 165 |

## Related Components

Tests: [UpdateAccountFromOpportunityBatch](UpdateAccountFromOpportunityBatch.md)

## Foundation Record / New Digital Support References

_No direct references; included as the test class for the components above._

## Source

```apex
@IsTest
private class UpdateAccountFromOpportunityBatch_Test {

    @IsTest
    static void testBatchUpdates_AllFields_AppendsWithoutDupes() {
        // Accounts with initial values (these will be wiped by the batch, then rebuilt)
        Account acc1 = new Account(Name = 'Acc1', Type__c = 'NCM', OEM__c = 'NISSAN', FND_OEM_Program__c = 'Hyundai 2024 Boost Program');
        insert acc1;

        Account acc2 = new Account(Name = 'Acc2'); // null fields
        insert acc2;

        // Qualifying Opportunities: Use RecordType 'Foundation Opportunity'
        Id oppRtId = [SELECT Id FROM RecordType WHERE SObjectType = 'Opportunity' AND Name = 'Foundation Opportunity' LIMIT 1].Id;

        // acc1: should append new tokens and avoid duplicates (Foundation stages contribute; excluded stages ignored)
        Opportunity opp1 = new Opportunity(
            Name = 'Opp1',
            StageName = 'Enrollment Pending', // contributes
            CloseDate = System.today(),
            AccountId = acc1.Id,
            RecordTypeId = oppRtId,
            Type__c = 'Digital Advertising',
            OEM__c = 'ACURA',
            FND_OEM_Program__c = 'Honda Digital Advertising Program'
        );

        // Duplicate tokens should not be appended
        Opportunity opp1Dup = new Opportunity(
            Name = 'Opp1Dup',
            StageName = 'Onboarding', // contributes
            CloseDate = System.today(),
            AccountId = acc1.Id,
            RecordTypeId = oppRtId,
            Type__c = 'Digital Advertising',
            OEM__c = 'AUDI',
            FND_OEM_Program__c = 'Honda Digital Advertising Program'
        );

        // acc2: start empty, should set values
        Opportunity opp2 = new Opportunity(
            Name = 'Opp2',
            StageName = 'Onboarding', // contributes
            CloseDate = System.today(),
            AccountId = acc2.Id,
            RecordTypeId = oppRtId,
            Type__c = 'NCM',
            OEM__c = 'BMW',
            FND_OEM_Program__c = 'Honda Digital Advertising Program'
        );

        // Excluded stage: should NOT contribute values
        Opportunity opp3 = new Opportunity(
            Name = 'Opp3',
            StageName = 'Foundation Data', // excluded entirely
            CloseDate = System.today(),
            AccountId = acc2.Id,
            RecordTypeId = oppRtId,
            Type__c = 'NCM',
            OEM__c = 'DODGE',
            FND_OEM_Program__c = 'Hyundai 2024 Boost Program'
        );

        insert new List<Opportunity>{ opp1, opp1Dup, opp2, opp3 };

        Test.startTest();
        Database.executeBatch(new UpdateAccountFromOpportunityBatch(), 50);
        Test.stopTest();

        acc1 = [SELECT Id, Type__c, OEM__c, FND_OEM_Program__c FROM Account WHERE Id = :acc1.Id];
        acc2 = [SELECT Id, Type__c, OEM__c, FND_OEM_Program__c FROM Account WHERE Id = :acc2.Id];
       
    }

    @IsTest
    static void testBatchFilters_OnlyFoundationAndWithAccount() {
        Account a = new Account(Name = 'A');
        insert a;

        // Pull RT
        Id oppRtId2 = [SELECT Id FROM RecordType WHERE SObjectType = 'Opportunity' AND Name = 'Foundation Opportunity' LIMIT 1].Id;

        // Ignored (no account)
        Opportunity oppNoAcc = new Opportunity(
            Name = 'NoAcc',
            StageName = 'Onboarding',
            CloseDate = System.today(),
            RecordTypeId = oppRtId2,
            Type__c = 'Digital Advertising',
            OEM__c = 'BMW',
            FND_OEM_Program__c = 'Honda Boost Campaign 2024'
        );

        // Ignored for batch selection because not Foundation (no RecordTypeId)
        Opportunity oppNoFoundation = new Opportunity(
            Name = 'NoFoundation',
            StageName = 'Onboarding',
            CloseDate = System.today(),
            AccountId = a.Id,
            Type__c = 'NCM',
            OEM__c = 'NISSAN',
            FND_OEM_Program__c = 'Hyundai 2024 Boost Program'
        );

        // Qualifies (foundation + has account)
        Opportunity oppOk = new Opportunity(
            Name = 'Ok',
            StageName = 'Onboarding',
            CloseDate = System.today(),
            AccountId = a.Id,
            RecordTypeId = oppRtId2,
            Type__c = 'Digital Advertising',
            OEM__c = 'FIAT',
            FND_OEM_Program__c = 'Honda Boost Campaign 2024'
        );

        insert new List<Opportunity>{ oppNoAcc, oppNoFoundation, oppOk };

        Test.startTest();
        Database.executeBatch(new UpdateAccountFromOpportunityBatch(), 50);
        Test.stopTest();

        a = [SELECT Id, Type__c, OEM__c, FND_OEM_Program__c FROM Account WHERE Id = :a.Id];
     
    }

    @IsTest
    static void testAllRelatedOppsUsed_NoDateFiltering() {
        Account a = new Account(Name = 'FilterA');
        insert a;

        Id oppRtId3 = [SELECT Id FROM RecordType WHERE SObjectType = 'Opportunity' AND Name = 'Foundation Opportunity' LIMIT 1].Id;

        // Two foundation opps, one with an older close date. Both should be considered since there is no date filtering.
        Opportunity oldOpp = new Opportunity(
            Name = 'OldOpp',
            StageName = 'Onboarding',
            CloseDate = System.today().addDays(-365),
            AccountId = a.Id,
            RecordTypeId = oppRtId3,
            Type__c = 'Digital Advertising',
            OEM__c = 'NISSAN',
            FND_OEM_Program__c = 'Hyundai 2024 Boost Program'
        );
        Opportunity newOpp = new Opportunity(
            Name = 'NewOpp',
            StageName = 'Onboarding',
            CloseDate = System.today(),
            AccountId = a.Id,
            RecordTypeId = oppRtId3,
            Type__c = 'NCM',
            OEM__c = 'NISSAN',
            FND_OEM_Program__c = 'Hyundai 2024 Boost Program'
        );
        insert new List<Opportunity>{ oldOpp, newOpp };

        Test.startTest();
        Database.executeBatch(new UpdateAccountFromOpportunityBatch(), 50);
        Test.stopTest();

        a = [SELECT Id, Type__c, OEM__c, FND_OEM_Program__c FROM Account WHERE Id = :a.Id];

      
    }
}
```
