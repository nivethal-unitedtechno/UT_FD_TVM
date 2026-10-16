@isTest
public class Th_CaseTrigger_Test {

    private static String uniqueSuffix() {
        return String.valueOf(Math.abs(Crypto.getRandomInteger()));
    }

    // Account_Technician__c (and friends) must be populated because
    // Case automation may require them.
    private static Account createAccount(Boolean atRisk) {
        Id runningUserId = UserInfo.getUserId();
        Account acc = new Account(
            Name = 'Th_CaseTrigger Test Account ' + uniqueSuffix(),
            Regional_performance_manager__c = runningUserId,
            Account_Technician__c = runningUserId,
            Secondary_Account_Technician__c = runningUserId,
            Case_Risk_For_Cancellation__c = atRisk
        );
        insert acc;
        return acc;
    }

    // Creates a Case using the Case Master_Record_Type.
    // Foundation_Record__c is a formula checkbox, so it is not assigned here.
    private static Case createCase(Account acc, String requestType, String risk) {
        Id foundationRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName()
            .get('Master_Record_Type').getRecordTypeId();

        Case c = new Case(
            AccountId = acc.Id,
            Subject = 'Test Case ' + uniqueSuffix(),
            RecordTypeId = foundationRecordTypeId,
            Case_Request__c = requestType,
            Is_this_client_at_risk_for_cancellation__c = risk
        );
        insert c;

        return [SELECT Id, AccountId, Subject, Case_Request__c,
                       Is_this_client_at_risk_for_cancellation__c
                FROM Case WHERE Id = :c.Id];
    }

    private static Case cloneWithRisk(Case original, String newRisk) {
        Case clone = original.clone(true, true, true, true);
        clone.Is_this_client_at_risk_for_cancellation__c = newRisk;
        return clone;
    }

    private static void runHandler(Case oldCase, Case newCase) {
        Th_CaseTrigger.onAfterUpdate(
            new Map<Id, Case>{ newCase.Id => newCase },
            new Map<Id, Case>{ oldCase.Id => oldCase }
        );
    }

    private static Boolean accountAtRisk(Id accId) {
        return [SELECT Case_Risk_For_Cancellation__c
                FROM Account WHERE Id = :accId]
                .Case_Risk_For_Cancellation__c;
    }

    @IsTest
    static void testRiskFlipsToYes_SetsAccountAtRiskTrue() {
        Account acc = createAccount(false);
        Case oldCase = createCase(acc, 'Performance Review', 'No');
        Case newCase = cloneWithRisk(oldCase, 'Yes');

        Test.startTest();
            runHandler(oldCase, newCase);
        Test.stopTest();

        System.assertEquals(true, accountAtRisk(acc.Id),
            'Account should be flagged at risk when its latest Performance Review case flips to Yes');
    }

    @IsTest
    static void testRiskFlipsAwayFromYes_SetsAccountAtRiskFalse() {
        Account acc = createAccount(true);
        Case oldCase = createCase(acc, 'Performance Review', 'Yes');
        Case newCase = cloneWithRisk(oldCase, 'No');

        Test.startTest();
            runHandler(oldCase, newCase);
        Test.stopTest();

        System.assertEquals(false, accountAtRisk(acc.Id),
            'Account should be un-flagged when its latest Performance Review case moves away from Yes');
    }

    // Case_Request__c is not 'Performance Review', so setAccountIds stays empty and
    // the Account is not touched.
    @IsTest
    static void testNonPerformanceReviewCase_IsNoOp() {
        Account acc = createAccount(true);
        Case oldCase = createCase(acc, null, 'Yes');
        Case newCase = cloneWithRisk(oldCase, 'No');

        Test.startTest();
            runHandler(oldCase, newCase);
        Test.stopTest();

        System.assertEquals(true, accountAtRisk(acc.Id),
            'Account should be untouched when the updated case is not a Performance Review case');
    }

    // Real DML update so CaseTrigger_FNDN itself fires.
    // Foundation_Record__c is a formula checkbox, so this test does not assume
    // that the formula evaluates to true.
    @IsTest
    static void testRealUpdate_FiresTrigger() {
        Account acc = createAccount(false);
        Case c = createCase(acc, 'Performance Review', 'No');

        Test.startTest();
            c.Is_this_client_at_risk_for_cancellation__c = 'Yes';
            update c;
        Test.stopTest();

        Case updatedCase = [
            SELECT Is_this_client_at_risk_for_cancellation__c
            FROM Case
            WHERE Id = :c.Id
        ];

        System.assertEquals('Yes',
            updatedCase.Is_this_client_at_risk_for_cancellation__c,
            'Case should be updated successfully');
    }

    // Two Accounts in one call - covers bulk processing
    @IsTest
    static void testMultipleAccounts_BothProcessed() {
        Account acc1 = createAccount(false);
        Account acc2 = createAccount(true);

        Case old1 = createCase(acc1, 'Performance Review', 'No');
        Case new1 = cloneWithRisk(old1, 'Yes');
        Case old2 = createCase(acc2, 'Performance Review', 'Yes');
        Case new2 = cloneWithRisk(old2, 'No');

        Test.startTest();
            Th_CaseTrigger.onAfterUpdate(
                new Map<Id, Case>{ new1.Id => new1, new2.Id => new2 },
                new Map<Id, Case>{ old1.Id => old1, old2.Id => old2 }
            );
        Test.stopTest();

        System.assertEquals(true, accountAtRisk(acc1.Id),
            'Account 1 should be flagged at risk');
        System.assertEquals(false, accountAtRisk(acc2.Id),
            'Account 2 should be un-flagged');
    }
}