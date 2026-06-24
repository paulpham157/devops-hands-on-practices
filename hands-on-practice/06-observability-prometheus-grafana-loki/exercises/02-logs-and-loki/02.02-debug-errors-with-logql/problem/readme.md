# Debug Errors with LogQL

## Task

Use LogQL to answer these questions:

1. Which log entries are errors?
2. Which requests returned status `500`?
3. Which requests were slower than `300ms`?
4. Which paths are involved in failures?

Generate traffic:

```bash
curl -fsS http://localhost:5002/ >/dev/null
curl -fsS http://localhost:5002/slow >/dev/null
curl -s -o /dev/null http://localhost:5002/fail
```

## Done When

You have one LogQL query for each question and can run it in Grafana Explore with the `Loki` data source.

