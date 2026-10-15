# Apex Class: CaseOOOAssignmentHandler

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `CaseOOOAssignmentHandler` |
| Type | Apex Class |
| API Version | 64.0 |
| Status | Active |
| Lines | 104 |

## Related Components

- Test classes: [CaseOOOAssignmentHandlerTest](CaseOOOAssignmentHandlerTest.md)
- Invoked by triggers: [CaseTrigger_FNDN](CaseTrigger_FNDN.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 13 | `if (c.Foundation_Record__c == true \|\| c.Case_Category__c == 'New Digital Support') {` |

## Source

```apex
public class CaseOOOAssignmentHandler {
    private static final Set<String> FLOW_TO_MANAGER = new Set<String>{
        'Monthly Deep Dive', 'Pacing', 'Geo Change', 'Keyword/Audience Audit/Adjustment' };
    private static final String FLOW_TO_SECONDARY_AT = 'Pod Leader - Account Launch QA';
    
    public static void reassignCases(List<Case> caseList) {
        if (caseList == null || caseList.isEmpty()) return;
        
        // Pre-filter to mirror Flow start conditions
        List<Case> scope = new List<Case>();
        for (Case c : caseList) {
            if (c == null) continue;
            if (c.Foundation_Record__c == true || c.Case_Category__c == 'New Digital Support') {
                scope.add(c);
            }
        }
        if (scope.isEmpty()) return;
        // Collect ids for queries
        Set<Id> assignUserIds = new Set<Id>();
        Set<Id> accountIds = new Set<Id>();
        for (Case c : scope) {
            if (c.OwnerId != null) assignUserIds.add(c.OwnerId);
            if (c.AccountId != null) accountIds.add(c.AccountId);
        }
        if (assignUserIds.isEmpty()) return;
        system.debug('After insert for CaseOOO3');
        // Users: we need OOO flags, helper, and ManagerId
        Map<Id, User> usersById = new Map<Id, User>([SELECT Id, OOO__c, OOO_Helper__c, ManagerId, IsActive FROM User WHERE Id IN :assignUserIds ]);
        
        // Accounts: Secondary_Account_Technician__c
        Map<Id, Account> accountsById = new Map<Id, Account>();
        if (!accountIds.isEmpty()) {
            for (Account a : [ SELECT Id, Secondary_Account_Technician__c FROM Account WHERE Id IN :accountIds]) {
                accountsById.put(a.Id, a);
            }
        }
        
        List<Case> updates = new List<Case>();
        
        for (Case c : scope) {
            if (c.OwnerId == null) continue;
            User assigned = usersById.get(c.OwnerId);
            if (assigned == null || !assigned.OOO__c) {
                // Only act when current assignee is OOO
                continue;
            }
            
            Id targetAssignee = null;
            // 1) Apply exact Flow rules first
            system.debug('FLOW_TO_SECONDARY_AT= '+FLOW_TO_SECONDARY_AT);
            if (c.Case_Request__c == FLOW_TO_SECONDARY_AT) {
                
                Account acc = (c.AccountId != null) ? accountsById.get(c.AccountId) : null;
                if (acc != null) targetAssignee = acc.Secondary_Account_Technician__c;
                //system.debug('Secondary_Account_Technician__c = '+acc.Secondary_Account_Technician__c);
            } else if (FLOW_TO_MANAGER.contains(c.Case_Request__c)) {
                targetAssignee = assigned.ManagerId;
            } else {
                // 2) For all other request types: fallback to existing OOO helper chain logic
                targetAssignee = resolveHelperChain(assigned, usersById);
            }
            // Per confirmation: if Flow-mapped target is null, leave unchanged (do NOT fallback)
            if ((c.Case_Request__c == FLOW_TO_SECONDARY_AT || FLOW_TO_MANAGER.contains(c.Case_Request__c))
                && targetAssignee == null) {
                continue;
            }
            
            // If helper-chain mode engaged and no resolution, leave unchanged
            if (targetAssignee != null && targetAssignee != c.OwnerId) {
                updates.add(new Case(
                    Id = c.Id,
                    OwnerId = targetAssignee
                ));
            }
        }
        
        if (!updates.isEmpty()) {
            // DML in user mode per rules (equivalent behavior in tests)
           update updates;
        }
    }
    
    // Walk OOO_Helper__c chain bounded and acyclic using the already-fetched user map
    private static Id resolveHelperChain(User start, Map<Id, User> usersById) {
        if (start == null) return null;
        Set<Id> visited = new Set<Id>();
        Id current = start.Id;
        Integer depth = 0;
        while (current != null && depth < 10) {
            if (visited.contains(current)) break;
            visited.add(current);
            User u = usersById.get(current);
            if (u == null || !u.OOO__c || u.OOO_Helper__c == null) {
                // Stop on first non-OOO OR when no helper → return current (which may still be OOO without helper)
                // We only want to reassign when we actually progressed at least one hop
                return (current == start.Id) ? null : current;
            }
            current = u.OOO_Helper__c;
            depth++;
        }
        // If chain ended due to loop or depth, only reassign if at least one hop happened
        return (current != start.Id) ? current : null;
    }
}
```
