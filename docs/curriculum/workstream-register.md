# Curriculum Redesign Workstream Register

| Workstream | Accountable owner | Depends on | Rough size | Deliverable | Acceptance check |
| --- | --- | --- | --- | --- | --- |
| Curriculum governance | Curriculum maintainers | ADR 0002 | S | Matrix, inventory, migration policy | All 41 lessons are traceably mapped. |
| Lesson contracts | Curriculum maintainers | Governance | M | Templates and structural checks | New/reworked lessons satisfy contract. |
| Learner navigation | Curriculum maintainers | Matrix and inventory | M | Level paths and resume map | A learner can choose and resume a path. |
| Reference system | Platform curriculum maintainers | ADR 0002 | L | Local order-processing system | Runs locally with documented cleanup. |
| Production ownership | SRE and platform curriculum maintainers | Reference system | L | Incident, DR, capacity, cost modules | Each module has an evidence-based scenario. |
| Assessment and capstone | Curriculum maintainers | Production ownership | L | Rubrics, game days, capstone | Independent reviewers can score evidence. |
| Migration and release | Curriculum maintainers | All prior workstreams | M | Redirects, release notes, walkthrough | Existing progress has a documented successor. |

`Curriculum maintainers` means the maintainer or maintainer team accountable for coordinating and accepting curriculum work; it does not imply that one person authored every lesson change.
