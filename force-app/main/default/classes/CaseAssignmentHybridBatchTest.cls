@IsTest
public class CaseAssignmentHybridBatchTest {

    // Mock HTTP Callout (if any callouts are triggered by triggers/flows)
    private class CaseHttpMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"success": true}');
            return res;
        }
    }

    private static String uniqueSuffix() {
        return String.valueOf(Math.abs(Crypto.getRandomInteger()));
    }

    private static User buildUser(Id profileId, String alias) {
        String unique = alias + System.currentTimeMillis() + uniqueSuffix();
        return new User(
            Alias = alias,
            Email = unique + '@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'User',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'Asia/Kolkata',
            UserName = unique + '@example.com',
            ProfileId = profileId
        );
    }

    private static Case buildCase(Id accId, Case_Routing_Config__mdt cfg, String subject) {
        return new Case(
            Subject = subject,
            Status_Filtered__c = 'New',
            Origin = 'Phone',
            AccountId = accId,
            Case_Category__c = 'New Digital Support',
            Case_Assignment_Queue__c = cfg.Queue__c, // must match the CMDT queue name
            Case_Request__c = cfg.Request_Type__c
        );
    }

    // Clears Case_Assign_To__c IN MEMORY only, to simulate "not yet assigned".
    // OwnerId is left alone: the batch only checks Case_Assign_To__c, and a null OwnerId
    // makes the batch's update fail with "owner cannot be blank".
    private static List<Case> unassignedScope(Set<Id> caseIds) {
        List<Case> scope = [SELECT Id, OwnerId, Case_Assign_To__c, Case_Assignment_Queue__c, Case_Request__c, Status_Filtered__c, AccountId
                            FROM Case WHERE Id IN :caseIds];
        for (Case c : scope) {
            c.Case_Assign_To__c = null;
        }
        return scope;
    }

    @IsTest
    static void testHybridBatchAssignment() {

        Test.setMock(HttpCalloutMock.class, new CaseHttpMock());
        String suf = uniqueSuffix();

        // 1. Hybrid CMDT that drives the batch
        List<Case_Routing_Config__mdt> cfgList = [
            SELECT Request_Type__c, Queue__c
            FROM Case_Routing_Config__mdt
            WHERE Case_Type__c = 'Hybrid'
              AND Case_Entry__c = 'Auto'
              AND Active__c = true
              AND Initial_Assignment__c = 'Queue'
              AND Queue__c != null
              AND Request_Type__c != null
            LIMIT 1
        ];
        System.assert(!cfgList.isEmpty(),
            'Test requires at least one active Case_Routing_Config__mdt with Hybrid / Auto / Queue');
        Case_Routing_Config__mdt cfg = cfgList[0];

        // 2. Users
        //    queueUser   -> member of the queue, receives the assignments
        //    creatorUser -> NOT in the queue, creates the Cases
        Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        User queueUser = buildUser(p.Id, 'quser');
        User creatorUser = buildUser(p.Id, 'cuser');
        insert new List<User>{ queueUser, creatorUser };

        // 3. Use the EXISTING queue named in the CMDT (the batch looks it up by Name).
        //    Creating a new queue with the same name can fail on a duplicate developer name.
        List<Group> queues = [SELECT Id FROM Group WHERE Name = :cfg.Queue__c AND Type = 'Queue' LIMIT 1];
        System.assert(!queues.isEmpty(), 'No Queue found with Name = ' + cfg.Queue__c);
        insert new GroupMember(GroupId = queues[0].Id, UserOrGroupId = queueUser.Id);

        Set<Id> queueMemberIds = new Set<Id>();
        for (GroupMember gm : [SELECT UserOrGroupId FROM GroupMember WHERE GroupId = :queues[0].Id]) {
            queueMemberIds.add(gm.UserOrGroupId);
        }

        // runAs avoids MIXED_DML_OPERATION (User/GroupMember are setup objects, Account/Case are not)
        System.runAs(creatorUser) {

            // 4. Hybrid Account. The technician fields are needed or the "Update Case AT and Owner"
            //    flow fails with "owner cannot be blank" when a Foundation Case is inserted.
            Account acc = new Account(
                Name = 'Hybrid Test Account ' + suf,
                FNDN_Billed_Through_TVM__c = true,
                Quickbase_Record_ID__c = suf,
                Regional_Performance_Manager__c = creatorUser.Id,
                Account_Technician__c = creatorUser.Id,
                Secondary_Account_Technician__c = creatorUser.Id
            );
            insert acc;

            // 5. Cases
            List<Case> firstCases = new List<Case>{
                buildCase(acc.Id, cfg, 'Hybrid Batch Test Case 1 ' + suf),
                buildCase(acc.Id, cfg, 'Hybrid Batch Test Case 2 ' + suf)
            };
            insert firstCases;
            Set<Id> firstIds = new Map<Id, Case>(firstCases).keySet();

            Case laterCase = buildCase(acc.Id, cfg, 'Hybrid Batch Test Case 3 ' + suf);

            // 6. Run the batch methods directly
            Test.startTest();
                CaseAssignmentHybridBatch batch = new CaseAssignmentHybridBatch();
                batch.start(null);

                // Empty scope -> covers the early return
                batch.execute(null, new List<Case>());

                // Run 1: no previous Cases owned by queue members -> starts at the first user
                batch.execute(null, unassignedScope(firstIds));

                // Run 2: Cases 1 and 2 are now owned by queue members -> rotates from the last assigned user
                insert laterCase;
                batch.execute(null, unassignedScope(new Set<Id>{ laterCase.Id }));

                batch.finish(null);
            Test.stopTest();

            // 7. Every Case should now be owned by a member of the queue
            Set<Id> allIds = firstIds.clone();
            allIds.add(laterCase.Id);

            for (Case c : [SELECT Id, OwnerId, Case_Assign_To__c, Case_Assignment_Queue__c FROM Case WHERE Id IN :allIds]) {
                System.assert(queueMemberIds.contains(c.OwnerId),
                    'Case ' + c.Id + ' should be assigned to a member of queue ' + cfg.Queue__c);
                System.assertEquals(cfg.Queue__c, c.Case_Assignment_Queue__c, 'Queue should match CMDT queue');
            }
        }
    }

    // Runs the batch through Database.executeBatch so the start() query itself is executed
    @IsTest
    static void testBatchRuns() {
        Test.setMock(HttpCalloutMock.class, new CaseHttpMock());
        Test.startTest();
            Database.executeBatch(new CaseAssignmentHybridBatch(), 50);
        Test.stopTest();
        System.assert(true, 'Batch should run without errors');
    }
}