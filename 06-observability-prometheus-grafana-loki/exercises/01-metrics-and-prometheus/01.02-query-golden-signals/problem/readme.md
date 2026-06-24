# Query Golden Signals

## Task

Write PromQL queries for traffic, errors, and p95 latency.

Generate mixed traffic first:

```bash
for i in {1..20}; do curl -fsS http://localhost:5002/ >/dev/null; done
for i in {1..5}; do curl -fsS http://localhost:5002/slow >/dev/null; done
for i in {1..3}; do curl -s -o /dev/null http://localhost:5002/fail; done
```

## Queries to Produce

1. Requests per second for `course-app`.
2. 5xx error ratio for `course-app`.
3. p95 latency for `course-app`.
4. Requests per endpoint and status.

## Done When

You can explain which query answers which production question.

