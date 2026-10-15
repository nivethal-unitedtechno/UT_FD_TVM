# Apex Class: AllOppSummaryBatch

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `AllOppSummaryBatch` |
| Type | Apex Class |
| API Version | 61.0 |
| Status | Active |
| Lines | 190 |

## Related Components

- Test classes: [AllOppSummaryBatch_Test](AllOppSummaryBatch_Test.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 74 | `// Process all Accounts that have at least one Opportunity and Foundation_Record__c = true` |
| 79 | `AND Foundation_Record__c = true` |
| 92 | `AND Foundation_Record__c = true` |

## Source

```apex
/**
 * @description Batch job to recompute the All_Opportunities__c summary field for Accounts
 *              and push the same summary to their related Opportunities, replicating the
 *              logic from the flow 'Update All Opportunities field on account and opp'.
 * @author Agentforce
 * @apex-docs
 */
public with sharing class AllOppSummaryBatch implements Database.Batchable<SObject>, Database.Stateful {

    // Mode to control how the batch determines which Accounts to process
    public enum Mode {
        // Recalculate for Accounts explicitly provided
        BY_ACCOUNT_IDS,
        // Recalculate for Accounts derived from provided Opportunity Ids
        BY_OPPORTUNITY_IDS,
        // Recalculate for all Accounts that have at least one Opportunity
        ALL_ACCOUNTS
    }

    // Parameters for independent execution (no invocable/schedulable required)
    private final Mode mode;
    private final Set<Id> seedAccountIds;
    private final Set<Id> seedOpportunityIds;
    private final Integer scopeSize;

    /**
     * Primary constructor allowing control over the execution mode and scope size.
     */
    public AllOppSummaryBatch(Mode mode, Set<Id> accountIds, Set<Id> opportunityIds, Integer scopeSize) {
        this.mode = (mode == null) ? AllOppSummaryBatch.Mode.ALL_ACCOUNTS : mode;
        this.seedAccountIds = (accountIds == null) ? new Set<Id>() : new Set<Id>(accountIds);
        this.seedOpportunityIds = (opportunityIds == null) ? new Set<Id>() : new Set<Id>(opportunityIds);
        this.scopeSize = (scopeSize == null || scopeSize <= 0) ? 200 : scopeSize;
    }

    /**
     * Convenience no-arg constructor: runs for ALL_ACCOUNTS with default scope 200.
     * This allows executing the batch independently from the Developer Console:
     * Database.executeBatch(new AllOppSummaryBatch());
     */
    public AllOppSummaryBatch() {
        this(AllOppSummaryBatch.Mode.ALL_ACCOUNTS, null, null, 200);
    }

    /**
     * Convenience constructors for targeted runs from Developer Console:
     */
    public AllOppSummaryBatch(Set<Id> accountIds) {
        this(AllOppSummaryBatch.Mode.BY_ACCOUNT_IDS, accountIds, null, 200);
    }
    public AllOppSummaryBatch(Set<Id> accountIds, Integer scopeSize) {
        this(AllOppSummaryBatch.Mode.BY_ACCOUNT_IDS, accountIds, null, scopeSize);
    }
    public AllOppSummaryBatch(AllOppSummaryBatch.Mode mode, Integer scopeSize) {
        this(mode, null, null, scopeSize);
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        Set<Id> accountIdsToProcess = new Set<Id>();

        if (mode == AllOppSummaryBatch.Mode.BY_ACCOUNT_IDS && !seedAccountIds.isEmpty()) {
            accountIdsToProcess.addAll(seedAccountIds);
        } else if (mode == AllOppSummaryBatch.Mode.BY_OPPORTUNITY_IDS && !seedOpportunityIds.isEmpty()) {
            for (AggregateResult ar : [
                SELECT AccountId accId
                FROM Opportunity
                WHERE Id IN :seedOpportunityIds
                AND AccountId != null
                GROUP BY AccountId
            ]) {
                accountIdsToProcess.add((Id) ar.get('accId'));
            }
        } else if (mode == AllOppSummaryBatch.Mode.ALL_ACCOUNTS) {
            // Process all Accounts that have at least one Opportunity and Foundation_Record__c = true
            return Database.getQueryLocator([
                SELECT Id
                FROM Account
                WHERE Id IN (SELECT AccountId FROM Opportunity WHERE AccountId != null)
                AND Foundation_Record__c = true
            ]);
        }

        if (accountIdsToProcess.isEmpty()) {
            // Return an empty set to finish quickly
            return Database.getQueryLocator('SELECT Id FROM Account WHERE Id = null');
        }

        return Database.getQueryLocator([
            SELECT Id
            FROM Account
            WHERE Id IN :accountIdsToProcess
            AND Foundation_Record__c = true
        ]);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope) {
        if (scope.isEmpty()) return;

        Set<Id> accIds = new Set<Id>();
        for (Account a : scope) accIds.add(a.Id);

        // Query related opportunities for all Accounts in scope.
        // The original flow concatenates (StageName,Type__c) for every opp of the Account,
        // regardless of Foundation_Record__c; the trigger condition filtered when to run,
        // not which opps to include. We mirror that: include all opps under the Account.
        List<Opportunity> relatedOpps = [
            SELECT Id, AccountId, StageName, Type__c
            FROM Opportunity
            WHERE AccountId IN :accIds
        ];

        // Group opps by AccountId
        Map<Id, List<Opportunity>> oppsByAccount = new Map<Id, List<Opportunity>>();
        for (Opportunity o : relatedOpps) {
            if (!oppsByAccount.containsKey(o.AccountId)) {
                oppsByAccount.put(o.AccountId, new List<Opportunity>());
            }
            oppsByAccount.get(o.AccountId).add(o);
        }

        // Build summary strings and prepare updates
        List<Account> accountsToUpdate = new List<Account>();
        List<Opportunity> oppsToUpdate = new List<Opportunity>();

        for (Account acc : scope) {
            List<Opportunity> opps = oppsByAccount.get(acc.Id);
            String summary = buildSummary(opps);
            // Update Account
            Account accUpd = new Account(Id = acc.Id);
            accUpd.All_Opportunities__c = summary;
            accountsToUpdate.add(accUpd);

            // Update all related Opps with same summary
            if (opps != null && !opps.isEmpty()) {
                for (Opportunity op : opps) {
                    Opportunity opUpd = new Opportunity(Id = op.Id);
                    opUpd.All_Opportunities__c = summary;
                    oppsToUpdate.add(opUpd);
                }
            }
        }

        // DML in user mode with error collection
        if (!accountsToUpdate.isEmpty()) {
            Database.SaveResult[] accResults = Database.update(accountsToUpdate, false, AccessLevel.USER_MODE);
        }
        if (!oppsToUpdate.isEmpty()) {
            Database.SaveResult[] oppResults = Database.update(oppsToUpdate, false, AccessLevel.USER_MODE);
        }
    }

    public void finish(Database.BatchableContext bc) {
        // No-op. Could add logging or platform events if needed.
    }

    // Helper to mirror flow logic: "(StageName,Type__c)," for each opp then trim trailing comma
    private static String buildSummary(List<Opportunity> opps) {
        if (opps == null || opps.isEmpty()) return null;
        String summary = '';
        for (Opportunity o : opps) {
            String stage = o.StageName;
            String typeVal = (String) o.get('Type__c');
            summary += '('
              + (stage == null ? '' : stage)
              + ','
              + (typeVal == null ? '' : typeVal)
              + ')'
              + ',';
        }
        // Trim trailing comma
        if (summary.endsWith(',')) {
            summary = summary.substring(0, summary.length() - 1);
        }
        return summary;
    }

    // Independent run helpers (callable from Developer Console)
    public static void runAll(Integer scopeSize) {
        Integer sz = (scopeSize == null || scopeSize <= 0) ? 200 : scopeSize;
        Database.executeBatch(new AllOppSummaryBatch(AllOppSummaryBatch.Mode.ALL_ACCOUNTS, null, null, sz), sz);
    }
    public static void runForAccounts(Set<Id> accountIds, Integer scopeSize) {
        Integer sz = (scopeSize == null || scopeSize <= 0) ? 200 : scopeSize;
        Database.executeBatch(new AllOppSummaryBatch(AllOppSummaryBatch.Mode.BY_ACCOUNT_IDS, accountIds, null, sz), sz);
    }
    public static void runForOpportunities(Set<Id> opportunityIds, Integer scopeSize) {
        Integer sz = (scopeSize == null || scopeSize <= 0) ? 200 : scopeSize;
        Database.executeBatch(new AllOppSummaryBatch(AllOppSummaryBatch.Mode.BY_OPPORTUNITY_IDS, null, opportunityIds, sz), sz);
    }
}
```
