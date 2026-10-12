# Apex Class: UpdateAccountFromOpportunityBatch

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `UpdateAccountFromOpportunityBatch` |
| Type | Apex Class |
| API Version | 58.0 |
| Status | Active |
| Lines | 136 |

## Related Components

- Test classes: [UpdateAccountFromOpportunityBatch_Test](UpdateAccountFromOpportunityBatch_Test.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 6 | `// Match flow start conditions: AccountId != null AND Foundation_Record__c = true` |
| 10 | `'AND Foundation_Record__c = TRUE';` |
| 20 | `if (o.AccountId != null && o.Foundation_Record__c == true) {` |
| 46 | `AND Foundation_Record__c = TRUE` |

## Source

```apex
public with sharing class UpdateAccountFromOpportunityBatch implements Database.Batchable<SObject>, Database.Stateful {

    public UpdateAccountFromOpportunityBatch() {}

    public Database.QueryLocator start(Database.BatchableContext bc) {
        // Match flow start conditions: AccountId != null AND Foundation_Record__c = true
        String soql = 'SELECT Id, AccountId, StageName, Foundation_Record__c, Type__c, OEM__c, FND_OEM_Program__c, Product_Status__c ' +
                      'FROM Opportunity ' +
                      'WHERE AccountId != NULL ' +
                      'AND Foundation_Record__c = TRUE';
        return Database.getQueryLocator(soql);
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> scope) {
        if (scope.isEmpty()) return;

        // Collect Account Ids from this scope
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity o : scope) {
            if (o.AccountId != null && o.Foundation_Record__c == true) {
                accountIds.add(o.AccountId);
            }
        }
        if (accountIds.isEmpty()) return;

        // Query Accounts (eligible)
        Map<Id, Account> accById = new Map<Id, Account>([
            SELECT Id, Type__c, OEM__c, FND_OEM_Program__c, Product_Type__c
            FROM Account
            WHERE Id IN :accountIds
        ]);

        // Prepare aggregation holders; do NOT wipe yet. We'll compute new values first,
        // then update Accounts to the computed values (including clearing if none).
        Map<Id, String> nextTypeByAcc = new Map<Id, String>();
        Map<Id, String> nextOEMByAcc = new Map<Id, String>();
        Map<Id, String> nextProgByAcc = new Map<Id, String>();
        Map<Id, String> nextProdTypeByAcc = new Map<Id, String>();

        // Query ALL related qualifying Opportunities for the collected Accounts
        // Do NOT rely on the current scope; rebuild from the full related set.
        List<Opportunity> allOppsForAccounts = [
            SELECT Id, AccountId, StageName, Foundation_Record__c, Type__c, OEM__c, FND_OEM_Program__c, Product_Status__c
            FROM Opportunity
            WHERE AccountId IN :accountIds
            AND Foundation_Record__c = TRUE
        ];

        // Aggregate new values from ALL related Opportunities (respecting exclusions)
        for (Opportunity o : allOppsForAccounts) {
            if (!accById.containsKey(o.AccountId)) continue;

            // Exclude these StageNames from contributing values
            if (o.StageName == 'Foundation Data' || o.StageName == 'Lost' || o.StageName == 'Unqualified' || o.StageName == 'Never Launched') {
                continue;
            }

            // Type__c on Opportunity is a single-select (text) -> map as a single token
            if (o.Type__c != null) {
                nextTypeByAcc.put(o.AccountId, concatDistinctToken(nextTypeByAcc.get(o.AccountId), o.Type__c));
            }
            // OEM__c, FND_OEM_Program__c and Product_Status__c on Opportunity are multi-selects -> split and merge
            if (o.OEM__c != null) {
                nextOEMByAcc.put(o.AccountId, mergeSemicolonTokens(nextOEMByAcc.get(o.AccountId), o.OEM__c));
            }
            if (o.FND_OEM_Program__c != null) {
                nextProgByAcc.put(o.AccountId, mergeSemicolonTokens(nextProgByAcc.get(o.AccountId), o.FND_OEM_Program__c));
            }
            if (o.Product_Status__c != null) {
                nextProdTypeByAcc.put(o.AccountId, mergeSemicolonTokens(nextProdTypeByAcc.get(o.AccountId), o.Product_Status__c));
            }
        }

        // Compute final values (including clearing when no qualifying opps contributed)
        List<Account> updates = new List<Account>();
        for (Account a : accById.values()) {
            Account upd = new Account(
                Id = a.Id,
                Type__c = nextTypeByAcc.containsKey(a.Id) ? nextTypeByAcc.get(a.Id) : null,
                OEM__c = nextOEMByAcc.containsKey(a.Id) ? nextOEMByAcc.get(a.Id) : null,
                FND_OEM_Program__c = nextProgByAcc.containsKey(a.Id) ? nextProgByAcc.get(a.Id) : null,
                Product_Type__c = nextProdTypeByAcc.containsKey(a.Id) ? nextProdTypeByAcc.get(a.Id) : null
            );
            updates.add(upd);
        }

        if (!updates.isEmpty()) {
            Database.update(updates, false);
        }
    }

    public void finish(Database.BatchableContext bc) {
        // Optionally implement logging/notifications
    }

    // Helper: append a single token (for single-select/text sources) if not already present
    private static String concatDistinctToken(String existing, String incoming) {
        String inTok = incoming == null ? null : incoming.trim();
        if (String.isBlank(inTok)) {
            return existing;
        }
        if (String.isBlank(existing)) {
            return inTok;
        }
        Set<String> tokens = new Set<String>();
        for (String t : existing.split('\\s*;\\s*')) {
            String nt = t == null ? null : t.trim();
            if (!String.isBlank(nt)) tokens.add(nt);
        }
        if (!tokens.contains(inTok)) {
            return existing + ';' + inTok;
        }
        return existing;
    }

    // Helper: merge semicolon-delimited tokens from a multi-select/text source into a distinct, trimmed, stable string
    private static String mergeSemicolonTokens(String existing, String incoming) {
        List<String> ordered = new List<String>();
        Set<String> seen = new Set<String>();

        // internal adder
        for (String source : new List<String>{ existing, incoming }) {
            if (String.isBlank(source)) continue;
            for (String rawTok : source.split('\\s*;\\s*')) {
                String tok = rawTok == null ? null : rawTok.trim();
                if (!String.isBlank(tok) && !seen.contains(tok)) {
                    seen.add(tok);
                    ordered.add(tok);
                }
            }
        }
        return String.join(ordered, ';');
    }

    // Removed change detection; batch now updates all derived Accounts unconditionally.
}
```
