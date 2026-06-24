# Operations Checklist

Use this checklist before adopting a service mesh.

## Traffic

- Do services need retries, timeouts, and routing policy outside application code?
- Will the team use canary, weighted routing, or fault injection?
- Are gateway and east-west traffic responsibilities clearly separated?

## Security

- How will workload identity be established?
- Is mTLS mandatory, permissive, or optional?
- Who owns authorization policy rollout and exception handling?

## Observability

- Are request metrics, traces, and error signals already available?
- Will the mesh improve visibility enough to justify proxy overhead?
- Is the team prepared to debug proxy behavior as part of incidents?

## Platform Operations

- Who upgrades the mesh control plane and data plane?
- What is the rollout plan for sidecars or ambient-style components?
- How will certificate rotation, policy drift, and namespace onboarding be handled?

