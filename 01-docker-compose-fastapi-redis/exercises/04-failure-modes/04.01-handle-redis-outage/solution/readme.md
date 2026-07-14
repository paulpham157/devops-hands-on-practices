# Handle Redis Outage

Wrap the Redis call and return a service-unavailable response:

```python
try:
    hits = redis_client.incr("page_hits")
except redis.exceptions.RedisError:
    return "Redis is unavailable\n", 503
```

Verify:

```bash
docker compose stop redis
curl -i http://localhost:5001
docker compose start redis
curl -fsS http://localhost:5001
```
