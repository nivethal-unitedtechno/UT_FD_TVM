# Apex Test Class: PRCompleteFlagOnAccBatch_Test

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `PRCompleteFlagOnAccBatch_Test` |
| Type | Apex Test Class |
| API Version | 63.0 |
| Status | Active |
| Lines | 68 |

## Related Components

Tests: [PRCompleteFlagOnAccBatch](PRCompleteFlagOnAccBatch.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 27 | `c1.Case_Category__c = 'New Digital Support';` |
| 35 | `c2.Case_Category__c = 'New Digital Support';` |
| 43 | `c3.Case_Category__c = 'New Digital Support';` |

## Source

```apex
@isTest(seeAllData =false)
public class PRCompleteFlagOnAccBatch_Test {
    
     static void PRCompleteFlagOnAccBatch_TestMethod(){
        Date closeDt = Date.Today();
        date myDate = date.today();
        
        DateTime dt = Datetime.now();
        String Month = dt.format('MMM');
        String Year = String.valueOf(dt.format('YYYY'));
        
        DateTime lstDt = dt.addMonths(-1);
        String LastMnth = lstDt.format('MMM');
        String LastYear = String.valueOf(lstDt.format('YYYY'));
        
      //  test.startTest();
        Account a2 = new Account(
            Name = 'testing acc'
        );
        insert a2;
        
        List<Case> caseList = new List<Case>();
       
        Case c1= new Case();
        c1.AccountId = a2.id;
        c1.Case_Request__c = 'Performance Review';
        c1.Case_Category__c = 'New Digital Support';
        c1.Close_Date__c = Date.Today();
        caseList.add(c1);
        
        Case c2= new Case();
        c2.AccountId = a2.id;
        c2.Close_Date__c = Date.Today().addMonths(-1);
        c2.Case_Request__c = 'Performance Review';
        c2.Case_Category__c = 'New Digital Support';
        caseList.add(c2);
        
        
        Case c3= new Case();
        c3.AccountId = a2.id;
        c3.Close_Date__c = Date.Today();
        c3.Case_Request__c = 'Geo Change';
        c3.Case_Category__c = 'New Digital Support';
        caseList.add(c3);
        
        
        insert caseList;
        
        
     /*   PRCompleteFlagOnAccBatch m = new PRCompleteFlagOnAccBatch();
        String sch = '20 30 8 10 2 ?';
        String jobID = system.schedule('Merge Job', sch, m);
        test.stopTest();  */
    }
    
    static testMethod void testCallout(){
        
    	PRCompleteFlagOnAccBatch_TestMethod();
        
    	Test.startTest();
        PRCompleteFlagOnAccBatch m = new PRCompleteFlagOnAccBatch();
        String sch = '20 30 8 10 2 ?';
        String jobID = system.schedule('Merge Job', sch, m);
    	Test.setMock(HttpCalloutMock.class, new ExampleCalloutMock());
        Integer callouts = Limits.getCallouts();
    	Test.stopTest();
  	}
}
```
