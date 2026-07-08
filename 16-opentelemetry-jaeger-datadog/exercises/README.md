# Exercises: OpenTelemetry, Jaeger, and Datadog

Work through these exercises after reading the lesson README.

## Sections

1. `01-opentelemetry-basics`
   - Read receiver, processor, exporter, and pipeline sections in an OTel Collector config.
   - Understand trace, span, attribute, event, and error status in the sample app.
2. `02-jaeger-tracing`
   - Run the local app, Collector, and Jaeger stack.
   - Use span timing to identify the slow part of a checkout request.
3. `03-datadog-integration`
   - Map OTel concepts to Datadog APM concepts.
   - Design a production export path that protects API keys and controls cost.
4. `04-production-telemetry`
   - Design sampling and cost controls.
   - Correlate traces with runtime metadata.

## Suggested Workflow

From the lesson directory:

```bash
docker compose up --build
./scripts/generate-traffic.sh
./scripts/query-jaeger.sh
./scripts/validate.sh
```

Stop the stack:

```bash
docker compose down --volumes
```
