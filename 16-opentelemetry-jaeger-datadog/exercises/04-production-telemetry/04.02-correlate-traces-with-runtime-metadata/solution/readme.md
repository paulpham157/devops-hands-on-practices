# Correlate Traces with Runtime Metadata

Expected answer:

- `service.name` should identify the application, such as `course-otel-app`.
- `deployment.environment` should separate `dev`, `staging`, and `prod`.
- `service.version` should map traces to a build or release.

In production, add consistent resource attributes before exporting to Jaeger, Datadog, or another backend.
