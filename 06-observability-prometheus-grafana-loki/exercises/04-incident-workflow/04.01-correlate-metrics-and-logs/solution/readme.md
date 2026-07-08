# Correlate Metrics and Logs

Useful PromQL:

```promql
course_app:http_requests:error_rate5m
course_app:http_request_duration_seconds:p95
```

Useful LogQL:

```logql
{service="course-app"} | json | status >= 500
{service="course-app"} | json | path="/slow"
```

Example incident note:

```text
Symptom: error rate increased after test traffic.
Metric evidence: error_rate5m above threshold.
Log evidence: service=course-app status=500 around the same time window.
Next action: inspect recent app changes or dependency behavior.
```
