# Tune Alert Threshold

Expected alert expression:

```yaml
- alert: CourseAppHighErrorRate
  expr: course_app:http_requests:error_rate5m > 0.01
  for: 2m
```

Verify the rule in Prometheus:

```text
http://localhost:9090/rules
```

Generate errors:

```bash
for i in $(seq 1 20); do curl -i http://localhost:5002/fail >/dev/null; done
```

In a production service, document why the chosen threshold maps to user impact.
