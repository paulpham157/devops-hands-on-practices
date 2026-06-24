# Instrument a Business Endpoint

Add this route to `app/app.py`:

```python
@app.get("/checkout")
def checkout():
    return {"message": "checkout complete"}
```

No extra counter code is needed. The existing `after_request` hook already records:

```python
endpoint = request.endpoint or "unknown"
requests_total.labels(SERVICE_NAME, method, endpoint, status).inc()
```

Verify:

```bash
docker compose up -d --build app
for i in {1..10}; do curl -fsS http://localhost:5002/checkout >/dev/null; done
curl -G http://localhost:9090/api/v1/query \
  --data-urlencode 'query=sum(http_requests_total{service="course-app"}) by (endpoint)'
```

Expected result includes a time series for `checkout`.

