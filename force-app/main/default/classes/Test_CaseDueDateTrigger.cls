@IsTest(SeeAllData=true)
public class Test_CaseDueDateTrigger {

    private static String uniqueSuffix() {        
        Integer rnd = Math.abs(Math.mod(Math.abs(Crypto.getRandomInteger()), 1000000));
        return String.valueOf(rnd);
    }

    // -----------------------------
    // Dummy HTTP Mock
    // -----------------------------
    public class DummyHttpCalloutMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type','application/json');
            res.setBody('{"success":true}');
            res.setStatusCode(200);
            return res;
        }
    }

    private static User createUser(String alias) {
        Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        String unique = alias + uniqueSuffix() + System.currentTimeMillis();
        User u = new User(
            Alias = alias,
            Email = unique + '@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Test',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = profile.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = unique + '@example.com'
        );
        insert u;
        return u;
    }

    // All user fields populated - owner assignment reads these Account fields
    private static Account createAccount(User u) {
        Account acc = new Account(
            Name = 'Demo Account ' + uniqueSuffix(),
            Regional_Performance_Manager__c = u.Id,
            Account_Technician__c = u.Id,
            Secondary_Account_Technician__c = u.Id,
            RPM_Assessment_Score__c = 0,
            Days_Since_Last_PR_Closed__c = 2,
            Quickbase_Record_ID__c = uniqueSuffix()
        );
        insert acc;
        return acc;
    }

    // Build custom metadata in memory for direct routing tests.
    private static Case_Routing_Config__mdt makeConfig(Map<String, Object> values) {
        Map<String, Object> data = new Map<String, Object>(values);
        data.put('attributes', new Map<String, Object>{ 'type' => 'Case_Routing_Config__mdt' });
        if (!data.containsKey('Active__c')) {
            data.put('Active__c', true);
        }
        return (Case_Routing_Config__mdt)JSON.deserialize(
            JSON.serialize(data),
            Case_Routing_Config__mdt.class
        );
    }

    // =========================================================
    // Insert + update through DML (trigger runs end to end)
    // =========================================================
    @IsTest
    static void testCalculateCaseDueDateSimple() {

        Test.setMock(HttpCalloutMock.class, new DummyHttpCalloutMock());

        User testUser = createUser('testuser');

        System.runAs(testUser) {
            Account acc = createAccount(testUser);

            Case c = new Case(
                AccountId = acc.Id,
                Case_Request__c = 'Future Budget Change',
                Status_Filtered__c = 'Future',
                Origin = 'Google Meet',
                Subject = 'Future Budget Change Test',

                // Qualifies for Foundation logic through the new entry condition:
                // Foundation_Record__c = TRUE OR Case_Category__c = 'New Digital Support'
                Case_Category__c = 'New Digital Support',

                OwnerId = testUser.Id,
                Case_Assign_To__c = testUser.Id
            );

            // REAL INSERT:
            // Covers CaseTrigger_FNDN Before Insert + After Insert
            insert c;

            Case insertedCase = [
                SELECT Id,
                       AccountId,
                       Foundation_Record__c,
                       Status_Filtered__c,
                       Case_Request__c,
                       Case_Category__c,
                       Digital_Execution_Start_Date__c,
                       Start_Date_Time__c,
                       Start_Date__c,
                       OwnerId,
                       Case_Assign_To__c
                FROM Case
                WHERE Id = :c.Id
            ];

            Date executionDate = System.today().addDays(5);

            insertedCase.Digital_Execution_Start_Date__c = executionDate;

            // REAL UPDATE:
            // Covers CaseTrigger_FNDN Before Update + After Update
            Test.startTest();

            update insertedCase;

            Test.stopTest();

            Case updatedCase = [
                SELECT Id,
                       Foundation_Record__c,
                       Status_Filtered__c,
                       Case_Request__c,
                       Case_Category__c,
                       Digital_Execution_Start_Date__c,
                       Start_Date_Time__c,
                       Start_Date__c,
                       OwnerId,
                       Case_Assign_To__c
                FROM Case
                WHERE Id = :insertedCase.Id
            ];

            System.assertEquals(
                'Future Budget Change',
                updatedCase.Case_Request__c,
                'Case Request should remain Future Budget Change'
            );

            System.assertEquals(
                executionDate,
                updatedCase.Digital_Execution_Start_Date__c,
                'Digital Execution Start Date should remain populated'
            );
        }
    }

    // =========================================================
    // Covers normal Ready for QA assignment for non-campaign requests.
    // =========================================================
    @IsTest
    static void testReadyForQAAssignmentCoverage() {

        Test.setMock(HttpCalloutMock.class, new DummyHttpCalloutMock());

        List<Case_Routing_Config__mdt> cfgs = [
            SELECT DeveloperName, Queue__c, QA_Queue__c, After_QA_Assignment__c, QA_Field_Name__c,
                   Auto_QA_Assignment__c, Active__c, Request_Type__c
            FROM Case_Routing_Config__mdt
            WHERE Case_Entry__c IN ('Auto', 'Manual')
            AND (Case_Type__c = 'Hybrid' OR Case_Type__c = 'Non Hybrid')
            AND (Initial_Assignment__c = 'Field' OR Initial_Assignment__c = 'Queue')
            AND Active__c = TRUE 
            LIMIT 1
        ];
        System.assert(!cfgs.isEmpty(), 'Need an active Case_Routing_Config__mdt');
        Case_Routing_Config__mdt cfg = cfgs[0];

        User u = createUser('qauser');

        System.runAs(u) {
            Account acc = createAccount(u);

            Case c = new Case(
                AccountId = acc.Id,
                Case_Request__c = cfg.Request_Type__c,
                Status_Filtered__c = 'New',
                Origin = 'Phone',
                Subject = 'QA Routing Test',
                Case_Category__c = 'New Digital Support',
                OwnerId = u.Id,
                Case_Assign_To__c = u.Id,
                Case_Assignment_Queue__c = (cfg.Queue__c != null ? cfg.Queue__c : 'Action')
            );
            insert c;

            String fields = 'Id, OwnerId, Case_Assign_To__c, AccountId, Subject, CreatedDate, ' +
                            'Foundation_Record__c, Case_Category__c, ' +
                            'Status_Filtered__c, Case_Request__c, Digital_Execution_Start_Date__c, ' +
                            'SLA_Time__c, Case_Assignment_Queue__c, ' +
                            'Client_Requested_Campaigns__c, Get_Me_More_Campaigns__c';
            if (String.isNotBlank(cfg.QA_Field_Name__c) && cfg.QA_Field_Name__c != 'Assignee_Manager__c'
                && Schema.SObjectType.Case.fields.getMap().containsKey(cfg.QA_Field_Name__c.toLowerCase())
                && !fields.containsIgnoreCase(cfg.QA_Field_Name__c)) {
                fields += ', ' + cfg.QA_Field_Name__c;
            }
            Id caseId = c.Id;
            Case oldCase = Database.query('SELECT ' + fields + ' FROM Case WHERE Id = :caseId');
            Case newCase = oldCase.clone(true, true, true, true);
            newCase.Status_Filtered__c = 'Ready for QA';

            Test.startTest();
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

    // =========================================================
    // NEW: proves BOTH campaign Case Requests are excluded from
    // the NORMAL Ready-for-QA assignment when campaign fields are blank.
    // =========================================================
    @IsTest
    static void testCampaignRequestsDoNotFallThroughToNormalQA() {
        User manager = createUser('qamgr');
        User assignee = createUser('qaasg');
        assignee.ManagerId = manager.Id;
        update assignee;

        System.runAs(assignee) {
            Account acc = createAccount(assignee);

            String liveClient = 'Live Client - New Product Launch';
            String newCampaign = 'New Campaign Request – Launch A New Campaign For Existing Product';

            Map<String, Case_Routing_Config__mdt> configMap =
                new Map<String, Case_Routing_Config__mdt>{
                    liveClient => makeConfig(new Map<String, Object>{
                        'Request_Type__c' => liveClient,
                        'Campaigns__c' => true,
                        'Auto_QA_Assignment__c' => true,
                        'After_QA_Assignment__c' => 'Field',
                        'QA_Field_Name__c' => 'Assignee_Manager__c'
                    }),
                    newCampaign => makeConfig(new Map<String, Object>{
                        'Request_Type__c' => newCampaign,
                        'Campaigns__c' => true,
                        'Auto_QA_Assignment__c' => true,
                        'After_QA_Assignment__c' => 'Field',
                        'QA_Field_Name__c' => 'Assignee_Manager__c'
                    })
                };

            Map<String, Account> accountMap =
                new Map<String, Account>{ acc.Id => acc };

            Integer counter = 1;
            Test.startTest();

            for (String requestType : new List<String>{ liveClient, newCampaign }) {
                Id caseId = Id.valueOf('50000000000000' + counter);

                Case oldCase = new Case(
                    Id = caseId,
                    AccountId = acc.Id,
                    Case_Request__c = requestType,
                    Status_Filtered__c = 'New',
                    Case_Assign_To__c = assignee.Id,
                    OwnerId = assignee.Id
                );

                Case newCase = oldCase.clone(true, true, true, true);
                newCase.Status_Filtered__c = 'Ready for QA';

                // Both campaign fields intentionally blank.
                newCase.Get_Me_More_Campaigns__c = null;
                newCase.Client_Requested_Campaigns__c = null;

                CalculateCaseDueDate.assignBeforeUpdateCasesWithTVMLogic(
                    new List<Case>{ newCase },
                    configMap,
                    new Map<String, List<String>>(),
                    accountMap,
                    new Map<Id, Case>{ oldCase.Id => oldCase },
                    new Map<String, Integer>()
                );

                // If normal Ready-for-QA were allowed to run, this would become manager.Id.
                System.assertEquals(
                    assignee.Id,
                    newCase.Case_Assign_To__c,
                    requestType + ': blank campaigns must not fall through to normal QA'
                );

                System.assertEquals(
                    assignee.Id,
                    newCase.OwnerId,
                    requestType + ': OwnerId must remain unchanged'
                );

                counter++;
            }

            Test.stopTest();
        }
    }


    // =========================================================
    // Existing Case changes TO New Digital Support.
    // Proves the trigger accepts the update and initial routing runs.
    // =========================================================
    @IsTest
    static void testCaseCategoryChangedToNewDigitalSupport() {
        Test.setMock(HttpCalloutMock.class, new DummyHttpCalloutMock());

        User testUser = createUser('ndstest');

        System.runAs(testUser) {
            Account acc = createAccount(testUser);

            List<Case_Routing_Config__mdt> configs = [
                SELECT Request_Type__c, Field_Name__c
                FROM Case_Routing_Config__mdt
                WHERE Active__c = TRUE
                AND Case_Entry__c = 'Manual'
                AND Initial_Assignment__c = 'Field'
                AND Case_Type__c = 'Non Hybrid'
                AND Request_Type__c != NULL
                AND Field_Name__c IN (
                    'Regional_Performance_Manager__c',
                    'Account_Technician__c',
                    'Secondary_Account_Technician__c'
                )
                LIMIT 1
            ];

            System.assert(!configs.isEmpty(),
                'Need one active Manual + Field Non Hybrid routing configuration');

            Case_Routing_Config__mdt config = configs[0];

            Case c = new Case(
                AccountId = acc.Id,
                Case_Request__c = config.Request_Type__c,
                Status_Filtered__c = 'New',
                Origin = 'Phone',
                Subject = 'Change Category To New Digital Support',
                Case_Category__c = 'Foundation Digital Support',
                OwnerId = testUser.Id,
                Case_Assign_To__c = testUser.Id
            );
            insert c;

            Case caseToUpdate = [
                SELECT Id, AccountId, Case_Category__c, Case_Request__c,
                       Status_Filtered__c, OwnerId, Case_Assign_To__c,
                       Case_Assignment_Queue__c
                FROM Case
                WHERE Id = :c.Id
            ];

            System.assertNotEquals('New Digital Support', caseToUpdate.Case_Category__c,
                'Before update the Case must not be New Digital Support');

            caseToUpdate.Case_Category__c = 'New Digital Support';

            Test.startTest();
            update caseToUpdate;
            Test.stopTest();

            Case routedCase = [
                SELECT Id, Case_Category__c, OwnerId,
                       Case_Assign_To__c, Case_Assignment_Queue__c
                FROM Case
                WHERE Id = :c.Id
            ];

            System.assertEquals('New Digital Support', routedCase.Case_Category__c,
                'Case Category should change to New Digital Support');
            System.assertNotEquals(null, routedCase.Case_Assign_To__c,
                'Initial routing should assign the Case');
            System.assertEquals(testUser.Id, routedCase.Case_Assign_To__c,
                'Manual + Field routing should assign the configured Account user');
            System.assertEquals(routedCase.Case_Assign_To__c, routedCase.OwnerId,
                'OwnerId should match Case_Assign_To__c');
        }
    }

    @IsTest
    static void testDummyMethod() {
        Test.startTest();
        CalculateCaseDueDate.dummy();
        Test.stopTest();
    }
}