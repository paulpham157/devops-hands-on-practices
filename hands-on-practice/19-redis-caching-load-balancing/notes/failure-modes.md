# Failure Modes

## Redis Down

Expected behavior:

- app should still answer if origin is available.
- cache hit rate drops to zero.
- origin latency becomes visible.
- error counters should increase.

Bad behavior:

- every request fails because cache is unavailable.
- retries create a storm against Redis.
- app opens too many Redis connections.

## Origin Slow

Expected behavior:

- cached keys remain fast.
- cache misses are slow.
- load balancer should respect timeouts.

Bad behavior:

- cache stampede overloads origin.
- load balancer retries make overload worse.

## Backend App Unhealthy

Expected behavior:

- load balancer stops sending traffic to failed backend after failure threshold.
- healthy backends continue serving.

Bad behavior:

- no health checks.
- sticky sessions pin users to bad backend.
- retries hide partial outage until all backends are overloaded.

## Redis Memory Full

Expected behavior depends on policy:

- `allkeys-lru` evicts least recently used keys from all keys.
- `volatile-lru` only evicts keys with TTL.
- `noeviction` returns errors on writes when memory is full.

Choose the policy based on whether Redis is cache-only or used for other data.

