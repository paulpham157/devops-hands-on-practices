# Operations Checklist

Use this checklist before choosing a container platform.

## Workload Contract

- Do developers need the Kubernetes API specifically?
- Will workloads rely on Kubernetes operators, CRDs, or Helm charts?
- Is task-definition style deployment acceptable?

## Identity and Security

- How will workloads get cloud credentials?
- What is the cluster or service-level RBAC model?
- Are stronger default pod restrictions required?
- Is image admission or policy enforcement part of the platform plan?

## Networking

- Who owns ingress and load balancers?
- Is service mesh required?
- Are CNI, egress, and network policy decisions already understood?

## Platform Operations

- Who upgrades worker nodes and add-ons?
- Is serverless container compute preferred over worker node pools?
- What is the logging, metrics, and tracing path?
- How will drift between platform stacks be controlled?

