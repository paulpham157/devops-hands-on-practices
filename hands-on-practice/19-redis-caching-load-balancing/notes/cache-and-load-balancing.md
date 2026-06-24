# Cache and Load Balancing Notes

Redis caching and load balancing solve different parts of the scaling problem.

## Redis Cache

Redis helps when many requests read the same data.

Good cache candidates:

- product catalog entries
- feature flags
- computed summaries
- session lookup data with explicit expiry
- rate-limit counters

Poor cache candidates:

- data that must always be strongly consistent
- secrets without strict access controls
- write-heavy records with complex invalidation
- source-of-truth records without persistence elsewhere

## Cache-Aside

Cache-aside keeps cache logic in the application:

```text
read cache -> miss -> read origin -> write cache with TTL -> return
```

This is simple, but every app instance must agree on key names, TTL, and invalidation rules.

## Load Balancing

Load balancing spreads requests across app replicas.

Common strategies:

| Strategy | Meaning |
| --- | --- |
| round-robin | each backend gets requests in sequence |
| least connections | send to backend with fewest active connections |
| ip hash | keep same client IP on same backend |

For stateless apps, avoid sticky sessions unless required.

## Heavy Load Risks

Under high traffic:

- hot keys can overload one Redis shard.
- cache misses can overload the origin.
- simultaneous expiry can cause stampede.
- load balancer retries can multiply traffic.
- connection pools can saturate Redis.
- slow backends can hold load balancer connections.

Mitigations:

- TTL jitter
- request coalescing
- background refresh
- circuit breakers
- rate limiting
- backpressure
- read replicas where appropriate
- sharding or Redis Cluster for large scale

