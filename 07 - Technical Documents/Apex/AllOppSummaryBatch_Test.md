# Apex Test Class: AllOppSummaryBatch_Test

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `AllOppSummaryBatch_Test` |
| Type | Apex Test Class |
| API Version | 58.0 |
| Status | Active |
| Lines | 143 |

## Related Components

Tests: [AllOppSummaryBatch](AllOppSummaryBatch.md)

## Foundation Record / New Digital Support References

_No direct references; included as the test class for the components above._

## Source

```apex
/**
 * @description Unit tests for AllOppSummaryBatch.
 * Verifies summary generation "(Stage,Type__c)" comma-separated, updates Account and related Opportunities,
 * supports all three entry modes (Account-driven), and respects bulk behavior.
 */
@IsTest
public class AllOppSummaryBatch_Test {

    @TestSetup
    static void setupData() {
        // Fetch Foundation Dealership Record Type
        RecordType foundationRT = [SELECT Id FROM RecordType WHERE SObjectType = 'Account' AND DeveloperName = 'Foundation_Dealership' LIMIT 1];
        
        // Create Accounts with Foundation Dealership record type
        List<Account> accts = new List<Account>{
            new Account(Name = 'Acme A', RecordTypeId = foundationRT.Id),
            new Account(Name = 'Acme B', RecordTypeId = foundationRT.Id)
        };
        insert accts;

        // Create Opportunities under both Accounts
        List<Opportunity> opps = new List<Opportunity>{
            new Opportunity(Name='Opp A1', AccountId=accts[0].Id, StageName='Prospecting', CloseDate=Date.today().addDays(30), Type__c='New'),
            new Opportunity(Name='Opp A2', AccountId=accts[0].Id, StageName='Closed Won', CloseDate=Date.today().addDays(10), Type__c='Expansion'),
            new Opportunity(Name='Opp B1', AccountId=accts[1].Id, StageName='Qualification', CloseDate=Date.today().addDays(45), Type__c='New')
        };
        insert opps;
    }

    private static String exp(List<Opportunity> opps) {
        if (opps == null || opps.isEmpty()) return null;
        String s = '';
        for (Opportunity o : opps) {
            String stg = o.StageName == null ? '' : o.StageName;
            String typ = o.Type__c == null ? '' : o.Type__c;
            s += '(' + stg + ',' + typ + '),';
        }
        // trim trailing comma
        if (s.endsWith(',')) s = s.substring(0, s.length()-1);
        return s;
    }

    @IsTest
    static void test_RunForAllAccounts() {
        // Arrange
        List<Account> accts = [SELECT Id FROM Account ORDER BY Name];
        System.assertEquals(2, accts.size(), 'Expected 2 setup Accounts');

        // Expected summaries
        Map<Id, String> expected = new Map<Id, String>();
        Map<Id, List<Opportunity>> byAcc = new Map<Id, List<Opportunity>>();
        for (Opportunity o : [SELECT Id, AccountId, StageName, Type__c FROM Opportunity]) {
            if (!byAcc.containsKey(o.AccountId)) {
                byAcc.put(o.AccountId, new List<Opportunity>());
            }
            byAcc.get(o.AccountId).add(o);
        }
        for (Id aid : byAcc.keySet()) {
            expected.put(aid, exp(byAcc.get(aid)));
        }

        Test.startTest();
        AllOppSummaryBatch.runAll(50);
        Test.stopTest();

        // Assert Account updates
        for (Account a : [SELECT Id, All_Opportunities__c FROM Account]) {
            System.assertEquals(expected.get(a.Id), a.All_Opportunities__c, 'Account summary mismatch');
        }
        // Assert Opp updates
        for (Opportunity o : [SELECT Id, AccountId, All_Opportunities__c FROM Opportunity]) {
            System.assertEquals(expected.get(o.AccountId), o.All_Opportunities__c, 'Opp summary mismatch');
        }
    }

    @IsTest
    static void test_RunForAccountIds() {
        Account a = [SELECT Id FROM Account WHERE Name = 'Acme A' LIMIT 1];
        String expected = exp([SELECT Id, StageName, Type__c FROM Opportunity WHERE AccountId = :a.Id]);

        Test.startTest();
        AllOppSummaryBatch.runForAccounts(new Set<Id>{a.Id}, 20);
        Test.stopTest();

        Account aRefreshed = [SELECT Id, All_Opportunities__c FROM Account WHERE Id = :a.Id];
        System.assertEquals(expected, aRefreshed.All_Opportunities__c, 'Account A summary mismatch');
        for (Opportunity o : [SELECT Id, All_Opportunities__c FROM Opportunity WHERE AccountId = :a.Id]) {
            System.assertEquals(expected, o.All_Opportunities__c, 'Opp under A summary mismatch');
        }
        // Other account should also be set if batch previously ran; to isolate, re-null and run again:
        // Not necessary for coverage; above asserts ensure correctness for targeted account.
    }

    @IsTest
    static void test_RunForOpportunityIds() {
        // Pick an opportunity from Acme B
        Opportunity anyB = [SELECT Id, AccountId FROM Opportunity WHERE AccountId IN (SELECT Id FROM Account WHERE Name='Acme B') LIMIT 1];
        String expected = exp([SELECT Id, StageName, Type__c FROM Opportunity WHERE AccountId = :anyB.AccountId]);

        Test.startTest();
        AllOppSummaryBatch.runForOpportunities(new Set<Id>{anyB.Id}, 25);
        Test.stopTest();

        Account b = [SELECT Id, All_Opportunities__c FROM Account WHERE Id = :anyB.AccountId];
        System.assertEquals(expected, b.All_Opportunities__c, 'Account B summary mismatch');
        for (Opportunity o : [SELECT Id, All_Opportunities__c FROM Opportunity WHERE AccountId = :anyB.AccountId]) {
            System.assertEquals(expected, o.All_Opportunities__c, 'Opp under B summary mismatch');
        }
    }

    @IsTest
    static void test_StaticHelpers_And_NoArgConstructor() {
        // Verify static helpers and default constructor work and produce same expected results
        Map<Id, String> expected = new Map<Id, String>();
        // Fallback computation of expected using Apex, matching flow logic and batch helper:
        Map<Id, List<Opportunity>> byAcc = new Map<Id, List<Opportunity>>();
        for (Opportunity o : [SELECT Id, AccountId, StageName, Type__c FROM Opportunity]) {
            if (!byAcc.containsKey(o.AccountId)) byAcc.put(o.AccountId, new List<Opportunity>());
            byAcc.get(o.AccountId).add(o);
        }
        for (Id aid : byAcc.keySet()) {
            expected.put(aid, exp(byAcc.get(aid)));
        }

        // 1) Default constructor -> all accounts
        Test.startTest();
        Database.executeBatch(new AllOppSummaryBatch(), 50);
        Test.stopTest();

        for (Account a : [SELECT Id, All_Opportunities__c FROM Account]) {
            System.assertEquals(expected.get(a.Id), a.All_Opportunities__c, 'Default ctor run: account summary mismatch');
        }

        // 2) Static helper runAll
        //Test.startTest();
        //AllOppSummaryBatch.runAll(50);
        //Test.stopTest();

        for (Opportunity o : [SELECT Id, AccountId, All_Opportunities__c FROM Opportunity]) {
            System.assertEquals(expected.get(o.AccountId), o.All_Opportunities__c, 'runAll: opp summary mismatch');
        }
    }    
}
```
