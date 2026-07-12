# Learning Paths

This repository is being redesigned around capabilities and evidence, not a checklist of tools. Choose a level first, then add a specialization overlay that matches your goal. Every numbered lesson remains valid while the redesign is in progress.

Start every lesson by reading its `README.md`. Run the lesson's `./scripts/validate.sh` when the README asks for it, complete the exercises before opening solutions, retain the required evidence, and run cleanup for temporary resources.

## Choose Your Starting Point

| If you can already… | Start at | First lessons |
| --- | --- | --- |
| Use a terminal but are new to delivery and operations | Foundations | `18`, `00`, `01` |
| Build and run a containerized app and want repeatable delivery | Delivery practitioner | `03`, `05`, `08` |
| Can show the Level 2 evidence below and need production decision practice | Production-owner preparation | `19`, `20`, `21`, `22` |
| Have real production ownership and want a structured portfolio | Senior-capstone preparation | Shared core plus a specialization overlay; capstone is being built |

If you are unsure, begin with the Foundations entry check below. Do not skip a prerequisite because a tool name is familiar; skip it only when you can demonstrate the stated outcome.

## Evidence Rules

Each level asks for different evidence:

| Level | What completion means now |
| --- | --- |
| Foundations | You can safely complete guided local labs and explain the mental model. |
| Delivery practitioner | You can independently assemble and validate a delivery workflow using existing lessons. |
| Production-owner preparation | You can reason about failures, signals, recovery, and tradeoffs using existing scenario exercises. Dedicated game days are planned, not yet a completion claim. |
| Senior-capstone preparation | You can collect the prerequisites for a future reviewed capstone. The capstone does not yet exist in this repository. |

Finishing lessons does not by itself make someone a Senior DevOps engineer. Seniority also requires repeated production ownership, communication, and judgment in real team environments.

## Path Dependencies and Crossovers

| From | Required evidence before moving on | Leads to | Crossover choice |
| --- | --- | --- | --- |
| Level 1 | Foundation evidence and safe local workflow | Level 2 | None: every learner enters the shared core. |
| Level 2 | IaC, CI, deployment, secrets, telemetry, and cleanup evidence | Level 3 | Choose an overlay after identifying the Level 3 evidence it needs. |
| Level 3 | Scenario, SLO, recovery, network, and architecture evidence | Level 4 preparation | Add an overlay to deepen the same operational evidence. |
| Level 4 preparation | Cross-domain portfolio and reviewer feedback | Future capstone | Wait for published capstone and game-day artifacts. |

The `Previous lesson` and `Next lesson` links inside legacy lesson READMEs preserve the original numbered browsing order. The level paths above are the redesign's prerequisite routes; they explicitly name their entry checks and shared-core crossover points.

## Level 1: Foundations

Goal: understand the system layers that delivery and operations depend on.

Entry check: you can navigate files, edit text, and run a command in a shell. If not, start directly with `18-linux-unix-fundamentals`.

Core sequence:

1. `18-linux-unix-fundamentals`
2. `00-docker-fundamentals`
3. `01-docker-compose-flask-redis`
4. `17-language-runtime-containerization`
5. `02-kubernetes-nginx`
6. `20-application-protocols-microservices`
7. `21-aws-azure-gcp-cloud-fundamentals`

Foundation evidence:

- a validated Linux and container lab;
- one running multi-service Compose application;
- one inspected Kubernetes workload;
- a concise explanation of request flow, runtime tradeoffs, and cloud primitives.

Next step: Level 2. Add a specialization overlay only after completing the Level 2 shared core.

## Level 2: Delivery Practitioner Shared Core

Goal: build a repeatable path from application source to a monitored deployment.

Prerequisite: the Level 1 outcomes, or equivalent evidence from your own work.

Core sequence:

1. `03-ansible-docker-host`
2. `04-packer-docker-image`
3. `05-terraform-docker-container`
4. `06-observability-prometheus-grafana-loki`
5. `07-jenkins-ci-pipeline`
6. `08-github-actions-gitlab-ci`
7. `09-k3s-local-cluster`
8. `10-opentofu-docker-module`
9. `11-devsecops-container-pipeline`
10. `12-argocd-gitops`
11. `13-vaults-and-secrets-managers`
12. `14-aws-identity`
13. `15-helm-kustomize-artifact-repositories`
14. `16-opentelemetry-jaeger-datadog`

Practitioner evidence:

- an IaC plan and reusable module change;
- a CI workflow that builds, tests, and applies security checks;
- a GitOps-rendered Kubernetes deployment with secrets handled safely;
- a dashboard or trace that explains an application request;
- a cleanup record for the temporary resources you created.

Next step: choose an overlay and complete the production-owner preparation core.

## Level 3: Production-Owner Preparation

Goal: connect delivery work to availability, data, network, security, scale, and business constraints.

Entry check: show the five Level 2 evidence items above, or share equivalent work for review. Tool familiarity alone is not equivalent evidence.

Core sequence available today:

1. `19-redis-caching-load-balancing`
2. `20-application-protocols-microservices`
3. `21-aws-azure-gcp-cloud-fundamentals`
4. `22-serverless-functions-platforms`
5. `23-iac-cdk-cloudformation-pulumi-terraform`
6. `24-jfrog-artifactory`
7. `25-openshift-gke-eks-aks-ecs-fargate`
8. `26-service-mesh`
9. `27-data-management`
10. `28-availability-patterns`
11. `29-design-and-implementation-patterns`
12. `30-network-patterns`
13. `31-backend-for-frontend`
14. `32-sla-sli-slo`

Add `33-snyk-and-sonar` for delivery policy and quality gates, and `34-data-pipeline` for data reliability.

Current evidence: scenario answers, SLO/error-budget decisions, network and availability tradeoff notes, and a recovery plan. The incident game days, load/capacity, FinOps, restore drills, and migration modules described in [CONTEXT.md](CONTEXT.md#curriculum-redesign-plan) are planned work; do not present this level as a completed production-owner certification yet.

## Level 4: Senior-Capstone Preparation

Goal: prepare the cross-domain evidence needed for the future capstone.

Entry check: retain the Level 3 scenario evidence, including an SLO decision, recovery rationale, and one architecture tradeoff. Ask a reviewer to identify the largest evidence gap before treating this as capstone preparation.

Build on Level 3 by retaining:

- a small set of architecture decisions and rejected alternatives;
- an SLO and alert rationale for a critical user journey;
- a delivery, rollback, and recovery plan;
- a threat model and identity boundary description;
- a capacity and cost hypothesis;
- an incident timeline or tabletop exercise record.

The capstone, formal rubric, and design-defense workflow are not available yet. Follow [the curriculum redesign plan](CONTEXT.md#curriculum-redesign-plan) for their scope; do not claim capstone completion until those artifacts are published.

## Specialization Overlays

Overlays add depth after the Level 2 shared core. They do not replace it.

| Goal | Entry level | Required shared core | Overlay lessons | Evidence to collect |
| --- | --- | --- | --- | --- |
| CI/CD and release engineering | Level 2 | Level 3 delivery/reliability decisions | `04`, `07`, `24`, `33`, `37`, `40` | Promotion gates, artifact flow, rollback rationale. |
| Infrastructure as code and automation | Level 2 | Level 3 architecture/recovery decisions | `04`, `10`, `14`, `23`, `35`, `36`, `38` | Module boundaries, identity model, environment decision. |
| Platform engineering | Level 2 | Level 3 service/reliability decisions | `25`, `26`, `24`, `40` | Platform tradeoff and developer workflow design. |
| SRE and reliability | Level 2 | All Level 3 lessons | `06`, `16`, `19`, `28`, `30`, `32` | Signal choice, SLO policy, mitigation and recovery rationale. |
| DevSecOps | Level 2 | Level 3 identity and delivery decisions | `11`, `13`, `14`, `24`, `33` | Threat/risk assessment, exception and evidence workflow. |
| Cloud architecture | Level 2 | Level 3 cloud and architecture decisions | `14`, `21`, `22`, `23`, `25`, `38` | Provider selection and boundary ADR. |
| Distributed application architecture | Level 2 | Level 3 data/network/reliability decisions | `19`, `20`, `27`, `29`, `30`, `31` | Data, protocol, and availability tradeoff notes. |
| Data reliability | Level 2 | Level 3 data/reliability decisions | `27`, `28`, `32`, `34` | Data failure handling, quality, and recovery decision. |

## Goal-Oriented Routes

Use these intent routes alongside the level progression. Each route tells you where to enter the canonical model; it does not bypass prerequisites.

| Learner goal | Enter through | Then add |
| --- | --- | --- |
| New to DevOps | Level 1 | Level 2 shared core. |
| Job-ready junior DevOps | Level 1 or validated equivalent | Level 2 shared core, then one overlay. |
| Docker and Kubernetes first | Level 1: `00`, `01`, `17`, `02` | Level 2 before advanced Kubernetes. |
| CI/CD and release engineering | Level 1 or validated equivalent | CI/CD overlay after Level 2. |
| IaC and automation | Level 1 or validated equivalent | IaC overlay after Level 2. |
| Platform engineering and SRE | Level 1 or validated equivalent | Platform or SRE overlay after Level 2 and Level 3. |
| DevSecOps | Level 1 or validated equivalent | DevSecOps overlay after Level 2. |
| Cloud and platform selection | Level 1 cloud vocabulary | Cloud architecture overlay after Level 2. |
| Application architecture | Level 1 runtime/protocol work | Distributed architecture overlay after Level 2. |
| Data and reliability | Level 1 or validated equivalent | Data reliability overlay after Level 2 and Level 3. |

## Resume From Existing Progress

Validated work remains valid. Use this map rather than restarting:

| You have completed | Resume at |
| --- | --- |
| `00`–`02` | Finish Foundation gaps: `18`, `17`, `20`, `21`; then Level 2. |
| `03`–`05` | Continue Level 2 at `06`, then continue sequentially through `16`. |
| `06`–`16` | Finish any missing Level 2 core, then start Level 3 sequentially at `19` through `32`. |
| `17`–`24` | Treat these as Foundation or overlay evidence; complete the missing Level 2 shared core. |
| `25`–`40` | Use the relevant overlay, then collect Level 3 evidence rather than taking more isolated tools by default. |

## Short Routes

Use these only when you need a focused introduction, not as proof of a level.

| Goal | Lessons |
| --- | --- |
| Docker basics | `18`, `00`, `01` |
| Kubernetes basics | `00`, `02`, `09`, `15` |
| CI/CD basics | `00`, `08`, `11`, `12`, `15` |
| IaC basics | `05`, `10`, `23` |
| Observability basics | `06`, `16`, `32` |
| Security basics | `11`, `13`, `14`, `33` |
| Cloud comparison | `21`, `22`, `25`, `38` |

## Learn With AI

Use `dohp-how-to-learn` to choose a starting level, explain prerequisites, guide an attempted exercise, and quiz you from real evidence. Use `dohp-review-my-practice` only after you have a real attempt, command output, configuration, or written decision to review.
