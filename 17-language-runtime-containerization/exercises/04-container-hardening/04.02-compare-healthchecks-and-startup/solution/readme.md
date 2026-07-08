# Compare Healthchecks and Startup

Expected observations:

- Java and Rust builds may take longer because builder images and compile steps are heavier.
- Go and Rust runtime images can be small, but build time still matters.
- `/healthz` should return a fast success response for every service.
- Kubernetes readiness probes should use the service port and `/healthz`.

Example probe shape:

```yaml
readinessProbe:
  httpGet:
    path: /healthz
    port: http
```
