# Apex Test Class: CaseAssignmentBatchTest

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `CaseAssignmentBatchTest` |
| Type | Apex Test Class |
| API Version | 65.0 |
| Status | Active |
| Lines | 135 |
| Last Modified | 2026-10-16 06:34 UTC by Sandip Patel |

## Related Components

Tests: [CaseAssignmentBatch](CaseAssignmentBatch.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 39 | `Case_Category__c = 'New Digital Support'` |

## Source

```apex
@IsTest
public class CaseAssignmentBatchTest {

    private class DummyHttpCalloutMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"status":"ok"}');
            return res;
        }
    }

    private static User buildUser(Id profileId, String alias) {
        String unique = alias + System.currentTimeMillis() + Math.abs(Crypto.getRandomInteger());
        return new User(
            Alias = alias,
            Email = unique + '@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'User',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = profileId,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = unique + '@example.com'
        );
    }

    private static Case buildCase(Id accId, Case_Routing_Config__mdt metaData, String subject) {
        return new Case(
            AccountId = accId,
            Priority = 'Low',
            Case_Request__c = metaData.Request_Type__c,
            Status_Filtered__c = 'New',
            Origin = 'Web',
            Subject = subject,
            SLA_Time__c = 9,
            Close_Date__c = System.today(),
            Case_Assignment_Queue__c = metaData.Queue__c,
            Case_Category__c = 'New Digital Support'
        );
    }

    private static List<Case> queryCases(Set<Id> caseIds) {
        return [SELECT Id, OwnerId, Case_Assign_To__c, Case_Assignment_Queue__c, Case_Request__c, Status_Filtered__c
                FROM Case WHERE Id IN :caseIds];
    }

    @IsTest
    static void testCaseAssignment() {

        Profile profile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];

        User queueUser = buildUser(profile.Id, 'quser');
        User creatorUser = buildUser(profile.Id, 'cuser');
        insert new List<User>{ queueUser, creatorUser };

        List<Case_Routing_Config__mdt> metaDataList = [
            SELECT Id, Request_Type__c, Queue__c, Case_Entry__c, Initial_Assignment__c, Field_Name__c
            FROM Case_Routing_Config__mdt
            WHERE Case_Entry__c = 'Auto'
              AND Active__c = true
              AND Case_Type__c = 'Non Hybrid'
              AND Initial_Assignment__c = 'Queue'
              AND Queue__c != null
              AND Request_Type__c != null
            LIMIT 1
        ];
        System.assert(!metaDataList.isEmpty(),
            'Test requires active Auto / Non Hybrid / Queue metadata');
        Case_Routing_Config__mdt metaData = metaDataList[0];

        List<Group> queues = [SELECT Id FROM Group WHERE Name = :metaData.Queue__c AND Type = 'Queue' LIMIT 1];
        System.assert(!queues.isEmpty(), 'No Queue found with Name = ' + metaData.Queue__c);
        insert new GroupMember(GroupId = queues[0].Id, UserOrGroupId = queueUser.Id);

        Set<Id> queueMemberIds = new Set<Id>();
        for (GroupMember gm : [SELECT UserOrGroupId FROM GroupMember WHERE GroupId = :queues[0].Id]) {
            queueMemberIds.add(gm.UserOrGroupId);
        }

        System.runAs(creatorUser) {

            // MODIFIED: Removed three user lookup fields
            Account a = new Account(
                Name = 'Demo Account',
                FNDN_Billed_Through_TVM__c = false
            );
            insert a;

            List<Case> firstCases = new List<Case>{
                buildCase(a.Id, metaData, 'Test Case 1'),
                buildCase(a.Id, metaData, 'Test Case 2')
            };
            insert firstCases;

            Case laterCase = buildCase(a.Id, metaData, 'Test Case 3');

            Test.setMock(HttpCalloutMock.class, new DummyHttpCalloutMock());

            Test.startTest();
                CaseAssignmentBatch batch = new CaseAssignmentBatch();
                batch.start(null);

                batch.execute(null, queryCases(new Map<Id, Case>(firstCases).keySet()));

                insert laterCase;
                batch.execute(null, queryCases(new Set<Id>{ laterCase.Id }));

                batch.finish(null);
            Test.stopTest();

            Set<Id> allIds = new Map<Id, Case>(firstCases).keySet().clone();
            allIds.add(laterCase.Id);

            List<Case> updatedCases = queryCases(allIds);
            System.assertEquals(3, updatedCases.size(), 'All cases should exist');

            for (Case c : updatedCases) {
                System.assert(queueMemberIds.contains(c.OwnerId),
                    'Case ' + c.Id + ' should be assigned to a member of queue ' + metaData.Queue__c);
                System.assertEquals(c.OwnerId, c.Case_Assign_To__c, 'Case_Assign_To__c should match OwnerId');
                System.assertEquals(metaData.Queue__c, c.Case_Assignment_Queue__c, 'Queue should match metadata queue');
            }
        }
    }

    @IsTest
    static void testBatchRuns() {
        Test.setMock(HttpCalloutMock.class, new DummyHttpCalloutMock());
        Test.startTest();
            Database.executeBatch(new CaseAssignmentBatch(), 50);
        Test.stopTest();
        System.assert(true, 'Batch should run without errors');
    }
}
```

## History

| Date | Change |
|---|---|
| 2026-10-12 | Documented from the org version of that date. |
| 2026-10-16 | Updated to the 2026-10-16 org version. Comments removed, and three Account user-lookup fields removed from the test data. **No OOO test case yet.** |
