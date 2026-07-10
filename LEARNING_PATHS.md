# Goal-Oriented Learning Paths

Use these paths when the learner has a specific outcome in mind. Each path lists the core lessons first, then optional expansion lessons. Start every lesson by reading its `README.md`, run `./scripts/validate.sh` when available, complete the exercises, then review the solution notes only after trying the problem.

For AI-guided study, use this loop:

1. Ask the AI to explain the lesson goal and prerequisites in plain language.
2. Ask for a short pre-lab checklist before running commands.
3. Run the lesson validation script and paste errors back into the AI.
4. Complete each exercise from `problem/readme.md` before opening `solution/readme.md`.
5. End the lesson by asking the AI to quiz you on the concepts and ask one production-style design question.

## Path 1: New To DevOps

Goal: build a practical base without jumping too early into cloud or platform comparisons.

Best for: learners who know basic terminal usage but have not worked deeply with containers, infrastructure automation, or CI/CD.

Core sequence:

1. `18-linux-unix-fundamentals`
2. `00-docker-fundamentals`
3. `01-docker-compose-flask-redis`
4. `02-kubernetes-nginx`
5. `03-ansible-docker-host`
6. `04-packer-docker-image`
7. `05-terraform-docker-container`
8. `07-jenkins-ci-pipeline`
9. `08-github-actions-gitlab-ci`

Expand with:

- `06-observability-prometheus-grafana-loki` after the first CI/CD lessons.
- `11-devsecops-container-pipeline` after you understand image builds and CI jobs.
- `21-aws-azure-gcp-cloud-fundamentals` when you are ready for cloud vocabulary.

Completion target: you can explain how code becomes a container image, how it is run locally, how infrastructure is described, and how a CI pipeline validates changes.

## Path 2: Job-Ready Junior DevOps

Goal: cover the tools and workflows commonly expected in entry-level DevOps work.

Best for: learners preparing for interviews, internships, or a first DevOps/platform role.

Core sequence:

1. `00-docker-fundamentals`
2. `01-docker-compose-flask-redis`
3. `02-kubernetes-nginx`
4. `03-ansible-docker-host`
5. `05-terraform-docker-container`
6. `06-observability-prometheus-grafana-loki`
7. `08-github-actions-gitlab-ci`
8. `09-k3s-local-cluster`
9. `11-devsecops-container-pipeline`
10. `12-argocd-gitops`
11. `13-vaults-and-secrets-managers`
12. `15-helm-kustomize-artifact-repositories`

Expand with:

- `04-packer-docker-image` for image-building workflows.
- `10-opentofu-docker-module` for reusable IaC module structure.
- `16-opentelemetry-jaeger-datadog` for tracing and telemetry.
- `33-snyk-and-sonar` for code quality and security gates.

Completion target: you can walk through a realistic delivery flow from source code to container, CI check, Kubernetes deployment, GitOps sync, secrets handling, and monitoring.

## Path 3: Docker And Kubernetes First

Goal: focus on containers, local orchestration, manifests, packaging, and platform choices.

Best for: backend developers, students, or operators who want container fluency before broader DevOps topics.

Core sequence:

1. `00-docker-fundamentals`
2. `01-docker-compose-flask-redis`
3. `17-language-runtime-containerization`
4. `02-kubernetes-nginx`
5. `09-k3s-local-cluster`
6. `15-helm-kustomize-artifact-repositories`
7. `26-service-mesh`

Expand with:

- `11-devsecops-container-pipeline` for container scanning and SBOMs.
- `25-openshift-gke-eks-aks-ecs-fargate` for managed platform comparison.
- `24-jfrog-artifactory` for container and artifact repository workflows.

Completion target: you can build container images, reason about Dockerfiles, run multi-service apps locally, deploy to Kubernetes, render manifests with Helm/Kustomize, and compare container platforms.

## Path 4: CI/CD And Release Engineering

Goal: learn how teams validate, package, secure, and promote changes.

Best for: learners who care about pipelines, release gates, artifact flow, and developer productivity.

Core sequence:

1. `00-docker-fundamentals`
2. `04-packer-docker-image`
3. `07-jenkins-ci-pipeline`
4. `08-github-actions-gitlab-ci`
5. `11-devsecops-container-pipeline`
6. `12-argocd-gitops`
7. `15-helm-kustomize-artifact-repositories`
8. `24-jfrog-artifactory`
9. `33-snyk-and-sonar`

Expand with:

- `37-teamcity-ci-pipelines` for an additional enterprise CI model.
- `13-vaults-and-secrets-managers` for secret handling in delivery flows.
- `16-opentelemetry-jaeger-datadog` for release observability.
- `40-nx-workspace` for monorepo task orchestration, caching, affected CI, and plugin selection.
- `39-aws-nx-plugin` for generated AWS app, API, auth, and IaC workspace workflows.

Completion target: you can design a pipeline that builds, tests, scans, packages, publishes, and deploys software with clear promotion gates.

## Path 5: Infrastructure As Code And Automation

Goal: build skill in repeatable infrastructure provisioning and configuration.

Best for: learners focused on Terraform/OpenTofu, configuration management, and infrastructure automation.

Core sequence:

1. `03-ansible-docker-host`
2. `04-packer-docker-image`
3. `05-terraform-docker-container`
4. `10-opentofu-docker-module`
5. `13-vaults-and-secrets-managers`
6. `21-aws-azure-gcp-cloud-fundamentals`
7. `23-iac-cdk-cloudformation-pulumi-terraform`

Expand with:

- `35-puppet-configuration-management` for Puppet.
- `36-chef-infra-automation` for Chef.
- `38-openstack-private-cloud` for private cloud context.
- `39-aws-nx-plugin` for AWS app scaffolding that connects generated code with CDK or Terraform.

Completion target: you can explain when to use image baking, configuration management, Terraform/OpenTofu modules, cloud-native IaC tools, and secrets systems.

## Path 6: Platform Engineering And SRE

Goal: learn how to operate platforms, measure reliability, and reason about production systems.

Best for: learners targeting platform engineering, SRE, infrastructure operations, or production ownership.

Core sequence:

1. `02-kubernetes-nginx`
2. `06-observability-prometheus-grafana-loki`
3. `09-k3s-local-cluster`
4. `12-argocd-gitops`
5. `16-opentelemetry-jaeger-datadog`
6. `25-openshift-gke-eks-aks-ecs-fargate`
7. `26-service-mesh`
8. `28-availability-patterns`
9. `30-network-patterns`
10. `32-sla-sli-slo`

Expand with:

- `13-vaults-and-secrets-managers` for platform security.
- `24-jfrog-artifactory` for internal platform artifact services.
- `38-openstack-private-cloud` for private cloud operations.

Completion target: you can discuss platform tradeoffs, observability signals, deployment control, networking patterns, availability design, and SLO-based operations.

## Path 7: DevSecOps And Supply Chain Security

Goal: add security checks and governance into normal delivery workflows.

Best for: learners interested in secure CI/CD, scanning, secrets, SBOMs, quality gates, and release policy.

Core sequence:

1. `00-docker-fundamentals`
2. `04-packer-docker-image`
3. `08-github-actions-gitlab-ci`
4. `11-devsecops-container-pipeline`
5. `13-vaults-and-secrets-managers`
6. `14-aws-identity`
7. `15-helm-kustomize-artifact-repositories`
8. `24-jfrog-artifactory`
9. `33-snyk-and-sonar`

Expand with:

- `12-argocd-gitops` for deployment policy and GitOps control.
- `25-openshift-gke-eks-aks-ecs-fargate` for platform security tradeoffs.
- `26-service-mesh` for service-to-service policy and traffic control.

Completion target: you can design a security-aware delivery pipeline with secret scanning, image scanning, SBOM generation, artifact controls, identity boundaries, and quality gates.

## Path 8: Cloud And Platform Selection

Goal: understand how cloud platforms, container services, serverless, and private cloud options compare.

Best for: learners who need architectural judgment more than one specific CLI workflow.

Core sequence:

1. `21-aws-azure-gcp-cloud-fundamentals`
2. `14-aws-identity`
3. `22-serverless-functions-platforms`
4. `23-iac-cdk-cloudformation-pulumi-terraform`
5. `25-openshift-gke-eks-aks-ecs-fargate`
6. `38-openstack-private-cloud`

Expand with:

- `09-k3s-local-cluster` before managed Kubernetes comparisons if Kubernetes is new.
- `26-service-mesh` after platform selection if service-to-service operations matter.
- `28-availability-patterns` for resilient cloud architecture.
- `39-aws-nx-plugin` after `22` and `23` if you want AWS full-stack scaffolding with generated IaC.

Completion target: you can compare managed Kubernetes, managed containers, serverless functions, IaC approaches, identity models, and private cloud options.

## Path 9: Application Architecture And Distributed Systems

Goal: understand how application architecture choices affect operations.

Best for: backend developers, tech leads, and DevOps learners who need to connect app design to infrastructure behavior.

Core sequence:

1. `17-language-runtime-containerization`
2. `19-redis-caching-load-balancing`
3. `20-application-protocols-microservices`
4. `27-data-management`
5. `28-availability-patterns`
6. `29-design-and-implementation-patterns`
7. `30-network-patterns`
8. `31-backend-for-frontend`

Expand with:

- `06-observability-prometheus-grafana-loki` to observe runtime behavior.
- `16-opentelemetry-jaeger-datadog` to trace distributed systems.
- `32-sla-sli-slo` to connect architecture to reliability targets.
- `34-data-pipeline` when data movement and analytics are part of the system.
- `40-nx-workspace` when app architecture spans many packages, libraries, and generated tasks.

Completion target: you can reason about caching, load balancing, protocol choices, data ownership, availability, networking, BFF patterns, and operational tradeoffs.

## Path 10: Data And Reliability Track

Goal: connect data pipeline design with reliability and operations.

Best for: learners working near analytics platforms, batch jobs, data services, or reliability-sensitive data workflows.

Core sequence:

1. `21-aws-azure-gcp-cloud-fundamentals`
2. `27-data-management`
3. `28-availability-patterns`
4. `32-sla-sli-slo`
5. `34-data-pipeline`

Expand with:

- `06-observability-prometheus-grafana-loki` for operational dashboards and alerting.
- `16-opentelemetry-jaeger-datadog` for telemetry concepts.
- `23-iac-cdk-cloudformation-pulumi-terraform` for provisioning data platform resources.
- `30-network-patterns` for connectivity and isolation concerns.

Completion target: you can explain ingestion, ETL/ELT, orchestration, validation, lineage, failure handling, and reliability expectations for data workflows.

## Fast Tracks

Use these when time is limited.

| Goal | Lessons |
| --- | --- |
| Weekend Docker basics | `00`, `01`, `17` |
| Kubernetes crash course | `00`, `02`, `09`, `15` |
| CI/CD crash course | `00`, `08`, `11`, `12`, `15` |
| Terraform/OpenTofu crash course | `05`, `10`, `23` |
| Observability crash course | `06`, `16`, `32` |
| Security crash course | `11`, `13`, `14`, `33` |
| Cloud comparison crash course | `21`, `22`, `25`, `38` |

## Choosing The Right Path

| Learner goal | Recommended path |
| --- | --- |
| "I am new and want the least confusing order." | Path 1: New To DevOps |
| "I want to prepare for a junior DevOps role." | Path 2: Job-Ready Junior DevOps |
| "I mostly need Docker and Kubernetes." | Path 3: Docker And Kubernetes First |
| "I care about pipelines and releases." | Path 4: CI/CD And Release Engineering |
| "I want Terraform, OpenTofu, and automation." | Path 5: Infrastructure As Code And Automation |
| "I want platform/SRE skills." | Path 6: Platform Engineering And SRE |
| "I want DevSecOps and supply chain security." | Path 7: DevSecOps And Supply Chain Security |
| "I need cloud and platform selection judgment." | Path 8: Cloud And Platform Selection |
| "I am a backend developer learning ops impact." | Path 9: Application Architecture And Distributed Systems |
| "I work with data workflows." | Path 10: Data And Reliability Track |
