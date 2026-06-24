# Exercises: Service Mesh

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-service-mesh-foundations/01.01-why-service-mesh`
   - Understand which cross-service problems a mesh solves.

2. `01-service-mesh-foundations/01.02-control-plane-and-data-plane`
   - Separate control plane and data plane responsibilities.

3. `02-traffic-and-security/02.01-istio-traffic-management`
   - Read Istio traffic policy and weighted routing examples.

4. `02-traffic-and-security/02.02-mtls-and-authorization`
   - Read mTLS and service authorization examples.

5. `03-mesh-implementations/03.01-compare-istio-linkerd-consul`
   - Compare major service mesh implementations.

6. `03-mesh-implementations/03.02-sidecar-vs-lighter-mesh-models`
   - Reason about proxy injection and operational tradeoffs.

7. `04-production-operations/04.01-observability-and-failure-handling`
   - Apply mesh observability and traffic-resilience thinking.

8. `04-production-operations/04.02-choose-a-service-mesh`
   - Choose the right mesh for realistic platform constraints.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
platform-maps/
istio/
linkerd/
consul/
scenario-designs/
```

No cluster is required.

