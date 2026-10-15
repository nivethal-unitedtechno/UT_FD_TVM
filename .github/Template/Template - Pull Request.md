## Summary and reason

<!-- Describe what this change does and why it is needed. -->

## Components affected

<!-- List each class, trigger, flow, field or other metadata touched by this change. -->

## Checklist

- [ ] Pulled the current version from the org before making changes (manifest `<version>68.0</version>`)
- [ ] Saved a snapshot of the original state in `04-Change-Records/Before-Snapshots/<date>_<change>/`
- [ ] Validation (check-only) deployment succeeded. Dry-run ID:
- [ ] Deployed only after approval ("Deploy to Sandbox"). Deploy ID:
- [ ] Post-deployment checks completed using `06-Deployment/Post-Deployment-Checklist.md`, with evidence stored
- [ ] Change record CR-0xx created in `04-Change-Records/` and added to `DOCUMENT-INDEX.md`
- [ ] Any affected conflicts, requirements or technical documents have been updated
- [ ] The change contains no credentials (pre-commit hook passed)
- [ ] Existing working logic is not altered
