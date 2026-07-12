# Curriculum Architecture

This directory is the source of truth for the curriculum redesign described in [CONTEXT.md](../../CONTEXT.md#curriculum-redesign-plan). It is written for maintainers; learners begin with the root [README.md](../../README.md) and [LEARNING_PATHS.md](../../LEARNING_PATHS.md).

## Contents

- [Competency matrix](competency-matrix.md): skills, proficiency levels, evidence, current coverage, and gaps.
- [Lesson inventory](lesson-inventory.md): current lesson disposition and redesign destination.
- [Legacy migration](legacy-migration.md): how existing learner progress maps to the redesigned paths.
- [Workstream register](workstream-register.md): ownership, dependencies, delivery checks, and rough sizing.
- [Senior production capstone](capstone/README.md): public brief, artifact contract, rubric, and defense protocol for pilot use.
- [Lesson contract template](templates/lesson-contract.md): required shape for new or substantially rewritten lessons.

## Redesign Boundaries

The existing numbered lesson directories (`00` through `40`) remain stable during the initial redesign. A numbered lesson can be revised, composed into a path, or marked as reference material, but it must not silently disappear or be renumbered. Any merge, split, or deprecation requires an ADR under `docs/adr/` and an update to `legacy-migration.md`.

The first version establishes a shared production-ownership core. DevOps, platform engineering, and SRE differ through specialization overlays after that core; they are not three unrelated curricula.

## Maintainer Workflow

1. Update the lesson inventory and competency matrix before changing a lesson's level or role in a path.
2. Use the lesson contract for a new lesson or a rewrite that changes learner outcomes.
3. Update legacy migration whenever learner navigation or completion meaning changes.
4. Run `./scripts/validate-curriculum.sh` and the relevant lesson validator before committing.
