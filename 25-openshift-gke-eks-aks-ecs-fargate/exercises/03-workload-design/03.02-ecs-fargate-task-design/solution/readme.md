# ECS and Fargate Task Design

1. `requiresCompatibilities` with `FARGATE`.
2. `taskRoleArn`.
3. `logConfiguration`.
4. An ECS `service`.
5. It reduces Kubernetes-specific operational complexity and stays closer to AWS-native service concepts.

