# Solution: Design a Safe Export Path

One reasonable design:

```text
service pods -> node-local OTel Collector DaemonSet -> central OTel Collector Deployment -> Datadog
```

`DD_API_KEY` should live in a secret manager or Kubernetes Secret managed by the platform team. It should be injected into the collector, not application code.

Sampling should be configured in the collector layer, commonly at a central collector where policy is easier to control.

Filter before export:

- access tokens
- passwords
- payment data
- raw personal data
- high-cardinality attributes that create cost or performance issues

Local Jaeger is for learning and debugging on a workstation. Production Datadog is a managed backend for retention, dashboards, APM, alerting, security integrations, and team workflows.

