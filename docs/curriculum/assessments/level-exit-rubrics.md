# Diagnostic and Level Exit Rubrics

## Scoring

Score each criterion `0` (not demonstrated), `1` (guided/partial), or `2` (independent and explained). Link evidence. A level exit requires at least 2 on every required criterion and the stated total; a reviewer may recommend more practice even when the numeric threshold is met.

## Level 1: Foundations

Entry diagnostic: shell navigation, safe file editing, basic HTTP request, and explanation of image/container/service/volume concepts.

| Criterion | Evidence | Required score |
| --- | --- | ---: |
| Linux/system inspection | command output or troubleshooting note | 2 |
| Container build/run/cleanup | validated `00`/`01` lab | 2 |
| Kubernetes/request-flow mental model | `02` or equivalent explanation | 2 |
| Runtime/protocol/cloud vocabulary | evidence from `17`, `20`, or `21` | 2 |

Exit threshold: 8/8, with no unsafe cleanup or secret handling.

## Level 2: Delivery Practitioner

Entry diagnostic: explain plan/apply, CI stages, image/artifact flow, secret boundary, Kubernetes desired state, and one observable signal.

| Criterion | Evidence | Required score |
| --- | --- | ---: |
| Repeatable IaC change | plan/module output from `03`–`05`/`10` | 2 |
| CI/security delivery path | pipeline and security evidence from `08`/`11` | 2 |
| Deployment/GitOps change | rendered/apply/drift evidence from `09`/`12`/`15` | 2 |
| Secret and telemetry handling | evidence from `13`/`06`/`16` | 2 |
| Integrated reference-system project | check output, artifact, observation, cleanup | 2 |

Exit threshold: 10/10. A green tool command without retained evidence is not enough.

## Level 3: Production-Owner Preparation

Entry diagnostic: state a user journey, SLO, dependency boundary, failure mode, recovery decision, and tradeoff.

| Criterion | Evidence | Required score |
| --- | --- | ---: |
| Failure investigation | Game Day 01 or equivalent incident record | 2 |
| Queue/recovery reasoning | Game Day 02, DR, or migration evidence | 2 |
| Capacity/cost decision | capacity and cost exercise | 2 |
| Reliability and SLO reasoning | `28`/`32` scenario and SLO interpretation | 2 |
| Architecture/network/data tradeoff | evidence from `27`–`31` | 2 |

Exit threshold: 10/10 and reviewer confirms the learner separates evidence, assumptions, and uncertainty.

## Level 4: Senior-Capstone Preparation

Entry diagnostic: a reviewer checks the Level 3 portfolio for cross-domain evidence and identifies the largest gap.

| Criterion | Evidence | Required score |
| --- | --- | ---: |
| Complete capstone artifact set | capstone required-artifacts checklist | 2 |
| Design defense | two-reviewer scores and questions | 2 |
| Game-day/postmortem ownership | incident evidence and follow-up roadmap | 2 |
| Leadership/tradeoff communication | executive summary, ADRs, prioritization | 2 |

Exit threshold: 8/8, two independent reviewers, and a calibration record update. This is a curriculum milestone, not a workplace seniority claim.
