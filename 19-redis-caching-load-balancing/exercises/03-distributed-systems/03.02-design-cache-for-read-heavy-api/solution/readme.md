# Solution: Design Cache for Read-Heavy API

One reasonable design:

```text
cache key: product:v1:<product_id>
TTL: 30 seconds plus small jitter
```

Invalidation:

- delete `product:v1:<product_id>` after product update.
- optionally publish invalidation events from the write path.

Stampede mitigation:

- Redis lock per product key during refresh.
- serve stale value briefly if refresh is in progress.
- background refresh for campaign hot products.

Metrics:

- hit ratio
- miss rate
- origin latency
- Redis latency
- Redis memory
- evictions
- hot key frequency
- app error rate

