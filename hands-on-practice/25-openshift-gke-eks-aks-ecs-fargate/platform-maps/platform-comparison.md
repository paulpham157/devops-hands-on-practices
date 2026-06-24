# Platform Comparison

| Dimension | OpenShift | GKE | EKS | AKS | ECS | Fargate |
| --- | --- | --- | --- | --- | --- | --- |
| Primary API | Kubernetes plus OpenShift APIs | Kubernetes | Kubernetes | Kubernetes | ECS | ECS or EKS compute mode |
| Main abstraction | cluster platform | managed cluster | managed cluster | managed cluster | task and service | serverless container runtime |
| Worker node management | platform-dependent | standard or Autopilot modes | managed node groups or self-managed nodes | managed node pools | EC2 or Fargate | no worker nodes to manage |
| Portability | medium | medium | medium | medium | low | low to medium, depends on orchestrator |
| Opinionation | high | medium | medium | medium | medium | medium |
| Good fit | enterprise platform teams | teams wanting Google-managed Kubernetes | AWS teams standardizing on Kubernetes | Azure-centric platform teams | AWS teams that do not need Kubernetes | teams avoiding node operations |
| Main tradeoff | broader platform surface | still Kubernetes complexity | still Kubernetes plus AWS integration work | still Kubernetes plus Azure integration work | AWS lock-in | less host-level control |

