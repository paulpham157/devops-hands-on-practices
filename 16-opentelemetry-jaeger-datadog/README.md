# Lesson 16: OpenTelemetry, Jaeger, and Datadog

## Goal

Learn how distributed tracing works with OpenTelemetry, how the OpenTelemetry Collector routes telemetry, how Jaeger helps debug traces locally, and how Datadog can receive OpenTelemetry data in a production-style setup.

This lesson teaches:

- OpenTelemetry signals: traces, metrics, and logs
- Trace, span, attribute, event, status, and resource
- OTLP as the OpenTelemetry wire protocol
- OpenTelemetry Collector receivers, processors, exporters, and pipelines
- Jaeger as a local trace backend and UI
- Datadog as a managed observability backend
- How to keep vendor-neutral instrumentation while exporting to a vendor backend
- Safe handling of Datadog API keys

## Mental Model

```text
instrumented app -> OTLP -> OpenTelemetry Collector -> backend
```

For this lesson:

```text
Flask app -> OTel Collector -> Jaeger
```

Optional production-style path:

```text
Flask app -> OTel Collector -> Datadog
```

The application should know how to emit OpenTelemetry data. It should not need to know every backend-specific detail.

## Components

| Component | URL | Purpose |
| --- | ---: | --- |
| Sample app | http://localhost:5016 | Generates traced requests |
| OpenTelemetry Collector OTLP gRPC | localhost:4317 | Receives traces from the app |
| OpenTelemetry Collector OTLP HTTP | http://localhost:4318 | Optional OTLP HTTP endpoint |
| OpenTelemetry Collector metrics | http://localhost:8888/metrics | Collector internal metrics |
| Jaeger UI | http://localhost:16686 | Search and inspect traces |

## Lab Layout

```text
app/                 Flask app with manual OpenTelemetry spans
otel/                Local OpenTelemetry Collector config for Jaeger
datadog/             Datadog exporter config template
scripts/             Traffic generation, Jaeger query, and validation helpers
exercises/           Structured hands-on practice
```

## Prerequisites

Install:

- Docker Desktop or Docker Engine
- Docker Compose plugin

Optional:

- `curl`
- `jq`
- Datadog account and API key, only for the optional Datadog export path

## Run Local Tracing

```bash
cd 16-opentelemetry-jaeger-datadog
docker compose up --build
```

Generate traffic:

```bash
./scripts/generate-traffic.sh
```

Open Jaeger:

```text
http://localhost:16686
```

Search for service:

```text
course-otel-app
```

Try these app endpoints:

```bash
curl -fsS http://localhost:5016/
curl -fsS http://localhost:5016/checkout
curl -fsS "http://localhost:5016/checkout?slow=true"
curl -i "http://localhost:5016/checkout?fail=true"
```

Each response includes a `trace_id` that can be searched in Jaeger.

## OpenTelemetry Concepts

| Concept | Meaning |
| --- | --- |
| Trace | One end-to-end operation across services |
| Span | One timed unit of work inside a trace |
| Attribute | Key-value metadata on a span |
| Event | Point-in-time annotation inside a span |
| Status | Success or error state for a span |
| Resource | Metadata about the thing producing telemetry, such as `service.name` |
| OTLP | OpenTelemetry Protocol used to send telemetry |

## Collector Pipeline

The local collector config is in:

```text
otel/collector.yaml
```

It has this shape:

```text
receivers -> processors -> exporters
```

In this lesson:

```text
otlp receiver -> memory_limiter + batch processors -> Jaeger OTLP exporter + debug exporter
```

The collector is the right place to manage backend routing, batching, filtering, and exporter credentials.

## Jaeger Practice

In Jaeger, inspect:

- trace duration
- parent and child spans
- span attributes
- error status
- events on slow and failed requests

Useful questions:

- Which span is slowest?
- Did the request fail in inventory lookup or payment authorization?
- Which deployment environment produced the trace?
- Which HTTP route created the trace?

## Datadog Practice

The Datadog config template is:

```text
datadog/otel-collector-datadog.yaml
```

It is not used by default. To use it, you need a Datadog API key and the correct Datadog site.

Example environment values:

```bash
export DD_API_KEY="replace-me"
export DD_SITE="datadoghq.com"
```

Then run an OTel Collector using the Datadog config. Do not commit real API keys.

Datadog is the backend. OpenTelemetry remains the instrumentation and collection standard.

## Validate

```bash
./scripts/validate.sh
```

This checks:

- shell script syntax
- YAML syntax for Compose and collector configs
- Python syntax for the sample app
- Docker Compose config, when Docker is available

## Production Notes

For production:

- Keep instrumentation vendor-neutral when possible.
- Pin Collector and backend image versions for repeatable labs and upgrades; do not depend on `latest`.
- Send telemetry to a local or node-local collector, not directly from every app to the internet.
- Use environment variables or secret managers for API keys.
- Set sampling intentionally.
- Add resource attributes such as service name, environment, version, and region.
- Use batch processors to reduce exporter overhead.
- Use memory limits in collectors.
- Define trace retention and cost controls.
- Correlate traces with logs and metrics through service, environment, version, and trace IDs.

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover OTel pipeline reading, span instrumentation, local Jaeger tracing, slow request debugging, Datadog exporter mapping, and safe production export design.

## References

- OpenTelemetry documentation: https://opentelemetry.io/docs/
- OpenTelemetry Collector documentation: https://opentelemetry.io/docs/collector/
- OpenTelemetry Python documentation: https://opentelemetry.io/docs/languages/python/
- Jaeger documentation: https://www.jaegertracing.io/docs/
- Datadog OpenTelemetry documentation: https://docs.datadoghq.com/opentelemetry/
