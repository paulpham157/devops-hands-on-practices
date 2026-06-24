# ECS and Fargate Workload Model

ECS does not expose Kubernetes objects. The main concepts are:

- task definition: desired container spec template
- task: running instance of a task definition
- service: desired long-running task count
- cluster: logical placement boundary

Fargate is a launch type or compute engine, not a replacement for ECS concepts.

## Practical Difference from Kubernetes

Kubernetes developers think in Deployments, Pods, Services, Ingress, and CRDs.

ECS developers think in task definitions, services, load balancer attachments, IAM roles, and capacity modes.

This is why ECS is operationally simpler for some AWS-only teams and less portable for everyone else.

