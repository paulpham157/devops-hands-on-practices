# Learner Progress Migration

This guide prevents the redesign from invalidating learner progress. The learner-facing [Learning Paths](../../LEARNING_PATHS.md) document is now level-based; this document records the maintainer policy behind its resume guidance.

## Mapping Principles

1. Completed validated lessons remain completed; learners do not repeat a lesson only because its label changes.
2. A new assessment can be recommended to demonstrate a higher level, but it does not erase prior work.
3. Replaced or split lessons must keep a visible note in the old README pointing to the successor material.
4. Every new path must include a “resume from existing progress” table before it becomes the default learner route.

## Published Resume Map

| Existing progress | Redesigned next step | Why |
| --- | --- | --- |
| Validated `00`–`02` | Complete Foundation gaps `18`, `17`, `20`, `21`; then Level 2. | Existing container/Kubernetes work remains evidence. |
| Validated `03`–`05` | Continue Level 2 at `06`, then complete the numbered sequence through `16`. | Existing automation work remains evidence. |
| Validated `06`–`16` | Complete missing Level 2 core, then Level 3 sequentially from `19` through `32`. | Production-owner preparation is not a certification. |
| Validated `17`–`24` | Use as Foundation or overlay evidence; complete missing Level 2 core. | These lessons do not replace shared delivery evidence. |
| Validated `25`–`40` | Select the corresponding overlay and collect Level 3 evidence. | Avoid repeating tools without an evidence gap. |

## Required Migration Record for Any Changed Lesson

Add a row to this table before merging a lesson restructure:

| Old lesson/path | New destination | Learner action | Compatibility note | Decision/ADR |
| --- | --- | --- | --- | --- |
| _Example: 10 OpenTofu module_ | _IaC lifecycle module + game day_ | _Keep validated work; complete drift exercise_ | _No prerequisite change_ | _ADR link_ |
