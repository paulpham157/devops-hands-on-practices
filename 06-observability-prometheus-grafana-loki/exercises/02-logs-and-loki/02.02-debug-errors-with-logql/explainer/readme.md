# Debug Errors with LogQL

Metrics tell you that something is wrong. Logs help explain what happened.

A common workflow is:

```text
Prometheus shows 5xx increase -> Loki filters error logs -> logs reveal path, status, and latency
```

Because the app writes JSON logs, LogQL can parse fields with `| json` and filter by numeric values like `status` or `latency_ms`.

