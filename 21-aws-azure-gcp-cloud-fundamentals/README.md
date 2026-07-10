# Lesson 21: AWS, Azure, and Google Cloud Platform Fundamentals

## Goal

Learn the core ideas shared by AWS, Microsoft Azure, and Google Cloud Platform, then compare how each provider names and organizes similar services.

This lesson teaches:

- cloud provider account and resource hierarchy
- regions, availability zones, and global services
- compute, storage, database, networking, IAM, Kubernetes, serverless, and observability service mapping
- IAM model differences
- network baseline design
- CLI orientation for AWS CLI, Azure CLI, and Google Cloud CLI
- tagging and cost allocation
- reliability, migration, and multi-cloud tradeoffs

This lesson does not require real cloud credentials. It is designed as a safe planning and comparison lab.

## Navigation

- Previous lesson: `20-application-protocols-microservices`
- Next lesson: `22-serverless-functions-platforms`

## Related Lessons

- `14-aws-identity`
- `22-serverless-functions-platforms`
- `38-openstack-private-cloud`

## Mental Model

```text
organization/account/project -> region -> network -> compute/service -> data -> identity -> observability -> cost controls
```

The cloud provider names differ, but the design questions repeat:

- Who owns the account/project/subscription?
- Which region should run the workload?
- Which network does it live in?
- Which identity can access it?
- Which data store is source of truth?
- How is it monitored?
- How is cost controlled?
- How does it recover from failure?

## Provider Resource Hierarchy

| Concept | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Top-level organization | AWS Organizations | Microsoft Entra tenant / Management groups | Organization |
| Billing / isolation unit | AWS account | Subscription | Billing account + project |
| Project-like container | Account | Resource group | Project |
| Region | Region | Region | Region |
| Zone | Availability Zone | Availability Zone | Zone |
| Identity service | IAM / IAM Identity Center | Microsoft Entra ID + Azure RBAC | Cloud IAM |

## Core Service Map

See the detailed map:

```text
cloud-maps/service-map.md
```

High-level examples:

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Virtual machine | EC2 | Azure Virtual Machines | Compute Engine |
| Object storage | S3 | Blob Storage | Cloud Storage |
| Managed Kubernetes | EKS | AKS | GKE |
| Serverless functions | Lambda | Azure Functions | Cloud Run functions, with Cloud Functions v2/1st gen still visible in APIs and docs |
| Container registry | ECR | Azure Container Registry | Artifact Registry |
| Private network | VPC | Virtual Network | VPC network |
| Managed relational DB | RDS / Aurora | Azure SQL / Azure Database | Cloud SQL / AlloyDB |
| Secrets | Secrets Manager / Parameter Store | Key Vault | Secret Manager |
| Monitoring | CloudWatch | Azure Monitor | Cloud Monitoring |

## CLI Orientation

| Provider | CLI | Login Command |
| --- | --- | --- |
| AWS | `aws` | `aws configure sso` or `aws configure` |
| Azure | `az` | `az login` |
| Google Cloud | `gcloud` | `gcloud auth login` |

Examples are in:

```text
cli-examples/
```

The examples are intentionally read-only or planning-focused.

## Core Design Questions

Before choosing provider-specific services, answer:

1. What is the workload?
2. Is it stateful or stateless?
3. What is the data classification?
4. What are latency and region requirements?
5. What identity model is required?
6. What network boundaries are required?
7. What uptime and recovery targets are required?
8. What is the expected traffic pattern?
9. What is the budget and cost allocation model?
10. Who will operate it?

## Common Architecture Patterns

### Basic Web App

```text
load balancer -> app containers/VMs -> managed database -> object storage -> monitoring
```

### Kubernetes Platform

```text
managed Kubernetes -> ingress/load balancer -> container registry -> secret manager -> observability
```

### Serverless API

```text
API gateway -> function/container service -> managed database -> event bus -> logs/metrics
```

### Data Pipeline

```text
object storage -> queue/event stream -> processing job -> warehouse/lakehouse -> dashboard
```

## Production Notes

For production cloud work:

- Use separate accounts/subscriptions/projects for environments.
- Enforce MFA and SSO.
- Prefer roles/workload identity over long-lived access keys.
- Define network boundaries early.
- Use private subnets for private workloads.
- Use managed databases when operational capacity is limited.
- Tag or label every resource.
- Set budgets and alerts.
- Enable audit logs.
- Centralize secrets in a secrets manager.
- Use infrastructure as code.
- Plan backup, restore, and disaster recovery.
- Test failure modes before production.

## Validate

```bash
./scripts/validate.sh
```

This checks:

- shell script syntax
- YAML syntax
- JSON syntax
- required lesson files

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover provider comparison, resource hierarchy, service mapping, managed service selection, IAM, networking, CLI/tagging practice, cost, reliability, and migration tradeoffs.

## References

- AWS documentation: https://docs.aws.amazon.com/
- AWS Cloud Essentials: https://aws.amazon.com/getting-started/cloud-essentials/
- Azure documentation: https://learn.microsoft.com/azure/
- Azure fundamentals: https://learn.microsoft.com/training/paths/azure-fundamentals-describe-cloud-concepts/
- Google Cloud documentation: https://cloud.google.com/docs
- Google Cloud architecture framework: https://cloud.google.com/architecture/framework
- AWS service endpoints and quotas: https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html
- Azure products: https://azure.microsoft.com/products/
- Google Cloud products: https://cloud.google.com/products
