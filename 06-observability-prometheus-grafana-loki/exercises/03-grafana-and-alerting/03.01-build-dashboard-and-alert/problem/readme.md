# Build a Dashboard and Alert

## Task

Extend the existing Grafana dashboard and Prometheus alert.

## Dashboard Changes

Add one new panel to `grafana/dashboards/docker-course-observability.json`:

```text
Title: Requests by Endpoint
Data source: Prometheus
Query: sum(rate(http_requests_total{service="course-app"}[1m])) by (endpoint)
Panel type: timeseries
```

## Alert Change

Change the alert threshold in `prometheus/rules/course-app.yml`:

```text
from: error rate > 0.05
to:   error rate > 0.01
```

Restart Prometheus:

```bash
docker compose restart prometheus
```

## Done When

1. Grafana shows the new panel.
2. Prometheus shows the alert expression with threshold `0.01`.
3. After several `/fail` requests, the alert eventually moves toward firing.

