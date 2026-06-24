# Explainer: Cache-Aside and TTL

Cache-aside means the application checks Redis before calling the slow origin.

Flow:

```text
GET key from Redis
if found: return cached value
if missing: fetch from origin, SET key with TTL, return value
```

TTL means time to live. It prevents cache entries from staying forever.

TTL is a tradeoff:

- longer TTL improves hit ratio.
- shorter TTL reduces stale-data risk.

