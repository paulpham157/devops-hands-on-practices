# Debug Errors with LogQL

Error logs:

```logql
{service="course-app", level="ERROR"}
```

Status `500` logs:

```logql
{service="course-app"} | json | status = 500
```

Slow requests over `300ms`:

```logql
{service="course-app"} | json | latency_ms > 300
```

Failure paths:

```logql
{service="course-app"} | json | status >= 500 | line_format "{{.path}} {{.status}} {{.latency_ms}}ms"
```

If you use `curl`, call Loki's range endpoint:

```bash
curl -G http://localhost:3100/loki/api/v1/query_range \
  --data-urlencode 'query={service="course-app"} | json | status >= 500' \
  --data-urlencode 'limit=5'
```

