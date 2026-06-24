# Problem: Design Cache for Read-Heavy API

Design Redis caching for:

```text
Product catalog API
50 app replicas
Mostly reads
Product updates happen every few minutes
Traffic spikes during campaigns
Stale data up to 30 seconds is acceptable
```

Write:

1. Cache key format.
2. TTL.
3. Invalidation rule.
4. Stampede mitigation.
5. Metrics to monitor.

