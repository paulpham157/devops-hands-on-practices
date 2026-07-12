# DevOps Competency Matrix

This matrix defines what the curriculum can demonstrate. It does not claim that completing lessons grants a job title; seniority also requires sustained workplace ownership.

## Proficiency Levels

| Level | Learner can do | Evidence |
| --- | --- | --- |
| Foundation | Explain a model and complete a guided local lab safely. | Commands, short answers, validated lab. |
| Delivery practitioner | Assemble repeatable delivery and infrastructure workflows from known parts. | Independent implementation, manifests, pipeline or IaC plan. |
| Production owner | Diagnose, mitigate, recover, and explain tradeoffs under realistic constraints. | Timeline, runbook use, dashboards, recovery evidence, ADR. |
| Senior capstone | Make and defend coherent cross-domain decisions while improving the system and its operating model. | Reviewed portfolio, game-day outcome, postmortem, design defense. |

## Shared Production-Ownership Core

| Competency | Current lesson coverage | Current level | Gap to close | Target evidence |
| --- | --- | --- | --- | --- |
| Linux and systems troubleshooting | 00, 03, 09, 18 | Foundation / practitioner | Unseen host and container failure diagnosis | Troubleshooting log and recovery runbook |
| Networking and application protocols | 02, 19, 20, 30 | Foundation / practitioner | DNS, TLS, routing, and failure isolation under pressure | Packet or request trace and mitigation decision |
| Containers and Kubernetes operations | 00, 01, 02, 09, 15, 17, 25 | Foundation / practitioner | Upgrades, control-plane failure, tenancy, quotas, recovery | Upgrade plan and failure drill |
| IaC and configuration management | 03, 04, 05, 10, 23, 35, 36 | Foundation / practitioner | Remote state, import, drift, state recovery, environments | Reviewed module lifecycle and drift recovery |
| Delivery, GitOps, and artifacts | 07, 08, 11, 12, 15, 24, 33, 37, 40 | Foundation / practitioner | Promotion policy, safe rollback, migration compatibility | Release plan with rollback and evidence |
| Cloud architecture and identity | 13, 14, 21, 22, 23, 25, 38, 39 | Foundation / practitioner | Landing zones, federation, account topology, boundaries | Architecture ADR and identity model |
| Security and supply chain | 11, 13, 14, 15, 24, 26, 33 | Foundation / practitioner | Policy-as-code enforcement, audit evidence, exceptions | Threat model, policy decision, audit trail |
| Observability and production debugging | 06, 16, 18, 19, 32 | Foundation / practitioner | Alert quality, triage, correlation, diagnosis under ambiguity | Dashboard, alert rationale, incident timeline |
| Reliability and incident management | 28, 32 with supporting 06, 16 | Conceptual / practitioner | On-call, incident command, communications, postmortem ownership | Game day, incident record, postmortem |
| Data durability and disaster recovery | 27, 28, 34 | Conceptual | Verified backup/restore, RPO/RTO, regional failure | Restore drill and DR decision record |
| Performance and capacity | 19, 28, 32 | Conceptual | Load test, bottleneck analysis, autoscaling, capacity model | Load-test report and capacity plan |
| FinOps and cost-aware design | Indirect cloud comparisons plus `reference-system/capacity` | Foundation | Allocation, budget, unit cost, guardrails in a production scenario | Cost model and guardrail policy |
| Platform engineering and developer experience | 12, 15, 24, 25, 39, 40 | Conceptual | Golden paths, self-service, platform metrics | Platform API/design and adoption measure |
| Architecture communication and tradeoffs | 19–32, 38 | Conceptual | Explicit ADRs, alternatives, constraints, decision review | ADR set and design defense |
| Technical leadership and toil reduction | Indirectly in 32, 37, 40 | Missing | Mentoring, stakeholder communication, prioritization, toil economics | Improvement roadmap and incident communication |

## Specialization Overlays

| Overlay | Shared-core emphasis | Existing starting lessons | New evidence needed |
| --- | --- | --- | --- |
| DevOps delivery | IaC, CI/CD, GitOps, security | 05, 08, 11, 12, 15 | Promotion and migration plan |
| Platform engineering | Kubernetes, artifacts, developer experience | 09, 12, 15, 24, 25, 40 | Golden path and service-level platform metric |
| SRE | Observability, reliability, capacity | 06, 16, 28, 32 | Game day, capacity and error-budget decision |
| DevSecOps | Identity, supply chain, policy | 11, 13, 14, 24, 33 | Threat model, policy exception, audit evidence |
| Cloud architecture | Identity, IaC, resilience, cost | 14, 21, 22, 23, 25, 38 | Landing-zone ADR and cost model |

## Required Behavior and Dependencies by Competency

| Competency | Prerequisites / dependencies | Foundation | Delivery practitioner | Production owner | Senior capstone |
| --- | --- | --- | --- | --- | --- |
| Systems | None | Inspect processes and files safely. | Automate a repeatable host change. | Diagnose an unseen host/container fault. | Set a maintainable troubleshooting standard. |
| Networking | Systems | Explain request flow and boundaries. | Configure known service exposure. | Isolate a DNS, TLS, or routing failure. | Defend a network boundary tradeoff. |
| Kubernetes | Containers, networking | Apply and inspect a workload. | Package and deploy a service. | Recover from upgrade, node, or policy failure. | Define safe platform operating boundaries. |
| IaC | Systems, containers | Run plan/apply/destroy locally. | Compose reusable automation. | Recover state or drift across environments. | Govern module and environment lifecycle. |
| Delivery | Containers, IaC | Explain build and test stages. | Build, scan, publish, deploy. | Mitigate a bad release safely. | Define promotion and migration policy. |
| Cloud and identity | IaC, networking | Compare provider primitives. | Model a workload identity. | Diagnose a boundary or federation failure. | Defend landing-zone architecture. |
| Security | Delivery, identity | Identify secret and supply-chain risks. | Apply scans and controls. | Handle an exception or credential incident. | Balance risk, evidence, and delivery speed. |
| Observability | Systems, delivery | Read metrics, logs, traces. | Instrument and alert a known service. | Correlate ambiguous symptoms to cause. | Define signal and alerting strategy. |
| Reliability | Observability, delivery | Explain availability concepts. | Define SLI/SLO and basic recovery. | Command mitigation and write postmortem. | Prioritize reliability investment by error budget. |
| Data recovery | Reliability, data | Explain backup/RPO/RTO terms. | Configure a documented backup path. | Execute and verify a restore drill. | Defend DR investment and recovery scope. |
| Performance | Observability, reliability | Explain latency and saturation. | Run and interpret a simple load test. | Produce a capacity and autoscaling decision. | Balance cost, performance, and resilience. |
| FinOps | Cloud and architecture | Identify major cost drivers. | Apply allocation and budget metadata. | Investigate a cost regression. | Set cost guardrails and unit-cost targets. |
| Platform experience | Kubernetes, delivery | Explain a golden path. | Offer a reusable paved workflow. | Measure and improve adoption friction. | Define platform product strategy. |
| Architecture decisions | All relevant technical competencies | Name constraints and alternatives. | Write a scoped ADR. | Revise a decision from incident evidence. | Defend coherent cross-system choices. |
| Leadership | Reliability, architecture decisions | Communicate a technical finding. | Coordinate a bounded delivery change. | Communicate incident impact and follow-up. | Mentor, prioritize toil, and align stakeholders. |

## Rules for Updating This Matrix

- A lesson may be listed as coverage only when its README, exercise, and validator support the claimed outcome.
- “Conceptual” coverage is not sufficient for a production-owner or capstone exit criterion.
- Every new production module must name the competency, required prior level, scenario, and reviewable evidence it adds.
- Update both this matrix and `lesson-inventory.md` in the same change when lesson purpose changes.
