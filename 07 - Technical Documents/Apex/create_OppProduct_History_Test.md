# Apex Test Class: create_OppProduct_History_Test

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `create_OppProduct_History_Test` |
| Type | Apex Test Class |
| API Version | 63.0 |
| Status | Active |
| Lines | 75 |

## Related Components

Tests: [create_OppProduct_History](create_OppProduct_History.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 53 | `// ✅ Use the Foundation record type so the formula Foundation_Record__c = TRUE` |

## Source

```apex
@isTest(seeAllData = false)
public class create_OppProduct_History_Test {
	
     private class MockCallout implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"status":"success"}');
            return res;
        }
    }
    @isTest static void OppProduct_History_TestMethod(){
        Date closeDt = Date.Today();
        date myDate = date.today();
        test.startTest();
        
        // Register callout mock to avoid callout errors
        Test.setMock(HttpCalloutMock.class, new MockCallout());
        
        Account a2 = new Account(Name = 'testing acc');
        insert a2;
        
        Pricebook2 pb22 = new Pricebook2(Name = 'testOppPBs', isActive = true);
        insert pb22;
        
        Product2 pro2 = new Product2(Name = 'FEEFUELS', isActive = true);
        insert pro2;
        
        PricebookEntry pbe2 = new PricebookEntry(
            unitprice = 0.01,
            Product2Id = pro2.Id,
            Pricebook2Id = Test.getStandardPricebookId(),
            isActive = true,
            UseStandardPrice = false
        );
        insert pbe2;
        
        PricebookEntry customPrice = new PricebookEntry(
            Pricebook2Id = pb22.Id,
            Product2Id = pro2.Id,
            UnitPrice = 12000,
            IsActive = true
        );
        insert customPrice;
        
        // ✅ Get RecordType for Foundation Opportunities
        RecordType foundationRT = [
            SELECT Id FROM RecordType 
            WHERE SObjectType = 'Opportunity' AND DeveloperName = 'Foundation_Opportunity' LIMIT 1
        ];
        
        // ✅ Use the Foundation record type so the formula Foundation_Record__c = TRUE
        Opportunity oppr = new Opportunity(
            Name = a2.Name, 
            AccountId = a2.Id,
            StageName = 'Live',
            CloseDate = closeDt,
            Pricebook2Id = Test.getStandardPricebookId(),
            RecordTypeId = foundationRT.Id // ⬅️ key change
        );
        insert oppr;
        
        OpportunityLineItem OPplineitem2 = new OpportunityLineItem(
            Quantity = 1,
            OpportunityId = oppr.Id,
            UnitPrice = 0.01,
            PriceBookEntryId = pbe2.Id
        );
        insert OPplineitem2;
        
        delete OPplineitem2;
        test.stopTest();
    }
}
```
