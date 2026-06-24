# Problem: Run Local Tracing

Run:

```bash
docker compose up --build
./scripts/generate-traffic.sh
```

Open:

```text
http://localhost:16686
```

Search for:

```text
course-otel-app
```

Answer:

1. How many services appear in Jaeger?
2. Which trace has the longest duration?
3. Which trace contains an error?
4. What trace ID is returned by `curl http://localhost:5016/checkout`?
5. Which spans are children of `GET /checkout`?

