# Hands-on Practice Track

This track continues after the basic Dockerfile examples in the repository. Each lesson is self-contained and focuses on one practical DevOps workflow.

## Learning Path

1. `01-docker-compose-flask-redis`
   - Run a two-service app with Docker Compose.
   - Learn service DNS, bind mounts, health checks, and logs.

2. `02-kubernetes-nginx`
   - Deploy a web container to a local Kubernetes cluster.
   - Learn Namespace, Deployment, Service, ServiceAccount, resource limits, probes, and NetworkPolicy.

3. `03-ansible-docker-host`
   - Configure the Vagrant Ubuntu VM as a Docker host with Ansible.
   - Learn inventory, idempotent package installation, service management, and verification tasks.

4. `04-packer-docker-image`
   - Build an immutable image with Packer's Docker builder.
   - Learn image baking, shell provisioning, and image tagging.

5. `05-terraform-docker-container`
   - Use Terraform to manage a local Docker container.
   - Learn providers, variables, resources, outputs, plan/apply/destroy, and state.

6. `06-observability-prometheus-grafana-loki`
   - Run a local observability stack with Prometheus, Grafana, Loki, and Grafana Alloy.
   - Learn metrics scraping, log shipping, data sources, dashboards, and basic SLO-style alerts.
   - Includes structured exercises under `exercises/`.

7. `07-jenkins-ci-pipeline`
   - Run Jenkins locally with a Docker sidecar.
   - Learn Pipeline as Code, CI stages, Docker-based tests, image build, smoke tests, and artifacts.
   - Includes structured exercises under `exercises/`.

8. `08-github-actions-gitlab-ci`
   - Build CI pipelines for GitHub Actions and GitLab CI.
   - Learn workflow YAML, pipeline stages, jobs, artifacts, cache, secrets, Docker image builds, and registry publishing patterns.
   - Includes structured exercises under `exercises/`.

9. `09-k3s-local-cluster`
   - Run a lightweight K3s cluster locally with k3d.
   - Learn K3s packaged components, Traefik Ingress, ServiceLB, local-path storage, NetworkPolicy, scaling, and rollouts.
   - Includes structured exercises under `exercises/`.

10. `10-opentofu-docker-module`
    - Use OpenTofu to manage a local Docker container through a reusable module.
    - Learn providers, variables, outputs, modules, state, plan/apply/destroy, native tests, and Terraform-to-OpenTofu migration thinking.
    - Includes structured exercises under `exercises/`.

11. `11-devsecops-container-pipeline`
    - Build a local DevSecOps workflow around a Dockerized Python app.
    - Learn Dockerfile linting, secret scanning, dependency and image scanning, SBOM generation, policy gates, and CI translation.
    - Includes structured exercises under `exercises/`.

12. `12-argocd-gitops`
    - Run a local Argo CD GitOps workflow on a k3d-backed K3s cluster.
    - Learn GitOps reconciliation, Kustomize app layout, Argo CD Applications, automated sync, prune, self-heal, drift repair, and production sync policy tradeoffs.
    - Includes structured exercises under `exercises/`.

13. `13-vaults-and-secrets-managers`
    - Compare Vault, cloud secrets managers, Kubernetes Secrets, External Secrets, encrypted GitOps secrets, and CI/CD secret stores.
    - Learn secret lifecycle, Vault KV, file-based container secret injection, plaintext Git avoidance, Kubernetes secret patterns, and store-selection tradeoffs.
    - Includes structured exercises under `exercises/`.

14. `14-aws-identity`
    - Compare AWS identity types and access-control layers without needing an AWS account.
    - Learn IAM users, groups, roles, policies, trust policies, IAM Identity Center, STS, service principals, OIDC federation, SCPs, and Cognito.
    - Includes structured exercises under `exercises/`.

15. `15-helm-kustomize-artifact-repositories`
    - Package and customize Kubernetes workloads with Helm and Kustomize.
    - Learn chart rendering, chart packaging, Kustomize overlays, Helm vs Kustomize tradeoffs, and artifact repository patterns for Nexus and Artifactory.
    - Includes structured exercises under `exercises/`.

16. `16-opentelemetry-jaeger-datadog`
    - Run a local distributed tracing workflow with OpenTelemetry Collector and Jaeger.
    - Learn traces, spans, attributes, events, OTLP, collector pipelines, Jaeger trace debugging, and Datadog exporter patterns.
    - Includes structured exercises under `exercises/`.

17. `17-language-runtime-containerization`
    - Compare containerized services written in Python Flask, Java Spring Boot, Ruby Sinatra, Go, and Rust.
    - Learn runtime models, Dockerfile patterns, dependency caching, multi-stage builds, runtime image size, health checks, and language-selection tradeoffs.
    - Includes structured exercises under `exercises/`.

18. `18-linux-unix-fundamentals`
    - Practice Linux and Unix fundamentals in Ubuntu and Alpine lab containers.
    - Learn Linux vs Unix vs POSIX, filesystem navigation, users, permissions, processes, signals, shell pipelines, scripts, networking checks, and container-style troubleshooting.
    - Includes structured exercises under `exercises/`.

19. `19-redis-caching-load-balancing`
    - Run a read-heavy distributed-system demo with Redis cache-aside and NGINX load balancing.
    - Learn TTL, cache hit/miss, invalidation, hot keys, cache stampede, Redis eviction, NGINX upstream strategies, load testing, and failure modes.
    - Includes structured exercises under `exercises/`.

20. `20-application-protocols-microservices`
    - Compare application and microservice communication styles with REST, gRPC, GraphQL, WebSocket, Server-Sent Events, and message-driven APIs.
    - Learn contracts with OpenAPI, Protobuf, GraphQL schema, AsyncAPI, protocol selection, versioning, security, retries, and observability.
    - Includes structured exercises under `exercises/`.

21. `21-aws-azure-gcp-cloud-fundamentals`
    - Compare AWS, Azure, and Google Cloud Platform fundamentals without needing cloud credentials.
    - Learn provider hierarchy, regions/zones, service mapping, IAM models, secure networking, managed service selection, CLI orientation, tagging, cost, reliability, and migration tradeoffs.
    - Includes structured exercises under `exercises/`.

22. `22-serverless-functions-platforms`
    - Compare serverless function platforms from the diagram: AWS Lambda, Cloudflare Workers, Azure Functions, Vercel, Netlify, and GCP Functions / Cloud Run functions.
    - Learn invocation models, handler shapes, triggers, edge vs regional functions, cold starts, cost, limits, security, observability, and deployment tradeoffs.
    - Includes structured exercises under `exercises/`.

23. `23-iac-cdk-cloudformation-pulumi-terraform`
    - Compare AWS CDK, CloudFormation, Pulumi, and Terraform extension patterns.
    - Learn declarative templates, code-based IaC, synthesis, state, drift, plans/previews, modules, providers, CDKTF context, and production IaC review workflows.
    - Includes structured exercises under `exercises/`.

24. `24-jfrog-artifactory`
    - Learn JFrog Artifactory as a universal artifact repository manager for CI/CD and platform engineering.
    - Learn local, remote, virtual, and federated repositories, package format mapping, dependency caching, build info, artifact promotion, access control, retention, and Xray-style security gates.
    - Includes structured exercises under `exercises/`.

25. `25-openshift-gke-eks-aks-ecs-fargate`
    - Compare OpenShift, GKE, EKS, AKS, ECS, and Fargate as container platform choices.
    - Learn managed Kubernetes versus managed container services, OpenShift platform features, workload models, identity, networking, security, and production platform selection tradeoffs.
    - Includes structured exercises under `exercises/`.

26. `26-service-mesh`
    - Learn service mesh fundamentals with Istio, Linkerd, and Consul.
    - Learn data plane and control plane roles, traffic management, retries, timeouts, mTLS, service authorization, observability, and production adoption tradeoffs.
    - Includes structured exercises under `exercises/`.

27. `27-data-management`
    - Learn data management patterns for distributed cloud systems.
    - Learn consistency tradeoffs, database-per-service, API composition, partitioning, CQRS, event sourcing, saga compensation, synchronization, and idempotency.
    - Includes structured exercises under `exercises/`.

28. `28-availability-patterns`
    - Learn availability patterns for distributed systems under failure and overload.
    - Learn health endpoint monitoring, queue-based load leveling, throttling, backpressure, graceful degradation, and operational runbooks for availability.
    - Includes structured exercises under `exercises/`.

29. `29-design-and-implementation-patterns`
    - Learn design and implementation patterns for maintainability, flexibility, and scalable change.
    - Learn Strangler Fig, Sidecar, Anti-Corruption Layer, domain boundary protection, runtime helper ownership, and migration tradeoffs.
    - Includes structured exercises under `exercises/`.

30. `30-network-patterns`
    - Learn cloud application network patterns for traffic flow, security boundaries, and edge responsibilities.
    - Learn Ambassador, Gateway Routing, Gateway Aggregation, Gateway Offloading, Gatekeeper, Valet Key, and Static Content Hosting.
    - Includes structured exercises under `exercises/`.

31. `31-backend-for-frontend`
    - Learn Backend for Frontend as a client-specific backend pattern.
    - Learn BFF versus API gateway, web versus mobile response shaping, aggregation, auth adaptation, error normalization, caching, and ownership boundaries.
    - Includes structured exercises under `exercises/`.

32. `32-sla-sli-slo`
    - Learn SLI, SLO, and SLA as practical service reliability tools.
    - Learn user-journey indicators, objective setting, error budgets, burn rates, internal versus external commitments, and service-level review workflows.
    - Includes structured exercises under `exercises/`.

33. `33-snyk-and-sonar`
    - Learn Snyk and Sonar as complementary security and code-quality tools.
    - Learn dependency, container, code, and IaC scanning with Snyk; static analysis, quality gates, coverage, and clean new code practices with Sonar.
    - Includes structured exercises under `exercises/`.

34. `34-data-pipeline`
    - Learn modern data pipeline design for ingestion, transformation, validation, and publish workflows.
    - Learn ETL vs ELT, batch vs streaming, orchestration, landing zones, quality checks, idempotent reruns, lineage, and pipeline recovery tradeoffs.
    - Includes structured exercises under `exercises/`.

## Suggested Prerequisites

- Docker Desktop or Docker Engine
- Docker Compose plugin
- Optional for lesson 2: `kubectl` and either Docker Desktop Kubernetes, kind, or minikube
- Optional for lesson 3: Vagrant VM from `lab-setup`
- Optional for lesson 4: Packer
- Optional for lesson 5: Terraform or OpenTofu
- Optional for lesson 6: enough Docker memory for five small containers
- Optional for lesson 7: enough Docker memory for Jenkins plus Docker-in-Docker
- Optional for lesson 8: a GitHub repository, a GitLab repository, and access to CI runners for hosted pipeline practice
- Optional for lesson 9: `kubectl`, `k3d`, and enough Docker memory for a small K3s cluster
- Optional for lesson 10: OpenTofu
- Optional for lesson 11: enough Docker memory to run security scanner containers
- Optional for lesson 12: `kubectl`, `k3d`, a Git remote for the course repo, and enough Docker memory for Argo CD
- Optional for lesson 13: enough Docker memory to run Vault and the demo app
- Optional for lesson 14: no AWS account required; AWS CLI is optional for follow-up practice
- Optional for lesson 15: Helm 3, `kubectl`, and optional Nexus or Artifactory access for real publish practice
- Optional for lesson 16: enough Docker memory to run the app, OpenTelemetry Collector, and Jaeger; Datadog account and API key only for optional export practice
- Optional for lesson 17: enough Docker memory and network access to build language runtime images
- Optional for lesson 18: Docker access for Ubuntu and Alpine lab containers
- Optional for lesson 19: enough Docker memory to run Redis, NGINX, and three small app replicas
- Optional for lesson 20: enough Docker memory to run the REST and gRPC demo services
- Optional for lesson 21: no cloud account required; AWS CLI, Azure CLI, and Google Cloud CLI are optional for follow-up read-only practice
- Optional for lesson 22: no cloud account required; provider CLIs are optional for real deployment follow-up
- Optional for lesson 23: AWS CLI, CDK CLI, Pulumi CLI, and Terraform/OpenTofu are optional; no cloud credentials required for reading and validation
- Optional for lesson 24: JFrog CLI and an Artifactory instance are optional; core validation and promotion simulation run locally
- Optional for lesson 25: no cloud account required; `kubectl`, OpenShift CLI, and cloud CLIs are optional for real follow-up practice
- Optional for lesson 26: no cluster required; `kubectl`, `istioctl`, and service mesh CLIs are optional for real follow-up practice
- Optional for lesson 27: no cloud account required; message broker, database, and stream tooling are optional for deeper follow-up practice
- Optional for lesson 28: no cloud account required; load testing tools and queue or broker tooling are optional for deeper follow-up practice
- Optional for lesson 29: no cloud account required; `kubectl` is optional only for sidecar-style workload follow-up practice
- Optional for lesson 30: no cloud account required; API gateway and object storage tooling are optional for deeper follow-up practice
- Optional for lesson 31: no cloud account required; API gateway tooling is optional for deeper follow-up practice
- Optional for lesson 32: no cloud account required; observability tooling is optional for deeper follow-up practice
- Optional for lesson 33: no account required for the lesson; Snyk CLI and Sonar scanners are optional for deeper follow-up practice
- Optional for lesson 34: no cloud account required; orchestration, warehouse, and stream tooling are optional for deeper follow-up practice

## Suggested Order

Run lessons in order. The early lessons use only Docker. Later lessons introduce infrastructure automation around containers.

```text
Dockerfile -> Compose -> Linux/Unix -> Protocols -> Caching/Load Balancing -> Cloud Fundamentals -> Serverless -> Kubernetes -> K3s -> Container Platforms -> Service Mesh -> Data Management -> Data Pipelines -> Availability -> Design Patterns -> Network Patterns -> Backend Patterns -> SRE Objectives -> SAST and Security Gates -> Ansible -> Packer -> Terraform -> OpenTofu -> IaC Tools -> Observability -> CI/CD -> DevSecOps -> GitOps -> Secrets -> AWS Identity -> Helm/Kustomize -> Artifacts -> Artifactory -> Tracing -> Runtime Containers
```
