# Correlate Metrics and Logs

## Task

Generate slow and failing traffic:

```bash
curl -fsS http://localhost:5002/slow
curl -i http://localhost:5002/fail
```

Use Prometheus or Grafana to find:

1. A rise in error rate.
2. A rise in p95 latency.
3. Matching Loki log lines for the same service and time window.

## Done When

You can write a short incident note with symptom, query, suspected cause, and evidence.
