# Apex Class: CaseAssignmentHybridBatch

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `CaseAssignmentHybridBatch` |
| Type | Apex Class |
| API Version | 65.0 |
| Status | Active |
| Lines | 237 |
| Last Modified | 2026-10-16 05:19 UTC by Sandip Patel |

## Related Components

- Test classes: [CaseAssignmentHybridBatchTest](CaseAssignmentHybridBatchTest.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 14 | `'AND (Foundation_Record__c = TRUE OR Case_Category__c = \'New Digital Support\') ' +` |

## Source

```apex
global class CaseAssignmentHybridBatch implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {

        // Query Hybrid accounts cases created today, not yet assigned
        String query =
            'SELECT Id, OwnerId, Case_Assign_To__c, ' +
            'Case_Assignment_Queue__c, Case_Request__c, ' +
            'Status_Filtered__c, AccountId ' +
            'FROM Case ' +
            'WHERE Case_Assign_To__c = null ' +
            'AND Case_Assignment_Queue__c != null ' +
            'AND CreatedDate = TODAY ' +
            'AND (Foundation_Record__c = TRUE OR Case_Category__c = \'New Digital Support\') ' +
            'AND Account.FNDN_Billed_Through_TVM__c = TRUE';

        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Case> listCases) {

        System.debug('>>>> Hybrid execute ' + listCases.size());

        if (listCases.isEmpty()) return;

        // Step 1: Get Hybrid Metadata
        Map<String, Case_Routing_Config__mdt> hybridConfigMap =
            new Map<String, Case_Routing_Config__mdt>();

        for (Case_Routing_Config__mdt cfg : [
            SELECT Id, Request_Type__c, Queue__c,
                   Case_Entry__c, Initial_Assignment__c,
                   Field_Name__c
            FROM Case_Routing_Config__mdt
            WHERE Case_Entry__c = 'Auto'
            AND Active__c = true
            AND Case_Type__c = 'Hybrid'
        ]) {
            if (cfg.Request_Type__c != null) {
                hybridConfigMap.put(cfg.Request_Type__c, cfg);
            }
        }

        // Step 2: Collect all queues from cases
        Set<String> setQueues = new Set<String>();

        for (Case c : listCases) {
            if (c.Case_Assignment_Queue__c != null) {
                setQueues.add(c.Case_Assignment_Queue__c);
            }
        }

        // Step 3: Get Group IDs for queues
        Map<String, Id> groupIdMap = new Map<String, Id>();

        for (Group g : [
            SELECT Id, Name
            FROM Group
            WHERE Name IN :setQueues
            AND Type = 'Queue'
        ]) {
            groupIdMap.put(g.Name, g.Id);
        }

        // NEW: Exclude Out of Office users
        Set<Id> oooUserIds = new Map<Id, User>(
            [SELECT Id FROM User WHERE OOO__c = true]
        ).keySet();

        // Step 4: Get Users in each Group
        Map<String, List<String>> groupUserMap =
            new Map<String, List<String>>();

        Map<Id, List<String>> groupMembersMap =
            new Map<Id, List<String>>();

        for (GroupMember gm : [
            SELECT GroupId, UserOrGroupId
            FROM GroupMember
            WHERE GroupId IN :groupIdMap.values()
            AND UserOrGroupId NOT IN :oooUserIds
        ]) {
            if (!groupMembersMap.containsKey(gm.GroupId)) {
                groupMembersMap.put(
                    gm.GroupId,
                    new List<String>()
                );
            }

            groupMembersMap.get(gm.GroupId)
                .add(gm.UserOrGroupId);
        }

        for (String grpName : groupIdMap.keySet()) {
            Id gid = groupIdMap.get(grpName);

            if (groupMembersMap.containsKey(gid)) {
                groupUserMap.put(
                    grpName,
                    groupMembersMap.get(gid)
                );
            }
        }

        // Step 5: Get last assigned user for round robin
        Set<String> setUserIds = new Set<String>();

        setQueues.clear();

        for (Case c : listCases) {
            Case_Routing_Config__mdt cfg =
                hybridConfigMap.get(c.Case_Request__c);

            if (
                cfg != null &&
                cfg.Queue__c != null &&
                groupUserMap.containsKey(cfg.Queue__c) &&
                cfg.Initial_Assignment__c == 'Queue' &&
                cfg.Case_Entry__c == 'Auto'
            ) {
                setQueues.add(cfg.Queue__c);

                for (String uid :
                     groupUserMap.get(cfg.Queue__c)) {
                    setUserIds.add(uid);
                }
            }
        }

        // Fetch previous assignments
        List<Case> listOldRecords = [
            SELECT OwnerId, Case_Assign_To__c,
                   Case_Assignment_Queue__c
            FROM Case
            WHERE Case_Assign_To__c IN :setUserIds
            AND Case_Assignment_Queue__c IN :setQueues
            ORDER BY LastModifiedDate DESC
        ];

        Map<String, Case> mapQueueAndCases =
            new Map<String, Case>();

        for (Case c : listOldRecords) {
            if (!mapQueueAndCases.containsKey(
                c.Case_Assignment_Queue__c
            )) {
                mapQueueAndCases.put(
                    c.Case_Assignment_Queue__c,
                    c
                );
            }
        }

        // Step 6: Assign cases
        Map<String, Integer> mapQueueNextIndex =
            new Map<String, Integer>();

        Integer userNotAvailableIndex = 0;

        for (Case c : listCases) {

            if (c.Case_Assign_To__c != null) {
                continue;
            }

            Case_Routing_Config__mdt cfg =
                hybridConfigMap.get(c.Case_Request__c);

            if (
                cfg != null &&
                cfg.Queue__c != null &&
                groupUserMap.containsKey(cfg.Queue__c) &&
                !groupUserMap.get(cfg.Queue__c).isEmpty() &&
                cfg.Initial_Assignment__c == 'Queue'
            ) {

                List<String> userIds =
                    groupUserMap.get(cfg.Queue__c);

                String lastAssignedUserId =
                    mapQueueAndCases.containsKey(
                        c.Case_Assignment_Queue__c
                    )
                    ? mapQueueAndCases.get(
                        c.Case_Assignment_Queue__c
                    ).Case_Assign_To__c
                    : null;

                Integer nextUserIndex =
                    String.isNotBlank(lastAssignedUserId)
                    ? userIds.indexOf(lastAssignedUserId) + 1
                    : 0;

                if (!mapQueueNextIndex.containsKey(
                    c.Case_Assignment_Queue__c
                )) {
                    mapQueueNextIndex.put(
                        c.Case_Assignment_Queue__c,
                        nextUserIndex
                    );
                }

                nextUserIndex = mapQueueNextIndex.get(
                    c.Case_Assignment_Queue__c
                );

                if (nextUserIndex >= userIds.size()) {
                    nextUserIndex = 0;
                }

                // Assign case
                c.OwnerId = userIds[nextUserIndex];

                c.Case_Assign_To__c =
                    userIds[nextUserIndex];

                mapQueueNextIndex.put(
                    c.Case_Assignment_Queue__c,
                    nextUserIndex + 1
                );

                System.debug(
                    'Hybrid Case Assigned To : ' + c.OwnerId
                );
            }
        }

        // Step 7: Update cases
        update listCases;
    }

    global void finish(Database.BatchableContext bc) {
        System.debug(
            'Hybrid Case Assignment Batch finished.'
        );
    }
}
```

## History

| Date | Change |
|---|---|
| 2026-10-12 | Documented from the org version of that date. |
| 2026-10-16 | Updated to the 2026-10-16 org version. **OOO users are excluded**, as in `CaseAssignmentBatch`, and a new guard skips queues whose member list is empty (see [REQ_004](../../03%20-%20Requirements/REQ_004_2026-10-16%20-%20CaseAssignment%20for%20OOO%20Users%20-%20Case%20Entry%20is%20Auto/REQ_004_2026-10-16%20-%20CaseAssignment%20for%20OOO%20Users%20-%20Case%20Entry%20is%20Auto.md)). The rest of the code was reformatted. |
