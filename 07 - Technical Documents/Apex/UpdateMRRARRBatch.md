# Apex Class: UpdateMRRARRBatch

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `UpdateMRRARRBatch` |
| Type | Apex Class |
| API Version | 56.0 |
| Status | Active |
| Lines | 180 |

## Related Components

- Test classes: [UpdateMRRARRBatch_Test](UpdateMRRARRBatch_Test.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 76 | `// AND Foundation_Record__c = true` |
| 86 | `AND Foundation_Record__c = true` |
| 99 | `AND Foundation_Record__c = true` |

## Source

```apex
/**
 * @description Batch job to update Account MRR and ARR fields based on related Opportunities
 *              This replicates the logic from the flow 'Update MRR and ARR on Account from Opportunity'
 * @author Agentforce
 * @apex-docs
 */
public with sharing class UpdateMRRARRBatch implements Database.Batchable<SObject>, Database.Stateful {

    // Mode to control how the batch determines which Accounts to process
    public enum Mode {
        // Process all Accounts that have at least one Opportunity with StageName = 'Live' or 'Cancellation'
        ALL_ACCOUNTS_WITH_LIVE_OPPORTUNITIES,
        // Process Accounts explicitly provided
        BY_ACCOUNT_IDS,
        // Process Accounts derived from provided Opportunity Ids
        BY_OPPORTUNITY_IDS
    }

    // Parameters for independent execution (no invocable/schedulable required)
    private final Mode mode;
    private final Set<Id> seedAccountIds;
    private final Set<Id> seedOpportunityIds;
    private final Integer scopeSize;

    /**
     * Primary constructor allowing control over the execution mode and scope size.
     */
    public UpdateMRRARRBatch(Mode mode, Set<Id> accountIds, Set<Id> opportunityIds, Integer scopeSize) {
        this.mode = (mode == null) ? UpdateMRRARRBatch.Mode.ALL_ACCOUNTS_WITH_LIVE_OPPORTUNITIES : mode;
        this.seedAccountIds = (accountIds == null) ? new Set<Id>() : new Set<Id>(accountIds);
        this.seedOpportunityIds = (opportunityIds == null) ? new Set<Id>() : new Set<Id>(opportunityIds);
        this.scopeSize = (scopeSize == null || scopeSize <= 0) ? 200 : scopeSize;
    }

    /**
     * Convenience no-arg constructor: runs for ALL_ACCOUNTS_WITH_LIVE_OPPORTUNITIES with default scope 200.
     * This allows executing the batch independently from the Developer Console:
     * Database.executeBatch(new UpdateMRRARRBatch());
     */
    public UpdateMRRARRBatch() {
        this(UpdateMRRARRBatch.Mode.ALL_ACCOUNTS_WITH_LIVE_OPPORTUNITIES, null, null, 200);
    }

    /**
     * Convenience constructors for targeted runs from Developer Console:
     */
    public UpdateMRRARRBatch(Set<Id> accountIds) {
        this(UpdateMRRARRBatch.Mode.BY_ACCOUNT_IDS, accountIds, null, 200);
    }
    
    public UpdateMRRARRBatch(Set<Id> accountIds, Integer scopeSize) {
        this(UpdateMRRARRBatch.Mode.BY_ACCOUNT_IDS, accountIds, null, scopeSize);
    }
    
    public UpdateMRRARRBatch(UpdateMRRARRBatch.Mode mode, Integer scopeSize) {
        this(mode, null, null, scopeSize);
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        Set<Id> accountIdsToProcess = new Set<Id>();

        if (mode == UpdateMRRARRBatch.Mode.BY_ACCOUNT_IDS && !seedAccountIds.isEmpty()) {
            accountIdsToProcess.addAll(seedAccountIds);
        } else if (mode == UpdateMRRARRBatch.Mode.BY_OPPORTUNITY_IDS && !seedOpportunityIds.isEmpty()) {
            for (AggregateResult ar : [
                SELECT AccountId accId
                FROM Opportunity
                WHERE Id IN :seedOpportunityIds
                AND AccountId != null
                GROUP BY AccountId
            ]) {
                accountIdsToProcess.add((Id) ar.get('accId'));
            }
        } else if (mode == UpdateMRRARRBatch.Mode.ALL_ACCOUNTS_WITH_LIVE_OPPORTUNITIES) {
            // Process all Accounts that have at least one Opportunity with StageName = 'Live' or 'Cancellation'
            // AND Foundation_Record__c = true
            return Database.getQueryLocator([
                SELECT Id
                FROM Account
                WHERE Id IN (
                    SELECT AccountId 
                    FROM Opportunity 
                    WHERE (StageName = 'Live' OR StageName = 'Cancellation')
                    AND AccountId != null
                )
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

        // Query related opportunities for all Accounts in scope
        // Filter for Live or Cancellation opportunities only
        List<Opportunity> relatedOpps = [
            SELECT Id, AccountId, FD_ARR__c, Total_MRR__c, StageName
            FROM Opportunity
            WHERE AccountId IN :accIds
            AND (StageName = 'Live' OR StageName = 'Cancellation')
        ];

        // Group opps by AccountId
        Map<Id, List<Opportunity>> oppsByAccount = new Map<Id, List<Opportunity>>();
        for (Opportunity o : relatedOpps) {
            if (!oppsByAccount.containsKey(o.AccountId)) {
                oppsByAccount.put(o.AccountId, new List<Opportunity>());
            }
            oppsByAccount.get(o.AccountId).add(o);
        }

        // Build summary values and prepare updates
        List<Account> accountsToUpdate = new List<Account>();

        for (Account acc : scope) {
            List<Opportunity> opps = oppsByAccount.get(acc.Id);
            
            // Calculate total ARR and MRR
            Decimal totalARR = 0;
            Decimal totalMRR = 0;
            
            if (opps != null && !opps.isEmpty()) {
                for (Opportunity o : opps) {
                    if (o.FD_ARR__c  != null) {
                        totalARR += o.FD_ARR__c;
                    }
                    if (o.Total_MRR__c != null) {
                        totalMRR += o.Total_MRR__c;
                    }
                }
            }

            // Update Account
            Account accUpd = new Account(Id = acc.Id);
            accUpd.ARR__c = totalARR;
            accUpd.Total_MRR__c = totalMRR;
            accountsToUpdate.add(accUpd);
        }

        // DML in user mode with error collection
        if (!accountsToUpdate.isEmpty()) {
            Database.SaveResult[] results = Database.update(accountsToUpdate, false, AccessLevel.USER_MODE);
        }
    }

    public void finish(Database.BatchableContext bc) {
        // No-op. Could add logging or platform events if needed.
    }

    // Independent run helpers (callable from Developer Console)
    public static void runAll(Integer scopeSize) {
        Integer sz = (scopeSize == null || scopeSize <= 0) ? 200 : scopeSize;
        Database.executeBatch(new UpdateMRRARRBatch(UpdateMRRARRBatch.Mode.ALL_ACCOUNTS_WITH_LIVE_OPPORTUNITIES, null, null, sz), sz);
    }
    
    public static void runForAccounts(Set<Id> accountIds, Integer scopeSize) {
        Integer sz = (scopeSize == null || scopeSize <= 0) ? 200 : scopeSize;
        Database.executeBatch(new UpdateMRRARRBatch(UpdateMRRARRBatch.Mode.BY_ACCOUNT_IDS, accountIds, null, sz), sz);
    }
    
    public static void runForOpportunities(Set<Id> opportunityIds, Integer scopeSize) {
        Integer sz = (scopeSize == null || scopeSize <= 0) ? 200 : scopeSize;
        Database.executeBatch(new UpdateMRRARRBatch(UpdateMRRARRBatch.Mode.BY_OPPORTUNITY_IDS, null, opportunityIds, sz), sz);
    }
}
```
