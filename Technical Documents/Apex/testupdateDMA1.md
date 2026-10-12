# Apex Test Class: testupdateDMA1

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `testupdateDMA1` |
| Type | Apex Test Class |
| API Version | 63.0 |
| Status | Active |
| Lines | 111 |

## Related Components

Tests: [AccountTrigger](AccountTrigger.md)

## Foundation Record / New Digital Support References

_No direct references; included as the test class for the components above._

## Source

```apex
//Test class from FND

@isTest(seeAllData=true)
public class testupdateDMA1 {
    
    private static DMA_Name__c createDMA(String zip, String dmaId, String name) {
        DMA_Name__c dm = new DMA_Name__c(
            Name = name,
            Zip_code__c = zip,
            DMA_id__c = dmaId
        );
        insert dm;
        return dm;
    }
    
    @isTest
    static void testUpdateDMABeforeInsert() {
        DMA_Name__c dma1 = createDMA('54329', 'DMA123', 'TestDMA');
        DMA_Name__c dma2 = createDMA('04329', 'DMA456', 'TestDMA2');
        
        Account acc1 = new Account(Name = 'Acc1', ShippingPostalCode = '54329');
        Account acc2 = new Account(Name = 'Acc2', ShippingPostalCode = '4329');
        
        List<Account> accList = new List<Account>{ acc1, acc2 };
            
            Test.startTest();
        UpdateDMA1Helper.updateDMABeforeInsert(accList);
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Integer callouts = Limits.getCallouts();
        
        Test.stopTest();
        
        
    }
    
    @isTest
    static void testUpdateDMABeforeUpdate_ChangeZip() {
        DMA_Name__c dma1 = createDMA('12345', 'DMA999', 'NewDMA');
        
        Account acc = new Account(
            Name = 'AccUpd',
            ShippingPostalCode = '54321'
        );
        insert acc;
        
        Account accUpd = new Account(
            Id = acc.Id,
            ShippingPostalCode = '12345'
        );
        
        Map<Id, Account> oldMap = new Map<Id, Account>{ acc.Id => acc };
            
            Test.startTest();
        UpdateDMA1Helper.updateDMABeforeUpdate(new List<Account>{ accUpd }, oldMap);
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Integer callouts = Limits.getCallouts();
        
        Test.stopTest();
    }
    
    @isTest
    static void testUpdateDMABeforeUpdate_FranchiseChange() {
        Account acc = new Account(
            Name = 'AccFranchise',
            ShippingPostalCode = '55555',
            OEM__c = 'HONDA'
        );
        insert acc;
        
        Account accUpd = new Account(
            Id = acc.Id,
            ShippingPostalCode = '55555',
            OEM__c = 'FORD;HONDA;TOYOTA;FORD'
        );
        
        Map<Id, Account> oldMap = new Map<Id, Account>{ acc.Id => acc };
            
            Test.startTest();
        UpdateDMA1Helper.updateDMABeforeUpdate(new List<Account>{ accUpd }, oldMap);
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Integer callouts = Limits.getCallouts();
        
        Test.stopTest();
        
    }
    
    @isTest
    static void testUpdateDMABeforeUpdate_NoZipChange() {
        Account acc = new Account(
            Name = 'AccNoZipChange',
            ShippingPostalCode = '99999'
        );
        insert acc;
        
        Account accUpd = new Account(
            Id = acc.Id,
            Name = 'AccNoZipChangeUpdated',
            ShippingPostalCode = '99999'
        );
        
        Map<Id, Account> oldMap = new Map<Id, Account>{ acc.Id => acc };
            
            Test.startTest();
        UpdateDMA1Helper.updateDMABeforeUpdate(new List<Account>{ accUpd }, oldMap);
        Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Integer callouts = Limits.getCallouts();
        
        Test.stopTest();
        
    }
}
```
