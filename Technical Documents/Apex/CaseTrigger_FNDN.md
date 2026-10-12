# Apex Trigger: CaseTrigger_FNDN

> Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`). Part of the Apex that runs on `Foundation_Record__c = true` or `Case_Category__c = 'New Digital Support'`.

## Summary

| Property | Value |
|---|---|
| Name | `CaseTrigger_FNDN` |
| Type | Apex Trigger |
| API Version | 63.0 |
| Status | Active |
| Lines | 177 |
| Object | Case |
| Events | Before Insert, After Insert, Before Update, After Update |

## Related Components

- Test classes: [Test_CaseDueDateTrigger](Test_CaseDueDateTrigger.md)
- Calls: [CalculateCaseDueDate](CalculateCaseDueDate.md), [CaseOOOAssignmentHandler](CaseOOOAssignmentHandler.md)

## Foundation Record / New Digital Support References

| Line | Code |
|---|---|
| 22 | `c.Foundation_Record__c == true \|\|` |
| 23 | `c.Case_Category__c == 'New Digital Support'` |
| 49 | `// NEW Category = New Digital Support` |
| 65 | `oldC.Foundation_Record__c == true \|\|` |
| 66 | `oldC.Case_Category__c == 'New Digital Support' \|\|` |
| 67 | `newC.Foundation_Record__c == true \|\|` |
| 68 | `newC.Case_Category__c == 'New Digital Support'` |

## Source

```apex
// Foundation Apex Trigger
trigger CaseTrigger_FNDN on Case (
    Before Insert,
    After Insert,
    Before Update,
    After Update
) 
{   
    List<Case> filteredNewList = new List<Case>();            
    Map<Id, Case> filteredNewMap = new Map<Id, Case>();      
    Map<Id, Case> filteredOldMap = new Map<Id, Case>();      


    // ============================================================
    // INSERT
    // ============================================================
    if (Trigger.isInsert) 
    {    
        for (Case c : Trigger.new) 
        {
            if (
                c.Foundation_Record__c == true ||
                c.Case_Category__c == 'New Digital Support'
            ) 
            {
                filteredNewList.add(c);

                if (c.Id != null) 
                {
                    filteredNewMap.put(c.Id, c);
                }
            }
        }
    } 


    // ============================================================
    // UPDATE
    //
    // UPDATED LOGIC:
    //
    // Previously this checked only the OLD Case.
    //
    // Now it checks both OLD and NEW Case values.
    //
    // This allows:
    //
    // OLD Category = Something Else
    // NEW Category = New Digital Support
    //
    // to reach CalculateCaseDueDate.onBeforeUpdate().
    // ============================================================
    else if (Trigger.isUpdate) 
    {
        for (Id recId : Trigger.oldMap.keySet()) 
        {
            Case oldC = Trigger.oldMap.get(recId);
            Case newC = Trigger.newMap.get(recId);


            if (
                oldC != null &&
                newC != null &&
                (
                    oldC.Foundation_Record__c == true ||
                    oldC.Case_Category__c == 'New Digital Support' ||
                    newC.Foundation_Record__c == true ||
                    newC.Case_Category__c == 'New Digital Support'
                )
            ) 
            {
                // Store OLD Case
                filteredOldMap.put(recId, oldC);


                // Store NEW Case
                filteredNewList.add(newC);
                filteredNewMap.put(recId, newC);
            }
        }
    }


    // ============================================================
    // BEFORE INSERT
    // ============================================================
    if (Trigger.isInsert && Trigger.isBefore)
    {
        if (!filteredNewList.isEmpty()) 
        {
            System.debug(
                'Trigger run on case before Insert'
            );                    


            CalculateCaseDueDate.onBeforeInsert(
                filteredNewList
            );
        }
    }


    // ============================================================
    // AFTER INSERT
    // ============================================================
    if (Trigger.isInsert && Trigger.isAfter)
    {
        if (!filteredNewList.isEmpty()) 
        {
            System.debug(
                'Trigger ran on case after insert'
            );


            CalculateCaseDueDate.insertCases(
                filteredNewList
            );


            CaseOOOAssignmentHandler.reassignCases(
                filteredNewList
            );
        }    
    }


    // ============================================================
    // BEFORE UPDATE
    // ============================================================
    if (Trigger.isUpdate && Trigger.isBefore)
    {        
        if (!filteredNewList.isEmpty()) 
        {
            System.debug(
                'Trigger ran on case before update'
            );


            CalculateCaseDueDate.calculateCaseDueDate(
                filteredNewList,
                filteredOldMap
            );


            CalculateCaseDueDate.onBeforeUpdate(
                filteredNewList,
                filteredOldMap
            );
        }
    }


    // ============================================================
    // AFTER UPDATE
    // ============================================================
    if (Trigger.isUpdate && Trigger.isAfter)
    {        
        if (!filteredNewList.isEmpty()) 
        {
            System.debug(
                'Trigger ran on case after update'
            );


            CalculateCaseDueDate.afterUpdateCases(
                filteredNewList,
                filteredOldMap
            );


            Th_CaseTrigger.onAfterUpdate(
                filteredNewMap,
                filteredOldMap
            );
        }
    }    
}
```
