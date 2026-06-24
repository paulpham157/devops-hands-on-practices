# Lesson 06: Observability with Prometheus, Grafana, Loki, and Alloy

## Goal

Run a local observability stack for one sample app:

- Prometheus scrapes app metrics from `/metrics`.
- Loki stores application logs.
- Grafana Alloy tails the app log file and ships entries to Loki.
- Grafana visualizes metrics from Prometheus and logs from Loki.

Promtail is intentionally not used because it reached end-of-life on 2026-03-02. Alloy is the supported Grafana collector path for new lessons.

## Components

| Service | URL | Purpose |
|---|---:|---|
| Sample app | http://localhost:5002 | Generates requests, metrics, and JSON logs |
| Prometheus | http://localhost:9090 | Stores metrics and evaluates local rules |
| Loki | http://localhost:3100 | Stores logs |
| Alloy | http://localhost:12345 | Tails log files and ships logs to Loki |
| Grafana | http://localhost:3000 | Dashboards and Explore UI |

Grafana login:

```text
admin / admin
```

## Run

```bash
cd hands-on-practice/06-observability-prometheus-grafana-loki
docker compose up --build
```

Generate normal traffic:

```bash
for i in {1..20}; do curl -fsS http://localhost:5002/ >/dev/null; done
```

Generate slow and failing traffic:

```bash
curl -fsS http://localhost:5002/slow
curl -i http://localhost:5002/fail
```

## Prometheus Practice

Open Prometheus:

```text
http://localhost:9090
```

Try these queries:

```promql
sum(rate(http_requests_total{service="course-app"}[1m]))
sum(rate(http_requests_total{service="course-app",status=~"5.."}[1m]))
histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket{service="course-app"}[5m])) by (le))
```

Check alert rules:

```text
http://localhost:9090/alerts
```

## Loki Practice

Open Grafana:

```text
http://localhost:3000
```

Go to Explore, select the `Loki` data source, and try:

```logql
{service="course-app"}
{service="course-app", level="ERROR"}
{service="course-app"} | json | status >= 500
```

If you query Loki directly with `curl`, use `query_range` for log queries:

```bash
curl -G http://localhost:3100/loki/api/v1/query_range \
  --data-urlencode 'query={service="course-app"}' \
  --data-urlencode 'limit=5'
```

## Grafana Practice

Open the provisioned dashboard:

```text
Dashboards -> Docker Course Observability
```

The dashboard reads:

- request rate from Prometheus
- error rate from Prometheus
- p95 latency from Prometheus
- app logs from Loki

## Structured Exercises

Use the exercise track after the stack runs successfully:

```text
exercises/README.md
```

The exercises cover:

- adding an instrumented business endpoint
- writing PromQL golden signal queries
- parsing app logs with Alloy
- debugging failures with LogQL
- extending a Grafana dashboard and Prometheus alert

## Practice Tasks

1. Add a new app endpoint called `/checkout`.
2. Add a Prometheus counter label for that endpoint.
3. Add a Grafana panel for requests by endpoint.
4. Change the alert threshold from 5% error rate to 1%.
5. Add a Loki query that shows only slow requests.

## Clean Up

```bash
docker compose down --volumes
```
