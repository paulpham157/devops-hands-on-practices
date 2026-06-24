# Exercises: OpenShift, GKE, EKS, AKS, ECS, and Fargate

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-platform-foundations/01.01-managed-kubernetes-vs-managed-containers`
   - Compare managed Kubernetes and managed container services.

2. `01-platform-foundations/01.02-control-plane-and-workload-models`
   - Understand platform API models and compute ownership.

3. `02-platform-deep-dive/02.01-openshift-platform-features`
   - Identify what makes OpenShift different from a thinner Kubernetes service.

4. `02-platform-deep-dive/02.02-gke-eks-aks-differences`
   - Compare managed Kubernetes services beyond the shared Kubernetes API.

5. `03-workload-design/03.01-kubernetes-workload-portability`
   - Read a portable Kubernetes workload and reason about platform fit.

6. `03-workload-design/03.02-ecs-fargate-task-design`
   - Read an ECS task definition and map it to the ECS/Fargate model.

7. `04-production-operations/04.01-identity-networking-and-security`
   - Compare platform identity, ingress, and pod or task security concerns.

8. `04-production-operations/04.02-choose-the-right-platform`
   - Choose the right platform for realistic team and operations constraints.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
platform-maps/
openshift/
kubernetes-manifests/
ecs/
scenario-designs/
```

No cloud credentials are required.

