# Solution: Read an OTel Pipeline

The app sends telemetry to the `otlp` receiver.

Enabled protocols:

- OTLP gRPC on port `4317`
- OTLP HTTP on port `4318`

The trace pipeline uses:

- `memory_limiter`
- `batch`

The Jaeger exporter is:

```text
otlp/jaeger
```

Backend routing belongs in the collector because it keeps application instrumentation vendor-neutral. The app emits telemetry once, and the collector decides whether to send it to Jaeger, Datadog, another backend, or multiple backends.

