# Handle Redis Outage

## Task

Stop Redis only:

```bash
docker compose stop redis
curl -i http://localhost:5001
```

Observe the failure. Then update the FastAPI app to return a clear `503` response when Redis is unavailable.

## Done When

With Redis stopped, the app returns HTTP `503`. After `docker compose start redis`, the counter works again.
