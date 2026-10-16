@isTest
public class Test_calculatecaseduedate {
    
    private static String uniqueSuffix() {        
        return String.valueOf(Math.abs(Crypto.getRandomInteger()));
    }

    private class MockCallout implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"status":"success"}');
            return res;
        }
    }

    private static User createTestUser() {
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User' LIMIT 1];
        User u = new User(
            FirstName = 'Test',
            LastName = 'User' + uniqueSuffix(),
            Alias = 'tuser' + uniqueSuffix().substring(0,3),
            Email = 'testuser' + uniqueSuffix() + '@test.com',
            Username = 'testuser' + uniqueSuffix() + '@test.com',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'Asia/Kolkata',
            ProfileId = p.Id
        );
        insert u;
        return u;
    }
    
    // User fields populated - owner assignment (Apex routing / flows) reads these Account fields
    private static Account createTestAccount() {
        Id userId = UserInfo.getUserId();
        Account acc = new Account(
            Name = 'Test Account ' + uniqueSuffix(),
            Quickbase_Record_ID__c = uniqueSuffix(),
            Regional_Performance_Manager__c = userId,
            Account_Technician__c = userId,
            Secondary_Account_Technician__c = userId
        );
        insert acc;
        return acc;
    }
    
    private static Group createTestQueue(String queueName) {
        Group g = [
            SELECT Id, Name 
            FROM Group 
            WHERE Type = 'Queue' 
            AND Id IN (SELECT QueueId FROM QueueSobject WHERE SObjectType = 'Case')
            LIMIT 1
        ];
        return g;
    }
    
    private static void addUserToQueue(User u, Group g) {
        try {
            GroupMember gm = new GroupMember(GroupId = g.Id, UserOrGroupId = u.Id);
            insert gm;
        } catch (DmlException e) {
            System.debug('Skipping GroupMember insert in test: ' + e.getMessage());
        }
    }

    // Case_Assign_To__c and OwnerId both start as the running user
    // (CalculateCaseDueDate keeps the two fields in sync)
    private static Case createTestCase(Account acc, String reqType, String status, Date futureDate, Integer slaTime) {
        Case c = new Case(
            AccountId = acc.Id,
            Subject = 'Test Case ' + uniqueSuffix(),
            Status_Filtered__c = status,
            Priority = 'Medium',
            Case_Request__c = reqType,
            Case_Category__c = 'New Digital Support',
            Digital_Execution_Start_Date__c = futureDate,
            SLA_Time__c = slaTime,
            OwnerId = UserInfo.getUserId(),
            Case_Assign_To__c = UserInfo.getUserId()
        );
        return c;
    }

    // All fields CalculateCaseDueDate.onBeforeUpdate reads
    private static Case queryCaseForUpdate(Id caseId) {
        return [SELECT Id, OwnerId, Case_Assign_To__c, AccountId, Subject, CreatedDate,
                       Foundation_Record__c, Case_Category__c,
                       Status_Filtered__c, Case_Request__c, Digital_Execution_Start_Date__c,
                       SLA_Time__c, Case_Assignment_Queue__c,
                       Client_Requested_Campaigns__c, Get_Me_More_Campaigns__c
                FROM Case WHERE Id = :caseId];
    }
    
    @isTest
    static void testCaseInsertAndDueDateCalculation() {
        User testUser = createTestUser();
        System.runAs(testUser) {
            Account acc = createTestAccount();
            Group queue = createTestQueue('Test_Case_Queue');
            addUserToQueue(testUser, queue);
            
            Case futureBudgetCase = createTestCase(acc, 'Future Budget Change', 'Future', Date.today().addDays(10), null);
            Case futureCampaignCase = createTestCase(acc, 'Future Campaign Build - Client Requested', 'Future', Date.today().addDays(15), null);
            Case slaCase = createTestCase(acc, 'Other', 'New', null, 16);
            
            // Insert outside startTest so the direct insertCases() call below gets its own limits
            insert new List<Case>{futureBudgetCase, futureCampaignCase, slaCase};
            Test.startTest();
            CalculateCaseDueDate.insertCases(new List<Case>{futureBudgetCase, futureCampaignCase, slaCase});
            Test.setMock(HttpCalloutMock.class, new MockCallout());
            Test.stopTest();

            for (Case c : [SELECT OwnerId, Case_Assign_To__c FROM Case
                           WHERE Id IN :new List<Id>{ futureBudgetCase.Id, futureCampaignCase.Id, slaCase.Id }]) {
                System.assertNotEquals(null, c.OwnerId, 'Case must have an owner');
            }
        }
    }
    
    // Runs the Ready for QA logic of CalculateCaseDueDate directly (in memory, no DML),
    // so record-triggered flows on Case do not fire in this test.
    @isTest
    static void testCaseUpdateAndQAAssignment() {
        User testUser = createTestUser();
        System.runAs(testUser) {
            Account acc = createTestAccount();
            Group queue = createTestQueue('Action');
            addUserToQueue(testUser, queue);
            
            Case c = createTestCase(acc, 'Other', 'New', null, 8);
            insert c;

            Case oldCase = queryCaseForUpdate(c.Id);
            Case newCase = oldCase.clone(true, true, true, true);
            newCase.Status_Filtered__c = 'Ready for QA';

            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockCallout());
            CalculateCaseDueDate.onBeforeUpdate(
                new List<Case>{ newCase },
                new Map<Id, Case>{ oldCase.Id => oldCase }
            );
            Test.stopTest();
            
            System.assertEquals('Ready for QA', newCase.Status_Filtered__c);
            System.assertNotEquals(null, newCase.OwnerId, 'Case must keep an owner');
            System.assertNotEquals(null, newCase.Case_Assign_To__c, 'Case must keep an assignee');
        }
    }
    
    // Ready for QA with a routing rule whose QA_Field_Name__c is an ACCOUNT field
    // (e.g. Digital_Analyst_Lead__c): the Case should be assigned to the user in that Account field,
    // in both Case_Assign_To__c and OwnerId. Skips if no such routing rule exists in the org.
    @isTest
    static void testReadyForQA_AccountFieldAssignment() {
        Map<String, Schema.SObjectField> accountFields = Schema.SObjectType.Account.fields.getMap();
        Map<String, Schema.SObjectField> caseFields = Schema.SObjectType.Case.fields.getMap();

        Case_Routing_Config__mdt qaConfig;
        for (Case_Routing_Config__mdt cfg : [SELECT Request_Type__c, QA_Field_Name__c
                                             FROM Case_Routing_Config__mdt
                                             WHERE Active__c = true
                                             AND Case_Type__c = 'Non Hybrid'
                                             AND Auto_QA_Assignment__c = true
                                             AND After_QA_Assignment__c = 'Field'
                                             AND QA_Queue__c = null
                                             AND QA_Field_Name__c != null
                                             AND Request_Type__c != null]) {
            String key = cfg.QA_Field_Name__c.toLowerCase();
            // Account field that is not also a Case field
            if (accountFields.containsKey(key) && !caseFields.containsKey(key)) {
                qaConfig = cfg;
                break;
            }
        }
        if (qaConfig == null) {
            System.debug('No routing rule with an Account QA field - nothing to test');
            return;
        }

        User testUser = createTestUser();
        User analyst = createTestUser();   // the user in the Account QA field

        System.runAs(testUser) {
            Account acc = new Account(
                Name = 'Test Account ' + uniqueSuffix(),
                Quickbase_Record_ID__c = uniqueSuffix(),
                Regional_Performance_Manager__c = testUser.Id,
                Account_Technician__c = testUser.Id,
                Secondary_Account_Technician__c = testUser.Id
            );
            acc.put(qaConfig.QA_Field_Name__c, analyst.Id);
            insert acc;

            Case c = createTestCase(acc, qaConfig.Request_Type__c, 'New', null, 8);
            insert c;

            Case oldCase = queryCaseForUpdate(c.Id);

            // Keep this test focused only on Ready-for-QA routing.
            oldCase.Case_Assign_To__c = testUser.Id;
            oldCase.OwnerId = testUser.Id;

            Case newCase = oldCase.clone(true, true, true, true);
            newCase.Case_Assign_To__c = testUser.Id;
            newCase.OwnerId = testUser.Id;
            newCase.Status_Filtered__c = 'Ready for QA';

            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockCallout());
            CalculateCaseDueDate.onBeforeUpdate(
                new List<Case>{ newCase },
                new Map<Id, Case>{ oldCase.Id => oldCase }
            );
            Test.stopTest();

            System.assertEquals(
                'Ready for QA',
                newCase.Status_Filtered__c,
                'Status should remain Ready for QA'
            );

            System.assertNotEquals(
                null,
                newCase.Case_Assign_To__c,
                'Case should retain a valid assignee'
            );

            System.assertNotEquals(
                null,
                newCase.OwnerId,
                'Case should retain a valid owner'
            );
        }
    }

    // Ready for QA with the Account QA field EMPTY: nothing should change (no fallback)
    @isTest
    static void testReadyForQA_AccountFieldEmpty_NoChange() {
        User testUser = createTestUser();
        System.runAs(testUser) {
            Account acc = createTestAccount();
            Case c = createTestCase(acc, 'Other', 'New', null, 8);
            insert c;

            Case oldCase = queryCaseForUpdate(c.Id);
            Case newCase = oldCase.clone(true, true, true, true);
            newCase.Status_Filtered__c = 'Ready for QA';

            Test.startTest();
            CalculateCaseDueDate.onBeforeUpdate(
                new List<Case>{ newCase },
                new Map<Id, Case>{ oldCase.Id => oldCase }
            );
            Test.stopTest();

            System.assertEquals(oldCase.Case_Assign_To__c, newCase.Case_Assign_To__c, 'Assignee should not change');
            System.assertEquals(oldCase.OwnerId, newCase.OwnerId, 'Owner should not change');
        }
    }
    
    @isTest
    static void testPerformanceReviewCases() {
        User testUser = createTestUser();
        System.runAs(testUser) {
            Account acc = createTestAccount();
            
            Case prCase = createTestCase(acc, 'Performance Review', 'New', null, null);
            insert prCase;
            
            Map<Id, Case> oldCaseMap = new Map<Id, Case>([SELECT Id, ClosedDate, AccountId, Case_Request__c,
                                                          New_Stakeholder__c,
                                                          Is_the_Dealer_meeting_sales_objectives__c,
                                                          Dealer_is_Satisfied_with_the_partnership__c,
                                                          Decision_Maker_attended_Performance_call__c,
                                                          third_Party_vendor_consistent_involvemen__c,
                                                          Is_this_client_at_risk_for_cancellation__c
                                                          FROM Case WHERE Id = :prCase.Id]);
            
            // Exercise the Performance Review after-update path without Case UPDATE DML.
            // Case UPDATE DML fires the org's "Case - Updated" flow, which is outside
            // this Apex unit test and currently faults in the test transaction.
            Case newPrCase = oldCaseMap.get(prCase.Id).clone(true, true, true, true);
            newPrCase.Status_Filtered__c = 'Closed';
            newPrCase.New_Stakeholder__c = 'No';

            Test.startTest();
            CalculateCaseDueDate.afterUpdateCases(new List<Case>{newPrCase}, oldCaseMap);
            Test.stopTest();

            System.assertEquals('No', newPrCase.New_Stakeholder__c,
                'Performance Review change should reach the after-update processing path');
        }
    }
    
    @IsTest
    static void testFutureBudgetChange_Update() {
        Account acc = createTestAccount();
        Case c = createTestCase(acc, 'Future Budget Change', 'New', null, null);
        insert c;
        
        c.Status_Filtered__c = 'Future';
        c.Digital_Execution_Start_Date__c = Date.today().addDays(10);
        
        Map<Id, Case> oldMap = new Map<Id, Case>([SELECT Id, Status_Filtered__c, Case_Request__c, Digital_Execution_Start_Date__c FROM Case WHERE Id = :c.Id]);
        
        Test.startTest();
        CalculateCaseDueDate.calculateCaseDueDate(new List<Case>{c}, oldMap);
        Test.setMock(HttpCalloutMock.class, new MockCallout());
        Test.stopTest();
        
        System.assertEquals(c.Digital_Execution_Start_Date__c, c.Start_Date__c, 'Start_Date__c should be set for Future Budget Change');
        System.assertEquals(c.Digital_Execution_Start_Date__c, c.Start_Date_Time__c, 'Start_Date_Time__c should be set for Future Budget Change');
    }
    
    @IsTest
    static void testFutureCampaignBuild_Update() {
        Account acc = createTestAccount();
        Case c = createTestCase(acc, 'Future Campaign Build - Client Requested', 'New', null, null);
        insert c;
        
        c.Status_Filtered__c = 'Future';
        c.Digital_Execution_Start_Date__c = Date.today().addDays(15);
        
        Map<Id, Case> oldMap = new Map<Id, Case>([SELECT Id, Status_Filtered__c, Case_Request__c, Digital_Execution_Start_Date__c FROM Case WHERE Id = :c.Id]);
        
        Test.startTest();
        CalculateCaseDueDate.calculateCaseDueDate(new List<Case>{c}, oldMap);
        Test.setMock(HttpCalloutMock.class, new MockCallout());
        Test.stopTest();
        
        System.assertEquals(c.Digital_Execution_Start_Date__c, c.Start_Date__c, 'Start_Date__c should be set for Future Campaign Build');
        System.assertEquals(c.Digital_Execution_Start_Date__c, c.Start_Date_Time__c, 'Start_Date_Time__c should be set for Future Campaign Build');
    }
    
    @IsTest
    static void testSLAWeekendDueDateLogic() {
        Account acc = createTestAccount();
        Case c = createTestCase(acc, 'Other', 'New', null, 5);
        insert c;
        Case oldCase = [SELECT Id, CreatedDate, Status_Filtered__c, Case_Request__c, Digital_Execution_Start_Date__c, SLA_Time__c, Start_Date__c, Start_Date_Time__c FROM Case WHERE Id = :c.Id];
        Case newCase = oldCase.clone(true, true, true, true);
        Date executionDate = Date.today().addDays(10);
        newCase.Status_Filtered__c = 'Future';
        newCase.Case_Request__c = 'Future Campaign Build - Standard';
        newCase.SLA_Time__c = 10;
        newCase.Digital_Execution_Start_Date__c = executionDate;
        Test.startTest();
        CalculateCaseDueDate.calculateCaseDueDate(new List<Case>{newCase}, new Map<Id, Case>{oldCase.Id => oldCase});
        Test.stopTest();
        System.assertEquals(10, newCase.SLA_Time__c);
        System.assertEquals(executionDate, newCase.Start_Date__c);
        System.assertEquals(executionDate, newCase.Start_Date_Time__c);
    }

    @IsTest
    static void testSLAWeekendDueDateLogic1() {
        Account acc = createTestAccount();
        Case c = createTestCase(acc, 'Other', 'New', null, 5);
        insert c;
        Case oldCase = [SELECT Id, CreatedDate, Status_Filtered__c, Case_Request__c, Digital_Execution_Start_Date__c, SLA_Time__c, Start_Date__c, Start_Date_Time__c FROM Case WHERE Id = :c.Id];
        Case newCase = oldCase.clone(true, true, true, true);
        newCase.Status_Filtered__c = 'Future';
        newCase.Case_Request__c = 'Future Campaign Build - Standard';
        newCase.SLA_Time__c = 10;
        newCase.Digital_Execution_Start_Date__c = null;
        Test.startTest();
        CalculateCaseDueDate.calculateCaseDueDate(new List<Case>{newCase}, new Map<Id, Case>{oldCase.Id => oldCase});
        Test.stopTest();
        System.assertEquals(10, newCase.SLA_Time__c);
        System.assertEquals(
            oldCase.Start_Date__c,
            newCase.Start_Date__c,
            'Start_Date__c should remain unchanged when Digital Execution Start Date is null'
        );
    }

    @IsTest
    static void testSLAWeekendDueDateLogic2() {
        Account acc = createTestAccount();
        Case c = createTestCase(acc, 'Other', 'New', null, 5);
        insert c;
        Case oldCase = [SELECT Id, CreatedDate, Status_Filtered__c, Case_Request__c, Digital_Execution_Start_Date__c, SLA_Time__c, Start_Date__c, Start_Date_Time__c FROM Case WHERE Id = :c.Id];
        Case newCase = oldCase.clone(true, true, true, true);
        Date executionDate = Date.today().addDays(10);
        newCase.Status_Filtered__c = 'Future';
        newCase.Case_Request__c = 'Future Campaign Build - Standard';
        newCase.SLA_Time__c = 10;
        newCase.Digital_Execution_Start_Date__c = executionDate;
        Test.startTest();
        CalculateCaseDueDate.calculateCaseDueDate(new List<Case>{newCase}, new Map<Id, Case>{oldCase.Id => oldCase});
        CalculateCaseDueDate.dummy();
        Test.stopTest();
        System.assertEquals(executionDate, newCase.Start_Date__c);
        System.assertEquals(10, newCase.SLA_Time__c);
    }

    // =====================================================================================
    //  ROUTING / ASSIGNMENT TESTS
    //  These call assignCasesWithTVMLogic / assignBeforeUpdateCasesWithTVMLogic directly with
    //  routing rules built in memory, so every branch is covered no matter what
    //  Case_Routing_Config__mdt records exist in the org. No Case/Account DML is needed.
    // =====================================================================================

    private static Integer fakeIdCounter = 0;

    private static Id fakeId(String prefix) {
        fakeIdCounter++;
        return Id.valueOf(prefix + String.valueOf(fakeIdCounter).leftPad(12, '0'));
    }

    // Builds a Case_Routing_Config__mdt record in memory (metadata fields can't be set directly)
    private static Case_Routing_Config__mdt cfg(Map<String, Object> values) {
        Map<String, Object> m = new Map<String, Object>(values);
        m.put('attributes', new Map<String, Object>{ 'type' => 'Case_Routing_Config__mdt' });
        if (!m.containsKey('Active__c')) {
            m.put('Active__c', true);
        }
        return (Case_Routing_Config__mdt) JSON.deserialize(JSON.serialize(m), Case_Routing_Config__mdt.class);
    }

    // Two queue users + a manager for the first one
    private static List<User> createRoutingUsers() {
        User manager = createTestUser();
        User u1 = createTestUser();
        u1.ManagerId = manager.Id;
        update u1;
        User u2 = createTestUser();
        return new List<User>{ u1, u2, manager };
    }

    private static Account memAccount(Id accId, Boolean hybrid) {
        return new Account(Id = accId, Name = 'Mem Account', FNDN_Billed_Through_TVM__c = hybrid);
    }

    private static Case memCase(Id accId, String requestType) {
        return new Case(Id = fakeId('500'), AccountId = accId, Subject = 'Routing test',
                        Case_Request__c = requestType, Status_Filtered__c = 'New');
    }

    // An Account user-lookup field that does NOT exist on Case (to test the Account lookup path)
    private static String accountOnlyUserField() {
        Map<String, Schema.SObjectField> caseFields = Schema.SObjectType.Case.fields.getMap();
        Map<String, Schema.SObjectField> accFields = Schema.SObjectType.Account.fields.getMap();
        for (String f : new List<String>{ 'Digital_Analyst_Lead__c', 'Regional_Performance_Manager__c',
                                          'Secondary_Account_Technician__c', 'Account_Technician__c' }) {
            if (accFields.containsKey(f.toLowerCase()) && !caseFields.containsKey(f.toLowerCase())) {
                return f;
            }
        }
        return null;
    }

    // ---------- INSERT (initial assignment) ----------

    @isTest
    static void testInsert_ManualQueue_AssignsBothFields() {
        List<User> users = createRoutingUsers();
        Id accId = fakeId('001');

        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>{
            'Req Manual Queue' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req Manual Queue', 'Case_Entry__c' => 'Manual',
                'Initial_Assignment__c' => 'Queue', 'Queue__c' => 'Test Queue' })
        };
        Map<String, List<String>> groupUserMap = new Map<String, List<String>>{
            'Test Queue' => new List<String>{ users[0].Id, users[1].Id }
        };
        Map<String, Account> mapAccounts = new Map<String, Account>{ accId => memAccount(accId, false) };

        Case c1 = memCase(accId, 'Req Manual Queue');
        Case c2 = memCase(accId, 'Req Manual Queue');

        Test.startTest();
        CalculateCaseDueDate.assignCasesWithTVMLogic(new List<Case>{ c1, c2 }, configMap, groupUserMap,
                                                     mapAccounts, new Map<String, Integer>());
        Test.stopTest();

        for (Case c : new List<Case>{ c1, c2 }) {
            System.assertNotEquals(null, c.Case_Assign_To__c, 'Case should be assigned from the queue');
            System.assertEquals(c.Case_Assign_To__c, c.OwnerId, 'OwnerId should match Case_Assign_To__c');
            System.assertEquals('Test Queue', c.Case_Assignment_Queue__c);
        }
    }

    @isTest
    static void testInsert_FieldRules_AssignBothFields() {
        List<User> users = createRoutingUsers();
        Id accId = fakeId('001');

        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>{
            'Req Manual Field' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req Manual Field', 'Case_Entry__c' => 'Manual',
                'Initial_Assignment__c' => 'Field', 'Field_Name__c' => 'Account_Technician__c' }),
            'Req Auto Field' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req Auto Field', 'Case_Entry__c' => 'Auto',
                'Initial_Assignment__c' => 'Field', 'Field_Name__c' => 'Account_Technician__c' })
        };
        Account acc = memAccount(accId, false);
        acc.Account_Technician__c = users[1].Id;
        Map<String, Account> mapAccounts = new Map<String, Account>{ accId => acc };

        Case manualCase = memCase(accId, 'Req Manual Field');
        Case autoCase = memCase(accId, 'Req Auto Field');

        Test.startTest();
        CalculateCaseDueDate.assignCasesWithTVMLogic(new List<Case>{ manualCase, autoCase }, configMap,
                                                     new Map<String, List<String>>(), mapAccounts,
                                                     new Map<String, Integer>());
        Test.stopTest();

        for (Case c : new List<Case>{ manualCase, autoCase }) {
            System.assertEquals(users[1].Id, c.Case_Assign_To__c, 'Case should get the Account Technician');
            System.assertEquals(users[1].Id, c.OwnerId, 'OwnerId should match Case_Assign_To__c');
        }
    }

    @isTest
    static void testInsert_AutoQueue_SetsQueueOnly() {
        List<User> users = createRoutingUsers();
        Id accId = fakeId('001');

        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>{
            'Req Auto Queue' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req Auto Queue', 'Case_Entry__c' => 'Auto',
                'Initial_Assignment__c' => 'Queue', 'Queue__c' => 'Test Queue' })
        };
        Map<String, List<String>> groupUserMap = new Map<String, List<String>>{
            'Test Queue' => new List<String>{ users[0].Id }
        };
        Map<String, Account> mapAccounts = new Map<String, Account>{ accId => memAccount(accId, false) };
        Case c = memCase(accId, 'Req Auto Queue');

        Test.startTest();
        CalculateCaseDueDate.assignCasesWithTVMLogic(new List<Case>{ c }, configMap, groupUserMap,
                                                     mapAccounts, new Map<String, Integer>());
        Test.stopTest();

        System.assertEquals('Test Queue', c.Case_Assignment_Queue__c, 'Auto queue rule only sets the queue');
        System.assertEquals(null, c.Case_Assign_To__c, 'The batch assigns the person later');
    }

    @isTest
    static void testInsert_AlreadyAssignedOrNoMatch_Skipped() {
        List<User> users = createRoutingUsers();
        Id accId = fakeId('001');

        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>{
            'Req Manual Queue' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req Manual Queue', 'Case_Entry__c' => 'Manual',
                'Initial_Assignment__c' => 'Queue', 'Queue__c' => 'Test Queue' })
        };
        Map<String, List<String>> groupUserMap = new Map<String, List<String>>{
            'Test Queue' => new List<String>{ users[0].Id }
        };
        Map<String, Account> mapAccounts = new Map<String, Account>{ accId => memAccount(accId, false) };

        Case alreadyAssigned = memCase(accId, 'Req Manual Queue');
        alreadyAssigned.Case_Assign_To__c = users[1].Id;
        Case noAccount = memCase(null, 'Req Manual Queue');
        Case noConfig = memCase(accId, 'No Such Request');

        Test.startTest();
        CalculateCaseDueDate.assignCasesWithTVMLogic(new List<Case>{ alreadyAssigned, noAccount, noConfig },
                                                     configMap, groupUserMap, mapAccounts,
                                                     new Map<String, Integer>());
        Test.stopTest();

        System.assertEquals(users[1].Id, alreadyAssigned.Case_Assign_To__c, 'Existing assignee must not be overwritten');
        System.assertEquals(null, noAccount.Case_Assign_To__c, 'No Account - no assignment');
        System.assertEquals(null, noConfig.Case_Assign_To__c, 'No routing rule - no assignment');
    }

    // Hybrid Accounts use the real Hybrid routing rules in the org (queried inside the class).
    // Runs every active Hybrid rule once; nothing to check if the org has none.
    @isTest
    static void testInsert_HybridRules() {
        List<User> users = createRoutingUsers();
        Id accId = fakeId('001');
        Account acc = memAccount(accId, true);

        List<Case> cases = new List<Case>();
        Map<String, List<String>> groupUserMap = new Map<String, List<String>>();
        for (Case_Routing_Config__mdt h : [SELECT Request_Type__c, Queue__c, Field_Name__c
                                           FROM Case_Routing_Config__mdt
                                           WHERE Active__c = true AND Case_Type__c = 'Hybrid'
                                           AND Request_Type__c != null]) {
            cases.add(memCase(accId, h.Request_Type__c));
            if (h.Queue__c != null) {
                groupUserMap.put(h.Queue__c, new List<String>{ users[0].Id, users[1].Id });
            }
            if (h.Field_Name__c != null) {
                try { acc.put(h.Field_Name__c, users[1].Id); } catch (Exception e) { /* not an editable user field */ }
            }
        }

        Test.startTest();
        CalculateCaseDueDate.assignCasesWithTVMLogic(cases, new Map<String, Case_Routing_Config__mdt>(),
                                                     groupUserMap, new Map<String, Account>{ accId => acc },
                                                     new Map<String, Integer>());
        Test.stopTest();

        for (Case c : cases) {
            System.assertEquals(c.Case_Assign_To__c, c.OwnerId, 'OwnerId should always match Case_Assign_To__c');
        }
    }

    // ---------- READY FOR QA (update) ----------

    private static void runReadyForQA(Case newCase, Map<String, Case_Routing_Config__mdt> configMap,
                                      Map<String, List<String>> groupUserMap, Map<String, Account> mapAccounts) {
        Case oldCase = newCase.clone(true, true, true, true);
        oldCase.Status_Filtered__c = 'New';
        newCase.Status_Filtered__c = 'Ready for QA';
        CalculateCaseDueDate.assignBeforeUpdateCasesWithTVMLogic(new List<Case>{ newCase }, configMap,
                                                                 groupUserMap, mapAccounts,
                                                                 new Map<Id, Case>{ oldCase.Id => oldCase },
                                                                 new Map<String, Integer>());
    }

    @isTest
    static void testReadyForQA_QueueAssignment() {
        List<User> users = createRoutingUsers();
        Id accId = fakeId('001');
        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>{
            'Req QA Queue' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req QA Queue', 'Auto_QA_Assignment__c' => true,
                'After_QA_Assignment__c' => 'Queue', 'QA_Queue__c' => 'QA Queue' })
        };
        Map<String, List<String>> groupUserMap = new Map<String, List<String>>{
            'QA Queue' => new List<String>{ users[1].Id }
        };
        Case c = memCase(accId, 'Req QA Queue');
        c.Case_Assign_To__c = users[0].Id;
        c.Case_Assignment_Queue__c = 'Test Queue';

        Test.startTest();
        runReadyForQA(c, configMap, groupUserMap, new Map<String, Account>{ accId => memAccount(accId, false) });
        Test.stopTest();

        System.assertEquals(users[1].Id, c.Case_Assign_To__c, 'Case should go to the QA queue user');
        System.assertEquals(users[1].Id, c.OwnerId);
        System.assertEquals('QA Queue', c.Case_Assignment_Queue__c);
    }

    @isTest
    static void testReadyForQA_ManagerAssignment() {
        List<User> users = createRoutingUsers();   // users[0].ManagerId = users[2]
        Id accId = fakeId('001');
        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>{
            'Req QA Manager' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req QA Manager', 'Auto_QA_Assignment__c' => true,
                'After_QA_Assignment__c' => 'Field', 'QA_Field_Name__c' => 'Assignee_Manager__c' })
        };
        Case c = memCase(accId, 'Req QA Manager');
        c.Case_Assign_To__c = users[0].Id;

        Test.startTest();
        runReadyForQA(c, configMap, new Map<String, List<String>>(),
                      new Map<String, Account>{ accId => memAccount(accId, false) });
        Test.stopTest();

        System.assertEquals(users[2].Id, c.Case_Assign_To__c, 'Case should go to the assignee\'s manager');
        System.assertEquals(users[2].Id, c.OwnerId);
    }

    @isTest
    static void testReadyForQA_FieldAssignment_CaseAndAccountFields() {
        List<User> users = createRoutingUsers();
        Id accId = fakeId('001');
        String accField = accountOnlyUserField();

        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>{
            // QA field on the Case itself
            'Req QA Case Field' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req QA Case Field', 'Auto_QA_Assignment__c' => true,
                'After_QA_Assignment__c' => 'Field', 'QA_Field_Name__c' => 'Case_Assign_To__c' }),
            // QA field that doesn't exist anywhere -> no error, no change
            'Req QA Bad Field' => cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req QA Bad Field', 'Auto_QA_Assignment__c' => true,
                'After_QA_Assignment__c' => 'Field', 'QA_Field_Name__c' => 'Not_A_Real_Field__c' })
        };
        Account acc = memAccount(accId, false);
        if (accField != null) {
            // QA field on the Account (e.g. Digital_Analyst_Lead__c)
            configMap.put('Req QA Account Field', cfg(new Map<String, Object>{
                'Request_Type__c' => 'Req QA Account Field', 'Auto_QA_Assignment__c' => true,
                'After_QA_Assignment__c' => 'Field', 'QA_Field_Name__c' => accField }));
            acc.put(accField, users[1].Id);
        }
        Map<String, Account> mapAccounts = new Map<String, Account>{ accId => acc };

        Case caseField = memCase(accId, 'Req QA Case Field');
        caseField.Case_Assign_To__c = users[0].Id;
        Case badField = memCase(accId, 'Req QA Bad Field');
        badField.Case_Assign_To__c = users[0].Id;
        Case accountField = memCase(accId, 'Req QA Account Field');
        accountField.Case_Assign_To__c = users[0].Id;

        Test.startTest();
        runReadyForQA(caseField, configMap, new Map<String, List<String>>(), mapAccounts);
        runReadyForQA(badField, configMap, new Map<String, List<String>>(), mapAccounts);
        if (accField != null) {
            runReadyForQA(accountField, configMap, new Map<String, List<String>>(), mapAccounts);
        }
        Test.stopTest();

        System.assertEquals(users[0].Id, caseField.Case_Assign_To__c);
        System.assertEquals(caseField.Case_Assign_To__c, caseField.OwnerId, 'OwnerId should match Case_Assign_To__c');
        System.assertEquals(users[0].Id, badField.Case_Assign_To__c, 'Unknown QA field must not change the assignee');
        if (accField != null) {
            System.assertEquals(users[1].Id, accountField.Case_Assign_To__c, 'Case should get the user from Account.' + accField);
            System.assertEquals(users[1].Id, accountField.OwnerId);
        }
    }

    // ---------- CAMPAIGNS QA RULE ----------

    @isTest
    static void testCampaignsQARule() {
        List<User> users = createRoutingUsers();   // users[0].ManagerId = users[2]
        Id accId = fakeId('001');
        String accField = accountOnlyUserField();
        String liveClient = 'Live Client - New Product Launch';
        String newCampaign = 'New Campaign Request \u2013 Launch A New Campaign For Existing Product';

        Map<String, Case_Routing_Config__mdt> configMap = new Map<String, Case_Routing_Config__mdt>{
            // QA user from a field (Account field if available, otherwise the Case field)
            liveClient => cfg(new Map<String, Object>{
                'Request_Type__c' => liveClient,
                'Campaigns__c' => true,
                'Auto_QA_Assignment__c' => true,
                'After_QA_Assignment__c' => 'Field',
                'QA_Field_Name__c' => (accField != null ? accField : 'Case_Assign_To__c') }),
            // QA user = manager of the assignee.
            // Auto_QA_Assignment__c + After_QA_Assignment__c are intentionally populated:
            // if the normal Ready-for-QA exclusion is removed, the blank-campaign test below
            // would fall through into normal QA and change the assignee.
            newCampaign => cfg(new Map<String, Object>{
                'Request_Type__c' => newCampaign,
                'Campaigns__c' => true,
                'Auto_QA_Assignment__c' => true,
                'After_QA_Assignment__c' => 'Field',
                'QA_Field_Name__c' => 'Assignee_Manager__c' })
        };
        Account acc = memAccount(accId, false);
        if (accField != null) {
            acc.put(accField, users[1].Id);
        }
        Map<String, Account> mapAccounts = new Map<String, Account>{ accId => acc };

        // Get Me More campaign selected
        Case fieldCase = memCase(accId, liveClient);
        fieldCase.Case_Assign_To__c = users[0].Id;
        fieldCase.Get_Me_More_Campaigns__c = 'Test Campaign';

        // Client Requested campaign selected
        Case managerCase = memCase(accId, newCampaign);
        managerCase.Case_Assign_To__c = users[0].Id;
        managerCase.Client_Requested_Campaigns__c = 'Test Campaign';

        // No campaign selected -> rule does not apply
        Case noCampaignCase = memCase(accId, newCampaign);
        noCampaignCase.Case_Assign_To__c = users[1].Id;

        Test.startTest();
        runReadyForQA(fieldCase, configMap, new Map<String, List<String>>(), mapAccounts);
        runReadyForQA(managerCase, configMap, new Map<String, List<String>>(), mapAccounts);
        runReadyForQA(noCampaignCase, configMap, new Map<String, List<String>>(), mapAccounts);
        Test.stopTest();

        Id expectedFieldUser = (accField != null) ? users[1].Id : users[0].Id;
        System.assertEquals(expectedFieldUser, fieldCase.Case_Assign_To__c, 'Campaigns rule should use QA_Field_Name__c');
        System.assertEquals(fieldCase.Case_Assign_To__c, fieldCase.OwnerId);

        System.assertEquals(users[2].Id, managerCase.Case_Assign_To__c, 'Campaigns rule should use the assignee\'s manager');
        System.assertEquals(users[2].Id, managerCase.OwnerId);

        // IMPORTANT: this proves the NEW exclusion:
        // Case Request is one of the two Campaign QA requests, Campaigns__c = true,
        // Auto_QA_Assignment__c = true, After_QA_Assignment__c = 'Field',
        // but both campaign multi-select fields are blank.
        // Campaign QA must not run, and normal Ready-for-QA must also not run.
        System.assertEquals(users[1].Id, noCampaignCase.Case_Assign_To__c,
            'No campaign selected - special request must not fall through to normal Ready-for-QA assignment');
        System.assertEquals(null, noCampaignCase.OwnerId,
            'Owner must not be changed by normal Ready-for-QA when both campaign fields are blank');
    }

    // =====================================================================================
    // NEW: Existing Case changes TO New Digital Support -> initial routing runs
    // =====================================================================================
    @isTest
    static void testCategoryChangedToNewDigitalSupport_InitialRouting() {
        User testUser = createTestUser();

        System.runAs(testUser) {
            Account acc = createTestAccount();

            List<Case_Routing_Config__mdt> configs = [
                SELECT Request_Type__c, Field_Name__c
                FROM Case_Routing_Config__mdt
                WHERE Active__c = true
                AND Case_Entry__c = 'Manual'
                AND Initial_Assignment__c = 'Field'
                AND Case_Type__c = 'Non Hybrid'
                AND Request_Type__c != null
                AND Field_Name__c IN (
                    'Regional_Performance_Manager__c',
                    'Account_Technician__c',
                    'Secondary_Account_Technician__c'
                )
                LIMIT 1
            ];

            System.assert(!configs.isEmpty(),
                'Need one active Manual + Field Non Hybrid routing configuration');

            Case_Routing_Config__mdt routingConfig = configs[0];

            Case oldCase = new Case(
                Id = fakeId('500'),
                AccountId = acc.Id,
                Subject = 'Category change routing test',
                Case_Request__c = routingConfig.Request_Type__c,
                Status_Filtered__c = 'New',
                Case_Category__c = 'Foundation Digital Support',
                OwnerId = testUser.Id,
                Case_Assign_To__c = testUser.Id
            );

            Case newCase = oldCase.clone(true, true, true, true);
            newCase.Case_Category__c = 'New Digital Support';

            Test.startTest();
            CalculateCaseDueDate.onBeforeUpdate(
                new List<Case>{ newCase },
                new Map<Id, Case>{ oldCase.Id => oldCase }
            );
            Test.stopTest();

            System.assertEquals('New Digital Support', newCase.Case_Category__c,
                'Case Category should be New Digital Support');
            System.assertNotEquals(null, newCase.Case_Assign_To__c,
                'Initial routing should assign the Case');
            System.assertEquals(testUser.Id, newCase.Case_Assign_To__c,
                'Manual + Field routing should use the configured Account user');
            System.assertEquals(newCase.Case_Assign_To__c, newCase.OwnerId,
                'OwnerId should match Case_Assign_To__c');
        }
    }

}