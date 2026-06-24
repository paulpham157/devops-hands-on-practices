# Managed Kubernetes vs Managed Containers

| Platform | Classification |
| --- | --- |
| OpenShift | Platform Kubernetes |
| GKE | Managed Kubernetes |
| EKS | Managed Kubernetes |
| AKS | Managed Kubernetes |
| ECS | Managed Container Service |
| Fargate | Compute Mode |

Answers:

1. OpenShift, GKE, EKS, and AKS expose Kubernetes APIs directly.
2. ECS.
3. Fargate is serverless container compute used by ECS or EKS workloads. It does not replace the scheduler or workload API.

