# ECS and Fargate Task Design

ECS workloads are defined as task definitions. A service then keeps the desired task count running.

When Fargate is selected, worker nodes are not managed by the team, but the ECS workload model stays the same.

This is a different contract from Kubernetes and should be treated that way during platform selection.

