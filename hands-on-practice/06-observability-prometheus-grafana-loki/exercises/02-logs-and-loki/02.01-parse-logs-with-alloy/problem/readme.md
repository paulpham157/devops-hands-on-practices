# Parse Logs with Alloy

## Task

Add the `endpoint` field as a Loki label in `alloy/config.alloy`.

It is currently parsed from JSON and stored as structured metadata. Move it into labels so this LogQL query works:

```logql
{service="course-app", endpoint="fail"}
```

## Steps

1. Edit `alloy/config.alloy`.
2. Restart Alloy:

```bash
docker compose restart alloy
```

3. Generate error traffic:

```bash
for i in {1..3}; do curl -s -o /dev/null http://localhost:5002/fail; done
```

4. Query Loki:

```bash
curl -G http://localhost:3100/loki/api/v1/query_range \
  --data-urlencode 'query={service="course-app", endpoint="fail"}' \
  --data-urlencode 'limit=5'
```

## Done When

The Loki response contains at least one log stream.

