# Control Plane and Workload Models

Different platforms hide different layers.

Managed Kubernetes usually hides control plane management, but the team still works with Pods, Deployments, Services, ingress, add-ons, and cluster operations.

ECS hides Kubernetes entirely and replaces it with task definitions, services, and AWS-native integrations.

Fargate removes worker node management, but only after the workload contract has already been chosen.

