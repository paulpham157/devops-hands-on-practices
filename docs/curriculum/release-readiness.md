# Curriculum Redesign Release Readiness

Use this checklist before a manual editorial release. A green repository validation is necessary but does not prove learner readiness by itself.

## Required Gates

- [ ] `CONTEXT.md` redesign workstreams have a current status and owner.
- [ ] `LEARNING_PATHS.md` routes use current lesson IDs and entry/exit evidence.
- [ ] All 41 lesson contracts, metadata, exercise pairs, and local validators pass.
- [ ] Reference-system core smoke, DR/restore, worker recovery, and optional observability checks pass on a supported runtime.
- [ ] At least two game days are reviewable with learner evidence and rubrics.
- [ ] Production modules cover incident, capacity/cost, recovery, migration, policy, and platform decisions.
- [ ] Capstone pilot has at least three anonymized calibration records and reviewer disagreement notes.
- [ ] Legacy-to-new resume mapping has been updated for any changed path or lesson.
- [ ] No credentials, real secrets, private learner data, or generated backup/scanner output are committed.
- [ ] Curated learner-facing release notes exist under the editorial release workflow.
- [ ] The manual workflow creates a draft release from a committed notes file; public publication remains a maintainer decision.

## Release Decision

| Decision | Evidence link | Maintainer | Date |
| --- | --- | --- | --- |
| _Pending pilot and release review_ | | | |

Do not tag or publish a redesigned learning product version while any required gate is unchecked. A release is a stable curriculum milestone, not a claim that every learner reaches seniority.
