# Control Plane and Workload Models

| Statement | Best Fit |
| --- | --- |
| Team wants Deployments, Services, and CRDs | Managed Kubernetes or OpenShift |
| Team wants task definitions and AWS-native service scheduling | ECS |
| Team wants stronger platform opinion on top of Kubernetes | OpenShift |
| Team wants serverless compute without choosing Kubernetes first | ECS with Fargate |

Even with a managed control plane, the team still owns workload design, image lifecycle, identity mapping, network exposure, observability, scaling policy, and upgrade testing for workloads and add-ons.

