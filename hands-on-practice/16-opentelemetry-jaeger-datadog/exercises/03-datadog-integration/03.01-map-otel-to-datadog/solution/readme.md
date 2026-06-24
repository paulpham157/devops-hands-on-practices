# Solution: Map OTel to Datadog

The Datadog exporter is:

```text
exporters.datadog
```

Required environment variables:

- `DD_API_KEY`
- `DD_SITE`

Resource attributes in the app:

- `service.name`
- `service.version`
- `deployment.environment.name`

The Datadog service name should come from:

```text
service.name=course-otel-app
```

The app should not hardcode a Datadog API key because credentials should be owned by deployment infrastructure or secret management, not application source code.

