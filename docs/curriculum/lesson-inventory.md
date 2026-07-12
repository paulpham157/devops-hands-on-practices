# Lesson Inventory and Redesign Disposition

All current numbered lessons have a local validation script and eight exercises except lesson 00, which has six exercises. This inventory records their initial redesign role; it does not remove or rename folders.

| Lesson | Current focus | Redesign layer | Disposition |
| --- | --- | --- | --- |
| 00 | Docker fundamentals | Foundation | Retain; add troubleshooting evidence. |
| 01 | Docker Compose app | Foundation | Retain as reference-system entry point. |
| 02 | Kubernetes Nginx | Foundation | Retain; connect to operations scenarios. |
| 03 | Ansible Docker host | Delivery practitioner | Retain; add idempotency and rollback evidence. |
| 04 | Packer image | Delivery practitioner | Retain; connect to image lifecycle decisions. |
| 05 | Terraform Docker | Delivery practitioner | Retain; bridge to state and environment modules. |
| 06 | Prometheus, Grafana, Loki | Delivery practitioner | Expand into alert triage and game-day telemetry. |
| 07 | Jenkins CI | Reference specialization | Retain as CI model; compose into delivery overlay. |
| 08 | GitHub Actions and GitLab CI | Delivery practitioner | Retain as default CI evidence path. |
| 09 | K3s with k3d | Delivery practitioner | Expand into Kubernetes failure scenarios. |
| 10 | OpenTofu module | Delivery practitioner | Expand into state, drift, and module lifecycle. |
| 11 | DevSecOps container pipeline | Delivery practitioner | Retain; add policy and exception workflow. |
| 12 | Argo CD GitOps | Delivery practitioner | Expand into promotion, drift recovery, rollback. |
| 13 | Vault and secret managers | Delivery practitioner | Expand into rotation and incident response. |
| 14 | AWS identity | Delivery practitioner | Expand into federation and landing-zone design. |
| 15 | Helm, Kustomize, artifacts | Delivery practitioner | Retain; add release/migration decision evidence. |
| 16 | OpenTelemetry, Jaeger, Datadog | Delivery practitioner | Expand into production debugging scenario. |
| 17 | Runtime containerization | Foundation | Retain as application-operability prerequisite. |
| 18 | Linux and Unix | Foundation | Retain; add unseen troubleshooting assessment. |
| 19 | Redis and load balancing | Delivery practitioner | Expand into load testing and capacity analysis. |
| 20 | Microservice protocols | Foundation | Retain as distributed-system prerequisite. |
| 21 | Multi-cloud fundamentals | Foundation | Retain as architecture vocabulary. |
| 22 | Serverless platforms | Reference specialization | Retain as cloud overlay comparison. |
| 23 | IaC tool selection | Delivery practitioner | Retain; add organizational IaC governance. |
| 24 | JFrog Artifactory | Reference specialization | Retain as artifact-platform overlay. |
| 25 | Container platform selection | Delivery practitioner | Expand into platform operating model. |
| 26 | Service mesh | Reference specialization | Retain as advanced platform tradeoff. |
| 27 | Data management | Production owner | Expand into durability and restore scenarios. |
| 28 | Availability patterns | Production owner | Expand into incident mitigation game day. |
| 29 | Design patterns | Delivery practitioner | Retain as architecture tradeoff support. |
| 30 | Network patterns | Delivery practitioner | Expand into boundary and outage diagnosis. |
| 31 | Backend for Frontend | Reference specialization | Retain as application architecture overlay. |
| 32 | SLA, SLI, SLO | Production owner | Expand into error-budget and incident policy. |
| 33 | Snyk and Sonar | Delivery practitioner | Retain; add policy exceptions and evidence. |
| 34 | Data pipeline | Reference specialization | Expand into data reliability overlay. |
| 35 | Puppet | Reference specialization | Retain as configuration-management comparison. |
| 36 | Chef | Reference specialization | Retain as configuration-management comparison. |
| 37 | TeamCity | Reference specialization | Retain as enterprise CI comparison. |
| 38 | OpenStack | Reference specialization | Retain as private-cloud architecture overlay. |
| 39 | AWS Nx plugin | Reference specialization | Retain as AWS application-platform overlay. |
| 40 | Nx workspace | Delivery practitioner | Expand into developer-experience and platform metrics. |

## Inventory Rules

- Foundation lessons must have a guided local lab, safety notes, and clear prerequisites.
- Delivery-practitioner lessons must result in an independently verifiable change or design artifact.
- Production-owner lessons must include a failure, ambiguity, or competing constraint and require a written decision.
- Reference-specialization lessons must state the shared-core prerequisite and the decision boundary they clarify.
