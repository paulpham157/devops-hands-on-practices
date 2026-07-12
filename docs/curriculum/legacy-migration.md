# Learner Progress Migration

This guide prevents the redesign from invalidating learner progress. Until redesigned paths are published, continue using the existing numbered lesson order and goal-oriented paths.

## Mapping Principles

1. Completed validated lessons remain completed; learners do not repeat a lesson only because its label changes.
2. A new assessment can be recommended to demonstrate a higher level, but it does not erase prior work.
3. Replaced or split lessons must keep a visible note in the old README pointing to the successor material.
4. Every new path must include a “resume from existing progress” table before it becomes the default learner route.

## Initial Resume Map

| Existing progress | Redesigned next step | Why |
| --- | --- | --- |
| Lessons 00–02 | Delivery practitioner core: 03, 05, 08, 09 | Learner has container and Kubernetes baseline. |
| Lessons 03–05 | Delivery practitioner core: 08, 10, 12, 15 | Adds repeatable automation and delivery control. |
| Lessons 06–16 | Production-owner core: 27, 28, 32, then game day | Existing delivery, security, and telemetry work is ready for operational judgment. |
| Lessons 17–24 | Choose overlay after shared delivery core | These lessons add runtime, architecture, cloud, and artifact context. |
| Lessons 25–40 | Production-owner assessment and relevant overlay | Advanced topics need cross-system evidence rather than more isolated tool labs. |

## Required Migration Record for Any Changed Lesson

Add a row to this table before merging a lesson restructure:

| Old lesson/path | New destination | Learner action | Compatibility note | Decision/ADR |
| --- | --- | --- | --- | --- |
| _Example: 10 OpenTofu module_ | _IaC lifecycle module + game day_ | _Keep validated work; complete drift exercise_ | _No prerequisite change_ | _ADR link_ |
