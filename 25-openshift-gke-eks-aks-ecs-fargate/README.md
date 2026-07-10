# Lesson 25: OpenShift, GKE, EKS, AKS, ECS, and Fargate

## Goal

Learn how to choose and operate major container platforms:

- Red Hat OpenShift
- Google Kubernetes Engine (GKE)
- Amazon Elastic Kubernetes Service (EKS)
- Azure Kubernetes Service (AKS)
- Amazon Elastic Container Service (ECS)
- AWS Fargate

This lesson teaches:

- managed Kubernetes versus managed container services
- control plane ownership and worker runtime models
- OpenShift platform features such as Routes, Operators, and Security Context Constraints
- how GKE, EKS, and AKS differ in operations, identity, networking, and add-on behavior
- how ECS task and service models differ from Kubernetes objects
- where Fargate fits with ECS and EKS
- platform selection tradeoffs for application teams and platform teams

No cloud account is required for the core exercises.

## Navigation

- Previous lesson: `24-jfrog-artifactory`
- Next lesson: `26-service-mesh`

## Related Lessons

- `09-k3s-local-cluster`
- `21-aws-azure-gcp-cloud-fundamentals`
- `38-openstack-private-cloud`

## Mental Model

```text
container image -> scheduler and platform API -> networking and identity -> deployment and scaling -> operations and security
```

The main decision is whether the team wants:

- Kubernetes as the orchestration contract
- or a cloud-specific container service contract

## Platform Groups

| Group | Platforms | Main Contract |
| --- | --- | --- |
| Enterprise Kubernetes platform | OpenShift | Kubernetes plus opinionated platform features |
| Managed Kubernetes | GKE, EKS, AKS | Kubernetes API managed by cloud provider |
| Managed container service | ECS | AWS-native task and service API |
| Serverless container compute | Fargate | Run containers without managing worker nodes |

Fargate is not a scheduler by itself. It is a serverless compute engine used by ECS tasks and by EKS pods selected through Fargate profiles.

## Lab Layout

```text
platform-maps/         Comparison tables and operational checklists
openshift/             OpenShift-specific examples and notes
kubernetes-manifests/  Portable Kubernetes workload examples
ecs/                   ECS task definition example
scenario-designs/      Team and platform selection scenarios
scripts/               Validation helper
exercises/             Structured hands-on practice
```

## Platform Overview

| Platform | API Style | Typical Fit | Key Tradeoff |
| --- | --- | --- | --- |
| OpenShift | Kubernetes plus OpenShift APIs | enterprises that want opinionated platform controls | more platform opinion and product surface area |
| GKE | managed Kubernetes | teams that want strong Google-managed Kubernetes experience | still need Kubernetes operations knowledge |
| EKS | managed Kubernetes | AWS teams that want Kubernetes on AWS | integration choices are flexible but operationally fragmented |
| AKS | managed Kubernetes | Azure-centric organizations | Azure integration is strong, but Kubernetes complexity remains |
| ECS | AWS-native container service | teams that want containers on AWS without standardizing on Kubernetes | less portability outside AWS |
| Fargate | serverless compute for ECS or EKS | teams that want to avoid node management | less host control and different cost model |

## OpenShift Notes

OpenShift matters as more than "Kubernetes on Red Hat." Common distinguishing platform features include:

- integrated Routes for external exposure
- Operators and Operator Lifecycle Manager patterns
- stricter default security posture through Security Context Constraints
- built-in image streams and registry patterns in many deployments
- opinionated cluster platform operations

If the team needs a curated platform with enterprise guardrails, OpenShift can reduce platform assembly work compared with stitching together raw Kubernetes add-ons.

## GKE, EKS, and AKS Notes

All three expose the Kubernetes API, but the operational defaults differ.

GKE offers Standard and Autopilot modes. Autopilot shifts more node and cluster operations to Google, but teams still design Kubernetes workloads, identity, networking, and release workflows.

EKS keeps the Kubernetes API on AWS and integrates with AWS identity, networking, and load balancing patterns. Teams can choose managed node groups, self-managed nodes, Fargate profiles, or EKS Auto Mode depending on how much data-plane automation they want.

AKS integrates with Azure networking, identity, and node pool management while keeping the standard Kubernetes API surface. AKS Automatic is the more opinionated path for teams that want Azure to preconfigure more cluster operations.

Do not treat them as interchangeable only because all three are Kubernetes. Identity, network architecture, ingress, observability, and upgrade workflows still differ.

## ECS and Fargate Notes

ECS models workloads with task definitions, tasks, and services instead of Deployments, Pods, and Services.

ECS is usually a better fit than Kubernetes when:

- the team is AWS-only
- the team wants fewer cluster abstractions
- portability is less important than simpler AWS-native operations

Fargate removes worker node management. That helps teams avoid node patching and capacity management, but it also reduces host-level control and changes pricing and platform constraints. In ECS, Fargate runs tasks; in EKS, Fargate runs matching Kubernetes pods rather than replacing Kubernetes itself.

## Production Questions

Before choosing a platform, answer:

1. Is Kubernetes itself a product requirement, or just a possible implementation?
2. Does the team need cloud portability or only organizational consistency?
3. Who owns cluster add-ons, upgrades, ingress, identity, and policy?
4. Is node management acceptable, or is serverless container compute preferred?
5. Does the organization want an opinionated internal platform or a thinner managed service?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks:

- required lesson files
- shell script syntax
- YAML syntax
- JSON syntax

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover platform groups, workload models, OpenShift features, differences across GKE/EKS/AKS, workload portability, ECS/Fargate task design, identity and networking choices, and platform selection.

## References

- OpenShift documentation: https://docs.redhat.com/en/documentation/openshift_container_platform
- OpenShift Routes: https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/networking/configuring-routes
- OpenShift Security Context Constraints: https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/authentication_and_authorization/managing-pod-security-policies
- GKE documentation: https://cloud.google.com/kubernetes-engine/docs
- GKE Autopilot overview: https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview
- Amazon EKS documentation: https://docs.aws.amazon.com/eks/
- Azure Kubernetes Service documentation: https://learn.microsoft.com/azure/aks/
- Amazon ECS documentation: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html
- AWS Fargate documentation: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html
- Amazon EKS on AWS Fargate: https://docs.aws.amazon.com/eks/latest/userguide/fargate.html
