# Instrument a Business Endpoint

## Task

Add a new route to `app/app.py`:

```text
GET /checkout
```

The endpoint should return JSON:

```json
{"message": "checkout complete"}
```

Then prove that Prometheus sees the new endpoint label.

## Steps

1. Edit `app/app.py`.
2. Restart the app:

```bash
docker compose up -d --build app
```

3. Generate traffic:

```bash
for i in {1..10}; do curl -fsS http://localhost:5002/checkout >/dev/null; done
```

4. Query Prometheus:

```promql
sum(http_requests_total{service="course-app"}) by (endpoint)
```

## Done When

The Prometheus result includes:

```text
endpoint="checkout"
```

