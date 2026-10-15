# Rule for Documentation

## 1. Where each kind of event is recorded

| Event | Folder | What to do |
|---|---|---|
| A new task, requirement, enhancement, defect or change request | `03-Requirements/` | Run `python scripts/new_doc.py REQ "<title>"`, then complete the document |
| An existing requirement is changed | `03-Requirements/` | Edit the same REQ, add a row to its History table, and leave the original request wording in place |
| A real change to business records or configuration data in the org | `04-Change-Records/` | Run `new_doc.py CR "<title>"` and record before/after values that have been verified |
| Salesforce metadata is added, modified or deleted | `07-Technical-Documents/` | Update the relevant topic document and add a dated row to `Change-History.md` (the inventories are rebuilt automatically) |
| A significant change to behaviour, architecture, dependencies, data model or security | `02-Knowledge-Base/` | Update the matching page and its History table |
| A technical error, conflict or unexpected result | `05-Conflicts/` | Run `new_doc.py CF "<title>"`; when it is resolved, keep the original evidence |
| Preparing, validating, running or verifying a deployment | `06-Deployment/` | Run `new_doc.py DEP "<title>"` and use the standard checklists |
| A change to a standing rule or to how the automation behaves | `01-Instructions/` | Update the rule and its History / Decisions table |

A single event may belong in more than one folder. For example, a fix that gets deployed needs a REQ, a CF, a DEP and an update in `07-Technical-Documents`. Don't add entries to folders that don't apply.

**Retrieving metadata is neither a record change nor a deployment.** Log it only in `07-Technical-Documents/Change-History.md`.

## 2. Dated records

- **File name format:** `YYYY-MM-DD-<TYPE>-<NNN>-<slug>.md`, for example `03-Requirements/2026-10-14-REQ-001-case-routing.md`.
  - The types are `REQ`, `CR`, `CF` and `DEP`. Templates are in [`config/templates/`](../config/templates/).
- **Dates:** use the date the event actually happened, in the local time zone. Any timestamp inside a record must show its time zone.
- **IDs:** `scripts/new_doc.py` hands out IDs, using the next free number for each type.
  - An ID is never reused.
  - A cancelled item keeps its number, with the status *Cancelled*.
- **No duplicate records:** if a record with the same `--key` already exists, `new_doc.py` returns it instead of creating a new one. The same applies to the same type, date and title.
  - Pass a stable event key with `--key`, for example `--key cr-case-500xx-status-2026-10-14`.
- **Front matter:** `id`, `date`, `title` and `status` must agree with the file name. `scripts/autocommit.py` checks this.
- **Updating records:** add to records rather than quietly rewriting them.
  - Every update gets a new row in the History table.
  - The original evidence stays in place.
- **Links:** each record must link to its related REQ, CR, CF, DEP and `07-Technical-Documents` documents.

## 3. Evidence rules

- **Record changes (CR):**
  - Take the before and after values from queries run before and after the change. A Git diff or a metadata retrieval is not proof that a record changed.
  - For bulk changes, record the approved scope, the counts (selected, succeeded, failed), the validation results and sanitized evidence.
  - Don't paste complete data extracts or personal data that isn't needed.
- **Conflicts (CF):** keep *suspected* causes apart from the *confirmed* root cause. Don't mark a conflict as resolved until it has been verified.
- **Deployments (DEP):** preparation, approval, execution and verification each have their own status. A plan does not count as an approval.
- **Never make anything up**, including dates, values, approvals, IDs or results. Write **TO BE CONFIRMED** and state what is still needed.

## 4. Technical documents (`07-Technical-Documents/`)

- **Topic folders** (`Apex-Classes/`, `Flows/`, `Objects-and-Fields/` and so on) hold explanations written by hand.
  - They cover purpose, entry points, dependencies, behaviour, security, tests and verification.
  - Use stable file names, one per component or per functional area, for example `Apex-Classes/CaseTriggerHandler.md`.
  - Each document has a History table.
- **`Metadata-Inventory/`** is produced from source by `scripts/build_inventory.py`. Don't edit it by hand.
- **`Change-History.md`:**
  - Add one dated row for each component that is created, changed or removed, or one `[bulk: <manifest>]` row for a bulk retrieval.
  - The auto-commit rejects source changes that have no matching row.
- **Source code:** link to the source file instead of copying whole files into a document.

## 5. Knowledge Base (`02-Knowledge-Base/`)

- **Sources:** only verified Fullsandbox metadata, TVM source and approved requirements.
- **Unverified content:** label assumptions and gaps in coverage clearly, using `ASSUMPTION:` and `NOT YET VERIFIED:`.
- **History:** update the History table at the bottom of each page.

## 6. Index

`DOCUMENT-INDEX.md` is created by `scripts/build_index.py` and rebuilt with every automatic commit.

## History

| Date | Change |
|---|---|
| 2026-10-14 | Rules created as part of the TVM setup. |
| 2026-10-15 | Reworded and added to `Instructions/` as "Rule for Documentation". |
