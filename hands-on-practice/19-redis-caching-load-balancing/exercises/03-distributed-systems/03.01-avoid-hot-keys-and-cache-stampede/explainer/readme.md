# Explainer: Hot Keys and Cache Stampede

A hot key is a cache key receiving a very large share of traffic.

Risks:

- one Redis node or shard becomes overloaded.
- one expired key causes many origin requests.
- one popular item creates uneven traffic.

Cache stampede happens when many requests miss the same key at the same time.

Mitigations:

- TTL jitter
- request coalescing
- distributed lock around origin fetch
- stale-while-revalidate
- background refresh
- rate limiting

