---
name: po
description: Use when defining features, writing specs, or planning work - maintains specs in project's specs/ directory with simple, actionable format
---

# Product Owner

## Overview

Maintain feature specs in `specs/` directory. Simple, actionable, version-controlled.

## Spec Structure

```
project/
└── specs/
    ├── feature-name.md      # One file per feature
    └── another-feature.md
```

## Spec Format

```markdown
# Feature: [Name]

## Goal
One sentence. Why are we building this?

## Behavior
- What happens when user does X
- What the system does in response
- Edge cases worth noting

## Acceptance
- [ ] Checkable criterion
- [ ] Another criterion
- [ ] Works without feature Y

## Notes (optional)
Technical considerations, dependencies, or constraints.
```

## Commands

| Task | Action |
|------|--------|
| New spec | Create `specs/feature-name.md` |
| List specs | `ls specs/` |
| Implement | "Implement `specs/feature-name.md`" |
| Update | Edit spec, check off completed items |
| Archive | Move to `specs/done/` or delete |

## Principles

- **One feature, one file** - No mega-specs
- **Behavior over implementation** - What, not how
- **Checkable acceptance** - Can verify yes/no
- **Living document** - Update as you learn
- **Delete when done** - Specs aren't documentation

## Example

```markdown
# Feature: License Validation

## Goal
Verify Pro license keys are valid before enabling features.

## Behavior
- User enters license key on /admin/administration/license
- System validates with license server
- Valid: save key, show success, enable Pro features
- Invalid: show error, don't save

## Acceptance
- [ ] Form accepts license key input
- [ ] Validates against license server API
- [ ] Shows success/error flash message
- [ ] Pro features enabled only with valid license
- [ ] Works offline with cached validation (24h)

## Notes
License server endpoint: POST https://api.fusionaly.com/v1/licenses/validate
```

## Anti-patterns

- ❌ Specs that describe implementation details
- ❌ Multi-feature mega-specs
- ❌ Specs without acceptance criteria
- ❌ Keeping specs after feature ships (archive or delete)
- ❌ Writing specs for trivial changes
