# Explainer: Read an OTel Pipeline

The OpenTelemetry Collector is configured as a pipeline.

```text
receivers -> processors -> exporters
```

In this lesson:

| Section | Purpose |
| --- | --- |
| `receivers.otlp` | Accepts telemetry from apps over OTLP gRPC or HTTP |
| `processors.memory_limiter` | Protects the collector from using too much memory |
| `processors.batch` | Batches telemetry before export |
| `exporters.otlp/jaeger` | Sends traces to Jaeger |
| `exporters.debug` | Prints basic telemetry information in collector logs |
| `service.pipelines.traces` | Connects receivers, processors, and exporters |

Apps should send telemetry to the collector. The collector should own backend routing.

