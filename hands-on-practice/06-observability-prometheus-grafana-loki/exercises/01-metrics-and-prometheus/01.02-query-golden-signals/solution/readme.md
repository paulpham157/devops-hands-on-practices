# Query Golden Signals

Traffic:

```promql
sum(rate(http_requests_total{service="course-app"}[1m]))
```

Error ratio:

```promql
sum(rate(http_requests_total{service="course-app",status=~"5.."}[5m]))
/
clamp_min(sum(rate(http_requests_total{service="course-app"}[5m])), 0.001)
```

p95 latency:

```promql
histogram_quantile(
  0.95,
  sum(rate(http_request_duration_seconds_bucket{service="course-app"}[5m])) by (le)
)
```

Requests by endpoint and status:

```promql
sum(rate(http_requests_total{service="course-app"}[1m])) by (endpoint, status)
```

Production questions:

- Traffic: "Is demand changing?"
- Error ratio: "Are users seeing failures?"
- p95 latency: "Are normal users waiting too long?"
- Endpoint/status split: "Which route is causing the symptom?"

