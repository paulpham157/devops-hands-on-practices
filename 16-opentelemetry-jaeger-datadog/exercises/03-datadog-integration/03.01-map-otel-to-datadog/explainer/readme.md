# Explainer: Map OTel to Datadog

OpenTelemetry and Datadog use compatible observability concepts, but they are not the same layer.

| OpenTelemetry | Datadog |
| --- | --- |
| Instrumentation SDK | Application instrumentation |
| Resource attributes | Service metadata and tags |
| Span | APM span |
| Trace | APM trace |
| Collector exporter | Datadog intake path |
| `service.name` | Service name in APM |
| `deployment.environment.name` | Environment tag |

The app can stay OpenTelemetry-native while the collector exports to Datadog.

