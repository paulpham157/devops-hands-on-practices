# Datadog Export Path

This directory contains a Datadog-oriented OpenTelemetry Collector config.

It is intentionally not used by the default `compose.yaml`, because it needs a real Datadog API key and sends telemetry to Datadog.

## Required Environment

```bash
export DD_API_KEY="replace-me"
export DD_SITE="datadoghq.com"
```

Use the site that matches your Datadog organization, for example:

```text
datadoghq.com
datadoghq.eu
us3.datadoghq.com
us5.datadoghq.com
ap1.datadoghq.com
```

## Pipeline Shape

```text
app -> OTLP receiver -> resource/batch processors -> Datadog exporter
```

The app does not need Datadog-specific code. The collector owns the Datadog exporter configuration.

## Secret Rule

Do not commit a real `DD_API_KEY`.

Store it in:

- a local shell environment for learning
- CI/CD secret store
- Kubernetes Secret
- Vault or cloud secrets manager

