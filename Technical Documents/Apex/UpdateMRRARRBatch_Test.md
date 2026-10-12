# Apex Test Class: UpdateMRRARRBatch_Test

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `UpdateMRRARRBatch_Test` |
| Type | Apex Test Class |
| API Version | 56.0 |
| Status | Active |
| Lines | 141 |

## Related Components

Tests: [UpdateMRRARRBatch](UpdateMRRARRBatch.md)

## Foundation Record / New Digital Support References

_No direct references; included as the test class for the components above._

## Source

```apex
@isTest
public class UpdateMRRARRBatch_Test {

    private class MockCallout implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"status":"success"}');
            return res;
        }
    }

    // ---------------------------
    // TEST 1 - runAll()
    // ---------------------------
    @isTest
    static void testRunAll() {

        Test.setMock(HttpCalloutMock.class, new MockCallout());

        // Test data
        Id foundationRecordTypeId = [SELECT Id FROM RecordType WHERE SObjectType = 'Account' AND Name = 'Foundation Dealership' LIMIT 1].Id;

        Account acc = new Account(Name = 'Test Account', RecordTypeId = foundationRecordTypeId);
        insert acc;

        //Opportunity o1 = new Opportunity(Name='Opp1', AccountId=acc.Id, StageName='Live', CloseDate=Date.today(), ARR__c=10000);
        //Opportunity o2 = new Opportunity(Name='Opp2', AccountId=acc.Id, StageName='Cancellation', CloseDate=Date.today(), ARR__c=20000);
       Opportunity o1 = new Opportunity(Name='Opp1', AccountId=acc.Id, StageName='Live', CloseDate=Date.today());
       Opportunity o2 = new Opportunity(Name='Opp2', AccountId=acc.Id, StageName='Cancellation', CloseDate=Date.today());
        insert new List<Opportunity>{o1, o2};

        Test.startTest();
        UpdateMRRARRBatch.runAll(100);
        Test.stopTest();

        Account updated = [SELECT ARR__c FROM Account WHERE Id=:acc.Id];
       // System.assertEquals(30000, updated.ARR__c);
    }

    // ---------------------------
    // TEST 2 - Execute With Account IDs
    // ---------------------------
    @isTest
    static void testExecuteWithAccounts() {

        Test.setMock(HttpCalloutMock.class, new MockCallout());

        Id rtId = [SELECT Id FROM RecordType WHERE SObjectType='Account' AND Name='Foundation Dealership' LIMIT 1].Id;

        Account a1 = new Account(Name='A1', RecordTypeId=rtId);
        Account a2 = new Account(Name='A2', RecordTypeId=rtId);
        insert new List<Account>{a1,a2};

        //insert new Opportunity(Name='O1', AccountId=a1.Id, StageName='Live', ARR__c=10000, CloseDate=Date.today());
        //insert new Opportunity(Name='O2', AccountId=a1.Id, StageName='Cancellation', ARR__c=20000, CloseDate=Date.today());
        //insert new Opportunity(Name='O3', AccountId=a2.Id, StageName='Live', ARR__c=15000, CloseDate=Date.today());
        
        insert new Opportunity(Name='O1', AccountId=a1.Id, StageName='Live',CloseDate=Date.today());
        insert new Opportunity(Name='O2', AccountId=a1.Id, StageName='Cancellation', CloseDate=Date.today());
        insert new Opportunity(Name='O3', AccountId=a2.Id, StageName='Live',  CloseDate=Date.today());

        Test.startTest();
        UpdateMRRARRBatch batch = new UpdateMRRARRBatch(new Set<Id>{a1.Id, a2.Id});
        Database.executeBatch(batch, 100);
        Test.stopTest();

        Account ua1 = [SELECT ARR__c FROM Account WHERE Id=:a1.Id];
        Account ua2 = [SELECT ARR__c FROM Account WHERE Id=:a2.Id];

        //System.assertEquals(30000, ua1.ARR__c);
        //System.assertEquals(15000, ua2.ARR__c);
    }

    // ---------------------------
    // TEST 3 - Execute With Opportunity IDs
    // ---------------------------
    @isTest
    static void testExecuteWithOpportunities() {

        Test.setMock(HttpCalloutMock.class, new MockCallout());

        Id rtId = [SELECT Id FROM RecordType WHERE SObjectType='Account' AND Name='Foundation Dealership' LIMIT 1].Id;

        Account acc = new Account(Name='Acc', RecordTypeId=rtId);
        insert acc;

        //Opportunity o1 = new Opportunity(Name='O1', AccountId=acc.Id, StageName='Live', ARR__c=10000, CloseDate=Date.today());
        //Opportunity o2 = new Opportunity(Name='O2', AccountId=acc.Id, StageName='Cancellation', ARR__c=20000, CloseDate=Date.today());
        
        Opportunity o1 = new Opportunity(Name='O1', AccountId=acc.Id, StageName='Live',CloseDate=Date.today());
        Opportunity o2 = new Opportunity(Name='O2', AccountId=acc.Id, StageName='Cancellation',CloseDate=Date.today());
        insert new List<Opportunity>{o1, o2};

        Test.startTest();
        UpdateMRRARRBatch batch = new UpdateMRRARRBatch(
            UpdateMRRARRBatch.Mode.BY_OPPORTUNITY_IDS,
            null,
            new Set<Id>{o1.Id, o2.Id},
            100
        );
        Database.executeBatch(batch, 100);
        Test.stopTest();

        Account updated = [SELECT ARR__c FROM Account WHERE Id=:acc.Id];
        //System.assertEquals(30000, updated.ARR__c);
    }

    // ---------------------------
    // TEST 4 - Start Method
    // ---------------------------
    @isTest
    static void testStartMethod() {

        Test.setMock(HttpCalloutMock.class, new MockCallout());

        Id rtId = [SELECT Id FROM RecordType WHERE SObjectType='Account' AND Name='Foundation Dealership' LIMIT 1].Id;

        Account acc = new Account(Name='Acc', RecordTypeId=rtId);
        insert acc;

        //Opportunity opp = new Opportunity(Name='Opp', AccountId=acc.Id, StageName='Live', ARR__c=10000, CloseDate=Date.today());
        
        Opportunity opp = new Opportunity(Name='Opp', AccountId=acc.Id, StageName='Live', CloseDate=Date.today());
        insert opp;

        UpdateMRRARRBatch batch = new UpdateMRRARRBatch(
            UpdateMRRARRBatch.Mode.ALL_ACCOUNTS_WITH_LIVE_OPPORTUNITIES,
            null,
            null,
            100
        );

        Test.startTest();
        Database.QueryLocator ql = batch.start(null);
        Test.stopTest();

       // System.assertNotEquals(null, ql);
    }
}
```
