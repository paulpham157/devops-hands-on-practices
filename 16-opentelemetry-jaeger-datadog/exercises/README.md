# Exercises: OpenTelemetry, Jaeger, and Datadog

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-opentelemetry-basics/01.01-read-an-otel-pipeline`
   - Read receiver, processor, exporter, and pipeline sections in an OTel Collector config.

2. `01-opentelemetry-basics/01.02-instrument-a-span`
   - Understand trace, span, attribute, event, and error status in the sample app.

3. `02-jaeger-tracing/02.01-run-local-tracing`
   - Run the local app, Collector, and Jaeger stack.

4. `02-jaeger-tracing/02.02-debug-a-slow-request`
   - Use span timing to identify the slow part of a checkout request.

5. `03-datadog-integration/03.01-map-otel-to-datadog`
   - Map OTel concepts to Datadog APM concepts.

6. `03-datadog-integration/03.02-design-a-safe-export-path`
   - Design a production export path that protects API keys and controls cost.

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

