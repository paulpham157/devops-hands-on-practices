# Solution: Cache-Aside and TTL

The first request for a new product key should usually be a cache miss.

The second request for the same product key should usually be a cache hit while the TTL has not expired.

TTL is shown by:

```text
ttl_seconds
```

Simulated origin latency is shown by:

```text
origin_latency_ms
```

Most cache keys should have TTLs to limit stale data, avoid unbounded memory growth, and recover automatically from invalidation mistakes.

