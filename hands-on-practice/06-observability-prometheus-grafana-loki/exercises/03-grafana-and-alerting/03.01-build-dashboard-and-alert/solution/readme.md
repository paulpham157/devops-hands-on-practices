# Build a Dashboard and Alert

For the alert threshold, edit `prometheus/rules/course-app.yml`:

```yaml
- alert: CourseAppHighErrorRate
  expr: course_app:http_requests:error_rate5m > 0.01
```

Restart Prometheus:

```bash
docker compose restart prometheus
```

Verify rules:

```bash
curl -fsS http://localhost:9090/api/v1/rules
```

For the dashboard, add a timeseries panel using this PromQL:

```promql
sum(rate(http_requests_total{service="course-app"}[1m])) by (endpoint)
```

The fastest manual path is:

```text
Grafana -> Dashboards -> Docker Course Observability -> Edit -> Add panel
```

The file-based path is to add a new panel object to `grafana/dashboards/docker-course-observability.json`, then restart Grafana:

```bash
docker compose restart grafana
```

