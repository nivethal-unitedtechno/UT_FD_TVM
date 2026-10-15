# 3. Validation and Test Results

## A. Run the tests in the sandbox

```
sf apex run test --target-org "FD - TVM Sandbox" \
  --tests <TestClass1> --tests <TestClass2> \
  --code-coverage --result-format human --wait 30
```

Record **every** run in the results table (section D), including failed runs.

## B. Check-only validation against the target org

A validation compiles the manifest and runs the tests in the target org without changing anything.

**CLI**
```
sf project deploy validate --target-org "<target alias>" \
  --manifest manifest/deploy/<YYYY-MM-DD>_<change>/package.xml \
  --test-level RunSpecifiedTests --tests <TestClass1> --tests <TestClass2> \
  --wait 60
```
Save the **job ID** from the output. Quick deploy (step 4) needs it, and it stays valid for **10 days**.

**Change set**
In the target org, go to Setup → *Inbound Change Sets* → your change set → **Validate**, then choose *Run specified tests*.

### Test level

| Level | When |
|---|---|
| `RunSpecifiedTests` | Default for this project. Each class and trigger in the package must reach **75%** coverage from the named tests. |
| `RunLocalTests` | When the change is broad, or a named-test validation can't cover every component |
| `NoTestRun` | Sandbox only, and only for metadata with no Apex |

## C. Pass criteria

- [ ] The validation status is **Succeeded**, with 0 component errors.
- [ ] 0 test failures.
- [ ] Each changed class and trigger has at least 75% coverage.
- [ ] The tests that cover the requirement's acceptance criteria are named and passed.
- [ ] Warnings were read and either accepted (with a reason) or fixed.

## D. Results log

Add a row for each run. Link the full output (saved under the deployment record's evidence folder).

| Date / time (TZ) | Change (DEP / REQ) | Org | Type (test run / validation) | Test level | Tests run | Failures | Coverage of changed classes | Job ID | Result | Run by |
|---|---|---|---|---|---|---|---|---|---|---|
| — | — | — | — | — | — | — | — | — | No runs recorded yet | — |

## History

| Date | Change |
|---|---|
| 2026-10-15 | Created. |
