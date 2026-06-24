# Parse Logs with Alloy

In `alloy/config.alloy`, add `endpoint` to `stage.labels`:

```hcl
stage.labels {
  values = {
    endpoint = "",
    level    = "",
    method   = "",
    status   = "",
  }
}
```

Then remove `endpoint` from `stage.structured_metadata` to avoid duplicating it:

```hcl
stage.structured_metadata {
  values = {
    latency_ms = "",
    path       = "",
  }
}
```

Verify:

```bash
docker compose restart alloy
for i in {1..3}; do curl -s -o /dev/null http://localhost:5002/fail; done
curl -G http://localhost:3100/loki/api/v1/query_range \
  --data-urlencode 'query={service="course-app", endpoint="fail"}' \
  --data-urlencode 'limit=5'
```

Expected: `data.result` is not empty.

