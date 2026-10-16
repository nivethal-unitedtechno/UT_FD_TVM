# Apex Class: CaseAssignmentBatch

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `CaseAssignmentBatch` |
| Type | Apex Class |
| API Version | 65.0 |
| Status | Active |
| Lines | 321 |
| Last Modified | 2026-10-16 06:36 UTC by Sandip Patel |

## Related Components

- Test classes: [CaseAssignmentBatchTest](CaseAssignmentBatchTest.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 6 | `String query = 'SELECT OwnerId, Case_Assign_To__c, Case_Assignment_Queue__c, Case_Request__c, Status_Filtered__c FROM Case WHERE Case_Assign_To__c = null AND Case_Assignment_Queue__c != null AND Creat` |

## Source

```apex
global class CaseAssignmentBatch implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        // Unassigned = Case_Assign_To__c is empty
        String query = 'SELECT OwnerId, Case_Assign_To__c, Case_Assignment_Queue__c, Case_Request__c, Status_Filtered__c FROM Case WHERE Case_Assign_To__c = null AND Case_Assignment_Queue__c != null AND CreatedDate = TODAY AND (Foundation_Record__c = TRUE OR Case_Category__c = \'New Digital Support\') AND Account.FNDN_Billed_Through_TVM__c = false';

        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Case> listCases)
    {
        System.debug('>>>> execute ' + listCases.size());

        Map<String, Case_Routing_Config__mdt> configMap =
            new Map<String, Case_Routing_Config__mdt>();

        for (Case_Routing_Config__mdt config : [
            SELECT Id, Request_Type__c, Queue__c, Case_Entry__c,
                   Initial_Assignment__c, Field_Name__c
            FROM Case_Routing_Config__mdt
            WHERE Case_Entry__c = 'Auto'
            AND Active__c = true
            AND Case_Type__c = 'Non Hybrid'
        ])
        {
            if (config.Request_Type__c != null)
            {
                configMap.put(config.Request_Type__c, config);
            }
        }

        Set<String> setQueues = new Set<String>();

        for (Case objCase : listCases)
        {
            setQueues.add(objCase.Case_Assignment_Queue__c);
        }

        Map<String, List<String>> groupUserMap =
            new Map<String, List<String>>();

        // Fetch Group IDs
        Map<String, Id> groupIdMap = new Map<String, Id>();

        for (Group grp : [
            SELECT Id, Name
            FROM Group
            WHERE Name IN :setQueues
            AND Type = 'Queue'
        ])
        {
            groupIdMap.put(grp.Name, grp.Id);
        }

        // NEW: Exclude Out of Office users
        Set<Id> oooUserIds = new Map<Id, User>(
            [SELECT Id FROM User WHERE OOO__c = true]
        ).keySet();

        // Fetch queue members excluding OOO users
        Map<Id, List<String>> groupMembersMap =
            new Map<Id, List<String>>();

        for (GroupMember member : [
            SELECT GroupId, UserOrGroupId
            FROM GroupMember
            WHERE GroupId IN :groupIdMap.values()
            AND UserOrGroupId NOT IN :oooUserIds
        ])
        {
            if (!groupMembersMap.containsKey(member.GroupId))
            {
                groupMembersMap.put(
                    member.GroupId,
                    new List<String>()
                );
            }

            groupMembersMap.get(member.GroupId)
                .add(member.UserOrGroupId);
        }

        // Map users back to group names
        for (String groupName : groupIdMap.keySet())
        {
            String groupId = groupIdMap.get(groupName);

            if (groupMembersMap.containsKey(groupId))
            {
                groupUserMap.put(
                    groupName,
                    groupMembersMap.get(groupId)
                );
            }
        }

        Set<String> setUserIds = new Set<String>();

        setQueues.clear();

        for (Case objCase : listCases)
        {
            if (
                objCase.Case_Request__c != null &&
                configMap.get(objCase.Case_Request__c) != null
            )
            {
                Case_Routing_Config__mdt config =
                    configMap.get(objCase.Case_Request__c);

                if (
                    config.Queue__c != null &&
                    groupUserMap.get(config.Queue__c) != null &&
                    config.Initial_Assignment__c != null &&
                    config.Initial_Assignment__c == 'Queue' &&
                    config.Case_Entry__c == 'Auto'
                )
                {
                    setQueues.add(config.Queue__c);

                    for (String str :
                         groupUserMap.get(config.Queue__c))
                    {
                        setUserIds.add(str);
                    }

                    System.debug('setUserIds : ' + setUserIds);
                }
            }
        }

        List<Case> listOldRecords = [
            SELECT OwnerId, Case_Assign_To__c,
                   Case_Assignment_Queue__c, Case_Request__c
            FROM Case
            WHERE Case_Assign_To__c IN :setUserIds
            AND Case_Assignment_Queue__c IN :setQueues
            ORDER BY LastModifiedDate DESC
        ];

        Map<String, Case> mapQueueAndCases =
            new Map<String, Case>();

        System.debug('listOldRecords : ' + listOldRecords);

        for (Case objCase : listOldRecords)
        {
            if (!mapQueueAndCases.containsKey(
                objCase.Case_Assignment_Queue__c
            ))
            {
                System.debug(
                    'Case Assignment Queue : ' +
                    objCase.Case_Assignment_Queue__c
                );

                System.debug(
                    'Last Assigned user : ' +
                    objCase.Case_Assign_To__c
                );

                mapQueueAndCases.put(
                    objCase.Case_Assignment_Queue__c,
                    objCase
                );
            }
        }

        System.debug(
            'mapQueueAndCases : ' +
            mapQueueAndCases.keySet()
        );

        System.debug(
            'mapQueueAndCases : ' +
            mapQueueAndCases.values()
        );

        System.debug('groupUserMap : ' + groupUserMap);

        Integer userNotAvailableIndex = 0;

        Map<String, Integer> mapUserIdAndIds =
            new Map<String, Integer>();

        for (Case objCase : listCases)
        {
            if (
                objCase.Case_Request__c != null &&
                configMap.get(objCase.Case_Request__c) != null
            )
            {
                Case_Routing_Config__mdt config =
                    configMap.get(objCase.Case_Request__c);

                if (
                    config.Queue__c != null &&
                    groupUserMap.get(config.Queue__c) != null &&
                    config.Initial_Assignment__c != null &&
                    config.Initial_Assignment__c == 'Queue'
                )
                {
                    List<String> userIds =
                        groupUserMap.get(config.Queue__c);

                    System.debug('userIds : ' + userIds);
                    System.debug('=========> : ' + objCase.Id);
                    System.debug(
                        '----------> : ' +
                        objCase.Case_Assignment_Queue__c
                    );

                    if (
                        mapQueueAndCases.containsKey(
                            objCase.Case_Assignment_Queue__c
                        )
                    )
                    {
                        String caseAssignedId =
                            mapQueueAndCases.get(
                                objCase.Case_Assignment_Queue__c
                            ) != null &&
                            mapQueueAndCases.get(
                                objCase.Case_Assignment_Queue__c
                            ).Case_Assign_To__c != null
                            ?
                            mapQueueAndCases.get(
                                objCase.Case_Assignment_Queue__c
                            ).Case_Assign_To__c
                            : '';

                        System.debug(
                            'caseAssignedId : ' + caseAssignedId
                        );

                        Integer nextUserIndex =
                            String.isNotBlank(caseAssignedId)
                            ? userIds.indexOf(caseAssignedId) + 1
                            : 0;

                        if (
                            !mapUserIdAndIds.containsKey(
                                objCase.Case_Assignment_Queue__c
                            )
                        )
                        {
                            mapUserIdAndIds.put(
                                objCase.Case_Assignment_Queue__c,
                                nextUserIndex
                            );
                        }

                        nextUserIndex = mapUserIdAndIds.get(
                            objCase.Case_Assignment_Queue__c
                        );

                        if (nextUserIndex >= userIds.size())
                        {
                            nextUserIndex = 0;
                        }

                        System.debug(
                            'nextUserIndex : ' + nextUserIndex
                        );

                        // Assign Case
                        objCase.Case_Assign_To__c =
                            userIds[nextUserIndex];

                        objCase.OwnerId =
                            userIds[nextUserIndex];

                        mapUserIdAndIds.put(
                            objCase.Case_Assignment_Queue__c,
                            nextUserIndex + 1
                        );

                        System.debug(
                            'Case Assigned To : ' + objCase.OwnerId
                        );
                    }
                    else
                    {
                        if (
                            userNotAvailableIndex >= userIds.size()
                        )
                        {
                            userNotAvailableIndex = 0;
                        }

                        System.debug(
                            'userNotAvailableIndex : ' +
                            userNotAvailableIndex
                        );

                        // Assign Case
                        objCase.Case_Assign_To__c =
                            userIds[userNotAvailableIndex];

                        objCase.OwnerId =
                            userIds[userNotAvailableIndex];

                        System.debug(
                            'Case Assigned To : ' + objCase.OwnerId
                        );

                        userNotAvailableIndex++;
                    }
                }
            }
        }

        UPDATE listCases;
    }

    global void finish(Database.BatchableContext bc)
    {
        // Execute any post-processing operations
    }
}
```

## History

| Date | Change |
|---|---|
| 2026-10-12 | Documented from the org version of that date. |
| 2026-10-16 | Updated to the 2026-10-16 org version. **OOO users are excluded**: the batch loads every User with `OOO__c = true` and leaves them out of each queue's `GroupMember` list (see [REQ_004](../../03%20-%20Requirements/REQ_004_2026-10-16%20-%20CaseAssignment%20for%20OOO%20Users%20-%20Case%20Entry%20is%20Auto/REQ_004_2026-10-16%20-%20CaseAssignment%20for%20OOO%20Users%20-%20Case%20Entry%20is%20Auto.md)). The rest of the code was reformatted. |
