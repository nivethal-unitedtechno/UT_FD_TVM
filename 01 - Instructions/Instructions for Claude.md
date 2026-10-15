# Claude Working Instructions for Salesforce

*Reusable prerequisites, safety rules, prompt patterns, and execution workflow*

**Purpose.** Use this document as the standing instruction set for Claude when it is used from VS Code for Salesforce work. It preserves the intent of the AI Enablement Field Guide: give the tool verified org context, prevent guessed metadata, analyse impact before changing code, keep scope controlled, validate in a sandbox, and keep production deployment under human control.

---

## 1. Non-negotiable operating rules

1. Work in the approved sandbox first. Never create, modify, deploy, activate, delete, or run data-changing operations in Production unless a human explicitly authorizes the exact production action through the approved deployment process.
2. At the beginning of every Salesforce session, identify the intended org. Do not assume the VS Code default org is correct.
3. For Salesforce CLI commands, explicitly specify the intended org alias with `--target-org` (or `-o`) whenever practical. Do not silently rely on a default target when multiple orgs are authenticated.
4. Before making changes, verify the org alias, username, Org ID, and instance URL. If the intended org cannot be confirmed, stop and ask.
5. Use only verified object, field, record type, flow, Apex class, permission set, queue, custom metadata, and other component API names. Never invent or infer an API name.
6. If required metadata or source is missing, state exactly what is missing and ask for it. Do not fill the gap with a plausible Salesforce name.
7. Do not modify managed-package components unless the task explicitly permits it and the component is editable.
8. Stay inside the requested scope. Do not clean up, refactor, rename, or improve unrelated code while completing another change.
9. Analyse the existing automation and dependencies before writing implementation code.
10. All generated code must be reviewed by a human. AI output is a draft, not deployment approval.
11. Use synthetic data in prompts and tests. Do not place production record data, PII, PHI, regulated data, passwords, tokens, session IDs, API keys, named credential secrets, connection strings, or other secrets into prompts.
12. Production deployment remains a human-controlled activity using the approved deployment path and a reviewed deployment document.

## 2. Mandatory session startup / prerequisites

Claude must complete or request the following context before implementation work begins.

- **Requirement:** what must change, which business process is affected, who is affected, what is explicitly out of scope, and the acceptance criteria.
- **Environment:** intended sandbox name/alias, production alias if relevant only for comparison, Salesforce API version, and the approved deployment path.
- **Org verification:** output of `sf org list` and/or `sf org display --target-org <alias>` sufficient to confirm the intended sandbox.
- **Exact metadata:** relevant object and field API names, data types, picklist values, record types, validation rules, page/layout constraints, and security requirements.
- **Automation inventory:** relevant record-triggered flows, Apex triggers/handlers, helper/service classes, batch/scheduled jobs, approval/process automation, and custom metadata used by the process.
- **Complete source** where reasoning depends on it. Prefer the full class/trigger/flow metadata over a manually summarized snippet.
- **Access context** when applicable: affected profiles, permission sets, FLS, sharing, user mode, integration-user behaviour, and any special execution context.
- **Known org landmines:** legacy automation, nightly jobs, integration users, production-only differences, managed packages, or known order-of-execution conflicts.
- **Existing tests** for the affected code and any regression tests that cover the same object/process.

## 3. Required org verification before Claude uses Salesforce CLI

When more than one org is authenticated, Claude should treat org selection as a safety gate.

**Recommended verification commands**

```bash
sf org list
sf config get target-org
sf org display --target-org "<INTENDED_SANDBOX_ALIAS>"

# Confirm:
# - Alias
# - Username
# - Org ID
# - Instance URL
# - That this is the intended sandbox

# For later commands, prefer:
sf <command> --target-org "<INTENDED_SANDBOX_ALIAS>" ...
```

If the command is destructive, data-changing, deployment-related, or could activate automation, Claude must first explain the intended action and target org. If the org is ambiguous, it must not proceed.

## 4. Project context block to give Claude at the start of a session

**Copy/paste template**

```text
PROJECT CONTEXT - <Client / Project> / <Org>

ENVIRONMENT
- Intended working org: <sandbox name>
- Salesforce CLI alias: <alias>
- Org ID: <verified Org ID>
- Production is not an implementation target for this session.
- API version: <version>
- Managed packages / namespaces: <list>

SCOPE
- Requirement / ticket: <reference>
- Object(s) / process(es): <list>
- In scope: <specific items>
- Out of scope: <specific items>
- Acceptance criteria: <list>

CONVENTIONS
- Trigger / handler pattern: <project convention>
- Class naming: <project convention>
- Test naming: <project convention>
- No SOQL or DML in loops.
- Bulk-safe for up to 200 records.
- Enforce FLS/sharing according to project standards.
- Do not introduce hardcoded IDs, credentials, or endpoints.

KNOWN AUTOMATION / LANDMINES
- <flows>
- <triggers / handlers>
- <batch or scheduled jobs>
- <integration-user automation>
- <custom metadata / routing>
- <production differences, if known>

RULES FOR THIS SESSION
- Use only API names verified from the org/project.
- If an API name or dependency is missing, stop and ask; do not guess.
- Do not change unrelated components.
- Do not modify managed-package components.
- Analyse impact before writing code.
- Give the approach first and wait for approval before implementation.
- At the end, list all assumptions and anything that remains unverified.
- Do not deploy to Production.
```

## 5. The prompt pattern to use

A strong Salesforce prompt should contain these parts in this order:

| Prompt part | What to provide |
|---|---|
| Context | State the org, object/process, relevant metadata, source code, automation, and conventions. |
| Requirement | Describe the business behaviour to change, not only the proposed technical solution. |
| Scope | Name exactly what Claude may change and what it must leave alone. |
| Task | Ask for one concrete artifact or analysis at a time. |
| Constraints | State bulk, security, naming, compatibility, and no-guessing rules. |
| Verification | Tell Claude how the result will be tested and what evidence you expect. |
| Uncertainty | Require a list of missing information, unverified assumptions, and any API names not supplied/verified. |

## 6. Standard workflow Claude must follow

1. **Understand the requirement:** Restate the requested behaviour, scope, acceptance criteria, and open questions. Do not code yet.
2. **Verify the environment:** Confirm the intended sandbox and explicitly target it in Salesforce CLI commands.
3. **Gather/read context:** Inspect the full relevant metadata/source. Identify anything missing.
4. **Impact analysis:** Identify everything in the supplied/retrieved context that reads, writes, triggers, routes, validates, or otherwise depends on the fields/process being changed.
5. **Propose approach:** Explain which components would change, what would be added, what will deliberately remain unchanged, risks, alternatives, and testing strategy. Wait for approval when the user requests approval-first workflow.
6. **Implement narrowly:** Make only the agreed change. Preserve existing behaviour outside the requirement.
7. **Declare assumptions:** List unverified assumptions and any names/dependencies that could not be confirmed.
8. **Test:** Cover positive, negative, bulk, and permission/security paths where applicable; assertions must verify real outcomes.
9. **Regression check:** Run/recommend relevant existing tests for the affected object/process, not only the newly written test.
10. **Manual verification:** Define a sandbox walkthrough using an affected user/profile and exact expected results.
11. **Review/deployment preparation:** Prepare a component inventory, risk notes, pre/post steps, validation tests, and rollback steps. Do not treat this as authorization to deploy to Production.

## 7. Prompt library

### A. Impact analysis - before code

```text
Use the project context and metadata above.

Requirement:
<describe requirement>

Before writing or changing code:
1. Identify every supplied/retrieved component that can affect this behaviour.
2. Identify every place that reads or writes the relevant fields.
3. Explain possible order-of-execution conflicts.
4. Explain what existing behaviour could regress.
5. List what you still need to inspect before you can be confident.
6. Separate verified facts from assumptions.

Do not write code yet.
```

### B. Ask for the implementation approach

```text
Based on the approved requirement and impact analysis, propose the implementation approach before changing anything.

Tell me:
- components you would modify
- components you would create
- components you will deliberately leave unchanged
- logic at a high level
- security/bulk considerations
- test strategy
- risks and trade-offs
- any missing information

If multiple approaches are reasonable, compare them. Do not implement until I approve the approach.
```

### C. Implementation prompt

```text
Implement only the approved approach.

Requirements:
- Preserve unrelated behaviour.
- Use only verified API names.
- No SOQL/DML in loops.
- Bulk-safe to 200 records.
- Follow the project's FLS/sharing/security conventions.
- No hardcoded IDs, credentials, or endpoints.
- Do not refactor adjacent code unless explicitly approved.

When finished, provide:
1. files/components changed
2. concise explanation of each change
3. every assumption made
4. anything that could not be verified
5. any API/component name used that was not explicitly supplied or verified
6. tests that should be run.
```

### D. Apex test prompt

```text
Create/update tests for the approved change.

Cover, where applicable:
- positive path
- negative path
- bulk path (up to 200 records)
- permission/restricted-user path
- null/boundary conditions
- regression behaviour affected by the change

Every test must assert a meaningful, specific result. Do not add tests whose only purpose is coverage percentage. Use only verified metadata/API names.
```

### E. Debugging prompt

```text
The following failed in the sandbox:
<exact error / stack trace>

Relevant source and metadata:
<paste or point to exact files>

Do not change code yet.
1. Rank the most likely causes.
2. For each cause, tell me exactly what evidence to check.
3. Distinguish code defects from org configuration/data/setup issues.
4. Identify any additional metadata/source needed.
5. After we confirm the cause, propose the smallest safe fix.
```

### F. Senior-review prompt

```text
Review this change as a strict Salesforce senior reviewer.

Compare the before/after code and the existing automation. Check:
- scope creep
- bulk safety
- SOQL/DML/callouts in loops
- governor-limit exposure
- FLS and sharing
- null handling
- hardcoded IDs/endpoints
- order of execution
- conflicts with flows/triggers/validation rules
- test quality and missing scenarios
- production-volume risks

Give concrete findings tied to the relevant code/component. Do not rewrite the solution unless I ask.
```

## 8. Testing and acceptance requirements

- Do not accept coverage percentage as proof of correctness.
- Each test must assert a specific outcome: field value, owner, status, record count, exception, permission result, or other observable behaviour.
- Run the new/changed tests in the sandbox and also run relevant existing tests on the affected object/process.
- Read the assertions. A green test that mocks away the logic or asserts a constant is not useful.
- Where practical, validate the behaviour manually in the sandbox as a user with the affected profile/permissions.
- QA scenarios should be derived from the requirement and acceptance criteria, not merely from the implementation.

## 9. Production and deployment guardrails

- Claude may help draft a deployment document, component inventory, test plan, verification plan, and rollback plan.
- Every component/API name in a deployment document must be verified against the sandbox.
- Record manual configuration performed in the sandbox so it is not forgotten during promotion.
- Before production, consider differences in data volume, sharing, profiles/permissions, scheduled jobs, integrations, and production-only automation.
- Production deployment must be executed by an authorized person through the approved client process. AI output is not deployment authorization.
- Post-deployment verification and rollback steps must be explicit enough that another qualified developer could follow them.

## 10. When Claude should stop and ask

- The intended Salesforce org cannot be positively identified.
- A required API name, record type, queue, metadata record, field type, picklist value, or dependency is unknown.
- The relevant class/trigger/flow is only partially available and the missing portion can affect the reasoning.
- The requirement or acceptance criteria are ambiguous.
- The proposed change could affect automation that has not been inspected.
- The action would touch Production or perform a destructive/data-changing operation not explicitly authorized.
- The task would require exposing secrets, production data, PII/PHI, or regulated data.
- After repeated correction attempts, the root cause remains unverified. Stop patching and return to evidence gathering.

## 11. Troubleshooting poor AI output

| Problem | Response |
|---|---|
| Invented field/API names | Provide the actual field/component list and require Claude to ask rather than guess. |
| Ignored project conventions | Re-send the current project context block and a known-good reference class/pattern. |
| Missed automation | Expand the context pack and add the discovered dependency to the org's landmines/automation inventory. |
| Session quality drifting | Start a fresh session for the ticket and re-supply the verified context. |
| Unrelated code changed | Tighten scope: name the exact files/methods/components allowed to change, then redo rather than untangling a broad rewrite. |
| Tests pass but behaviour is wrong | Derive tests from the requirement, require meaningful assertions, and include negative/bulk/security cases. |
| Sandbox works but Production differs | Review data volume, sharing, permissions, integrations, scheduled automation, and production-only configuration before deployment. |

## 12. Short master instruction for Claude

**Use this as the standing instruction in VS Code**

```text
You are assisting with Salesforce development from VS Code.

Safety and accuracy rules:
1. Work only against the sandbox I identify. Before Salesforce work, verify the target org. When multiple orgs are authenticated, explicitly use --target-org "<alias>" in Salesforce CLI commands.
2. Never assume or guess object, field, record type, queue, class, flow, custom metadata, permission, or other API names. Verify them from the org/project or ask me.
3. Read the complete relevant source/metadata before proposing a change.
4. Perform impact analysis before implementation. Identify existing flows, triggers, handlers, validation rules, jobs, routing/configuration, and security that could interact with the change.
5. Give me the approach before making broad changes. State what you will change and what you will leave untouched.
6. Stay strictly within scope. Do not refactor or improve unrelated code.
7. Keep Apex bulk-safe, avoid SOQL/DML in loops, and follow the project's FLS, sharing, naming, error-handling, and test conventions.
8. Use synthetic data only. Never request or expose production data, PII/PHI, credentials, tokens, session IDs, API keys, named credential secrets, or connection strings.
9. Tests must assert real behaviour and include positive, negative, bulk, and security/restricted-user scenarios where applicable.
10. At the end of each implementation, list assumptions, unverified items, and any API/component name that was not directly verified.
11. Do not deploy to Production. Production deployment is human-controlled through the approved process.
12. If the intended org, requirement, metadata, dependency, or safety of an action is uncertain, stop and ask before proceeding.
```

## 13. Developer pre-flight checklist

- [ ] I know the exact sandbox Claude is allowed to use.
- [ ] I verified the org alias / username / Org ID / instance URL.
- [ ] The requirement and acceptance criteria are written.
- [ ] The relevant API names are verified.
- [ ] The relevant trigger/handler/classes are available in full.
- [ ] Relevant flows and validation rules are known.
- [ ] Scheduled/batch/integration-user automation has been considered.
- [ ] Profiles/permission sets/FLS/sharing are included when relevant.
- [ ] No production data or secrets are in the prompt.
- [ ] Claude has been told what is out of scope.
- [ ] Impact analysis happens before implementation.
- [ ] I will review every generated change and meaningful test assertion.

---

*Source basis: Adapted from the supplied AI Enablement Field Guide for Salesforce developers and QA engineers. Wording has been reorganized into a reusable Claude instruction set while preserving the guide's operational intent.*
