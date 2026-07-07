# Exercises: Kubernetes Nginx Deployment

## Sections

1. `01-workloads`
   - Scale a Deployment and watch rollout behavior.
2. `02-configuration`
   - Update content through a ConfigMap.
3. `03-debugging`
   - Diagnose an image pull failure.
4. `04-networking`
   - Trace Service ports to container ports.
5. `05-policy`
   - Explain NetworkPolicy intent and limits.

## Suggested Flow

Apply the manifests once, then change one concept at a time.

```text
replicas -> config -> failure -> service routing -> policy
```

## Completion Target

By the end, you should be able to explain:

- How Deployments create and replace Pods.
- How Services select Pods and route traffic.
- How ConfigMaps decouple configuration from images.
- How to inspect common Kubernetes failure states.
