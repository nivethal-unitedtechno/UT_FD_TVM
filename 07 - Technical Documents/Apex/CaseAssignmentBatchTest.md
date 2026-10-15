# Apex Test Class: CaseAssignmentBatchTest

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `CaseAssignmentBatchTest` |
| Type | Apex Test Class |
| API Version | 65.0 |
| Status | Active |
| Lines | 148 |

## Related Components

Tests: [CaseAssignmentBatch](CaseAssignmentBatch.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 40 | `Case_Category__c = 'New Digital Support'` |

## Source

```apex
@IsTest
public class CaseAssignmentBatchTest {

    // Inner mock class to handle any HTTP callouts triggered by triggers/flows/etc
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
            Case_Assignment_Queue__c = metaData.Queue__c, // must match the metadata queue name
            Case_Category__c = 'New Digital Support'
        );
    }

    private static List<Case> queryCases(Set<Id> caseIds) {
        return [SELECT Id, OwnerId, Case_Assign_To__c, Case_Assignment_Queue__c, Case_Request__c, Status_Filtered__c
                FROM Case WHERE Id IN :caseIds];
    }

    // Calls start/execute/finish directly so the assignment logic is covered no matter
    // what the start() query returns in the test org.
    @IsTest
    static void testCaseAssignment() {

        Profile profile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];

        // queueUser  -> member of the queue, receives the assignments
        // creatorUser -> NOT in the queue, creates the Cases (so they start owned by a non-member)
        User queueUser = buildUser(profile.Id, 'quser');
        User creatorUser = buildUser(profile.Id, 'cuser');
        insert new List<User>{ queueUser, creatorUser };

        // Metadata that drives the batch (custom metadata is visible in tests without seeAllData)
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
            'Test requires at least one active Case_Routing_Config__mdt with Auto / Non Hybrid / Queue');
        Case_Routing_Config__mdt metaData = metaDataList[0];

        // The batch looks the queue up by Name = Queue__c, so use the real queue from the metadata
        List<Group> queues = [SELECT Id FROM Group WHERE Name = :metaData.Queue__c AND Type = 'Queue' LIMIT 1];
        System.assert(!queues.isEmpty(), 'No Queue found with Name = ' + metaData.Queue__c);
        insert new GroupMember(GroupId = queues[0].Id, UserOrGroupId = queueUser.Id);

        Set<Id> queueMemberIds = new Set<Id>();
        for (GroupMember gm : [SELECT UserOrGroupId FROM GroupMember WHERE GroupId = :queues[0].Id]) {
            queueMemberIds.add(gm.UserOrGroupId);
        }

        // runAs avoids MIXED_DML_OPERATION (User/GroupMember are setup objects, Case/Account are not)
        System.runAs(creatorUser) {

            Account a = new Account(
                Name = 'Demo Account',
                Regional_Performance_Manager__c = creatorUser.Id,
                Account_Technician__c = creatorUser.Id,
                Secondary_Account_Technician__c = creatorUser.Id,
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

                // Run 1: no previous cases owned by queue members -> "no last assigned user" branch
                batch.execute(null, queryCases(new Map<Id, Case>(firstCases).keySet()));

                // Run 2: Cases 1 and 2 are now owned by queue members -> "rotate from last assigned user" branch
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

    // Runs the batch through Database.executeBatch so the start() query itself is executed
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
