# Exercises: Observability with Prometheus, Grafana, Loki, and Alloy

Run the stack first:

```bash
cd 06-observability-prometheus-grafana-loki
docker compose up --build
```

## Sections

1. `01-metrics-and-prometheus`
   - Instrument a business endpoint.
   - Query golden signals with PromQL.
2. `02-logs-and-loki`
   - Parse structured logs with Alloy.
   - Debug failures with LogQL.
3. `03-grafana-and-alerting`
   - Build dashboards and alerts.
   - Tune alert thresholds.
4. `04-incident-workflow`
   - Correlate metrics and logs during an incident.

## Completion Target

For each exercise, finish only when you can verify the change from the running tools, not only from the file edit.

```text
edit -> restart or reload -> generate traffic -> query Prometheus/Loki/Grafana
```

By the end, you should be able to move from symptom to signal to supporting logs.
