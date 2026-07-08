# Lesson 26: Service Mesh

## Goal

Learn what a service mesh adds to a microservice platform and when it is worth the operational cost.

This lesson teaches:

- what a service mesh is and what it is not
- data plane and control plane responsibilities
- service-to-service traffic management
- mutual TLS, identity, and authorization policy
- observability for east-west traffic
- common failure-handling patterns such as retries, timeouts, and traffic shifting
- practical differences across Istio, Linkerd, and Consul

No Kubernetes cluster is required for the core exercises.

## Mental Model

```text
service A -> local proxy -> network -> local proxy -> service B
           ^ policy, telemetry, identity, and routing controlled by mesh
```

A service mesh is a dedicated infrastructure layer for service-to-service communication. It usually adds:

- traffic routing and shaping
- retries, timeouts, and circuit-breaking style controls
- workload identity and mTLS
- metrics, traces, and request-level visibility
- policy enforcement for east-west traffic

## What a Service Mesh Is Not

A service mesh does not replace:

- Kubernetes as the cluster orchestrator
- application business logic
- API gateway edge concerns in every case
- all network security architecture

It complements platform networking by handling application-to-application communication inside distributed systems.

## Common Architecture

| Layer | Responsibility |
| --- | --- |
| Data plane | Proxies or node-level components that intercept service traffic |
| Control plane | Distributes policy, certificates, service discovery, and config |
| Workloads | Application containers that ideally avoid implementing mesh concerns directly |

Many meshes historically use sidecars. Newer models may reduce sidecar usage, but the core idea stays the same: policy and telemetry are attached to network paths instead of being hardcoded into every service.

## Platform Comparison

| Mesh | Main Character | Typical Fit | Main Tradeoff |
| --- | --- | --- | --- |
| Istio | feature-rich mesh with deep traffic and policy controls | large platforms needing rich traffic management and security policy | higher operational and conceptual complexity |
| Linkerd | simpler Kubernetes-focused mesh with strong default mTLS and observability | teams wanting a lighter operational footprint | smaller feature surface than Istio |
| Consul | service networking across Kubernetes and non-Kubernetes environments | hybrid environments and HashiCorp-oriented platforms | operational model depends more on Consul ecosystem choices |

## Lab Layout

```text
platform-maps/         Comparison tables and operational checklists
istio/                 Istio traffic and security examples
linkerd/               Linkerd overview notes and examples
consul/                Consul service mesh notes and examples
scenario-designs/      Team and platform selection scenarios
scripts/               Validation helper
exercises/             Structured hands-on practice
```

## Istio Notes

Istio is often chosen when the platform team needs:

- rich traffic management
- strong policy control
- deep observability integration
- progressive delivery patterns such as canary and weighted routing

The example files in `istio/` show:

- `VirtualService` for traffic routing
- `DestinationRule` for subsets and traffic policy
- `PeerAuthentication` for mTLS posture
- `AuthorizationPolicy` for service-to-service access control

Istio can run with sidecar mode or ambient mode. Sidecar mode attaches Envoy per workload, while ambient mode uses shared Layer 4 node proxies and optional waypoint proxies for Layer 7 features. Treat data-plane mode as an adoption decision, not an implementation detail.

## Linkerd Notes

Linkerd emphasizes a simpler operational experience and secure-by-default service-to-service communication. It is often attractive when the team wants:

- Kubernetes-first service mesh
- mTLS and golden metrics with less feature surface
- lower control-plane complexity than a larger mesh stack

## Consul Notes

Consul service mesh matters most when the environment extends beyond one Kubernetes cluster. It is often considered when the team needs:

- service networking across Kubernetes and virtual machines
- identity and intentions across mixed runtime environments
- tighter alignment with a broader Consul service networking model

## Production Questions

Before adding a service mesh, answer:

1. Which communication problems are currently solved badly in application code?
2. Is mTLS and service identity a real requirement or a vague aspiration?
3. Does the team need fine-grained traffic shifting and fault handling?
4. Who will own certificates, policy rollout, and proxy lifecycle?
5. Is the platform mature enough to absorb the added operational surface?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks:

- required lesson files
- shell script syntax
- YAML syntax

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover mesh fundamentals, control plane and data plane roles, Istio traffic policy, mTLS and authorization, comparing Istio, Linkerd, and Consul, sidecar tradeoffs, observability, failure handling, and platform selection.

## References

- Istio documentation: https://istio.io/latest/docs/
- Istio ambient mode: https://istio.io/latest/docs/ambient/
- Istio traffic management: https://istio.io/latest/docs/concepts/traffic-management/
- Istio security concepts: https://istio.io/latest/docs/concepts/security/
- Linkerd documentation: https://linkerd.io/2/overview/
- Linkerd security model: https://linkerd.io/2/features/automatic-mtls/
- Consul service mesh documentation: https://developer.hashicorp.com/consul/docs/connect
