# Flow: Update case assignment when status is Ready for QA

> Case flow that filters on `Foundation_Record__c = true`. Retrieved from org **FD - TVM Sandbox** (`teamvelocity--fullsando`).

## Summary

| Property | Value |
|---|---|
| API Name | `Update_case_assignment_when_status_is_Ready_for_QA` |
| Label | Update case assignment when status is Ready for QA |
| Status | Active |
| Process Type | AutoLaunchedFlow |
| Trigger Object | Case |
| Trigger Type | RecordAfterSave |
| Record Trigger Type | CreateAndUpdate |
| Run In Mode | Default |
| API Version | 63.0 |
| Description | FND |

## Trigger & Entry Criteria

Filter logic: `(1 AND 2 AND 3 ) OR (1 AND 2 AND 4 )`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Status_Filtered__c` | EqualTo | stringValue: Ready for QA |
| 2 | `Status_Filtered__c` | IsChanged | booleanValue: true |
| 3 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |
| 4 | `Case_Category__c` | EqualTo | stringValue: New Digital Support |

## Foundation_Record__c = true Usage

### Start (Entry Criteria): `start`

Logic: `(1 AND 2 AND 3 ) OR (1 AND 2 AND 4 )`

| # | Field / Reference | Operator | Value |
|---|---|---|---|
| 1 | `Status_Filtered__c` | EqualTo | stringValue: Ready for QA |
| 2 | `Status_Filtered__c` | IsChanged | booleanValue: true |
| 3 | `Foundation_Record__c` **(FR)** | EqualTo | booleanValue: true |
| 4 | `Case_Category__c` | EqualTo | stringValue: New Digital Support |

## Flow Elements

| Type | API Name | Label |
|---|---|---|
| Decision | `Check_Case_assignment_User` | Check Case assignment User |
| Update Records | `Copy_1_of_Update_case_assignment_to_Secondary_AT` | Copy 1 of Update case assignment to Secondary AT |
| Update Records | `Update_case_assignment_to_Secondary_AT` | Update case assignment to Secondary AT |
| Formula | `OwnerIDFinal` |  |

## Full Metadata (Flow XML)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>63.0</apiVersion>
    <decisions>
        <name>Check_Case_assignment_User</name>
        <label>Check Case assignment User</label>
        <locationX>182</locationX>
        <locationY>323</locationY>
        <defaultConnector>
            <targetReference>Copy_1_of_Update_case_assignment_to_Secondary_AT</targetReference>
        </defaultConnector>
        <defaultConnectorLabel>Default Outcome</defaultConnectorLabel>
        <rules>
            <name>If_OOO</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <leftValueReference>$Record.Owner:User.OOO__c</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <booleanValue>true</booleanValue>
                </rightValue>
            </conditions>
            <conditions>
                <leftValueReference>$Record.Account.Secondary_Account_Technician__c</leftValueReference>
                <operator>IsNull</operator>
                <rightValue>
                    <booleanValue>false</booleanValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>Update_case_assignment_to_Secondary_AT</targetReference>
            </connector>
            <label>If OOO</label>
        </rules>
    </decisions>
    <description>FND</description>
    <environments>Default</environments>
    <formulas>
        <name>OwnerIDFinal</name>
        <dataType>String</dataType>
        <expression>IF(
  OR( ISBLANK({!$Record.OwnerId}), ISNULL({!$Record.OwnerId}) ),
  {!$User.Id},
  {!$Record.OwnerId}
)</expression>
    </formulas>
    <interviewLabel>Update case assignment when status is Ready for QA {!$Flow.CurrentDateTime}</interviewLabel>
    <label>Update case assignment when status is Ready for QA</label>
    <processMetadataValues>
        <name>BuilderType</name>
        <value>
            <stringValue>LightningFlowBuilder</stringValue>
        </value>
    </processMetadataValues>
    <processMetadataValues>
        <name>CanvasMode</name>
        <value>
            <stringValue>AUTO_LAYOUT_CANVAS</stringValue>
        </value>
    </processMetadataValues>
    <processMetadataValues>
        <name>OriginBuilderType</name>
        <value>
            <stringValue>LightningFlowBuilder</stringValue>
        </value>
    </processMetadataValues>
    <processType>AutoLaunchedFlow</processType>
    <recordUpdates>
        <name>Copy_1_of_Update_case_assignment_to_Secondary_AT</name>
        <label>Copy 1 of Update case assignment to Secondary AT</label>
        <locationX>314</locationX>
        <locationY>431</locationY>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>OwnerIDFinal</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <recordUpdates>
        <name>Update_case_assignment_to_Secondary_AT</name>
        <label>Update case assignment to Secondary AT</label>
        <locationX>50</locationX>
        <locationY>431</locationY>
        <inputAssignments>
            <field>OwnerId</field>
            <value>
                <elementReference>$Record.Account.Secondary_Account_Technician__r.Id</elementReference>
            </value>
        </inputAssignments>
        <inputReference>$Record</inputReference>
    </recordUpdates>
    <start>
        <locationX>56</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Check_Case_assignment_User</targetReference>
        </connector>
        <filterLogic>(1 AND 2 AND 3 ) OR (1 AND 2 AND 4 )</filterLogic>
        <filters>
            <field>Status_Filtered__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>Ready for QA</stringValue>
            </value>
        </filters>
        <filters>
            <field>Status_Filtered__c</field>
            <operator>IsChanged</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Foundation_Record__c</field>
            <operator>EqualTo</operator>
            <value>
                <booleanValue>true</booleanValue>
            </value>
        </filters>
        <filters>
            <field>Case_Category__c</field>
            <operator>EqualTo</operator>
            <value>
                <stringValue>New Digital Support</stringValue>
            </value>
        </filters>
        <object>Case</object>
        <recordTriggerType>CreateAndUpdate</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Active</status>
</Flow>
```
