# Problem: Design a Safe Export Path

Design a production telemetry path for:

```text
20 microservices running in Kubernetes
Datadog is the production backend
Jaeger is used only in local development
Teams must avoid committing API keys
Trace volume must be controlled
```

Write:

1. Where collectors should run.
2. Where `DD_API_KEY` should live.
3. Where sampling should be configured.
4. What should be filtered before export.
5. How local Jaeger differs from production Datadog.

