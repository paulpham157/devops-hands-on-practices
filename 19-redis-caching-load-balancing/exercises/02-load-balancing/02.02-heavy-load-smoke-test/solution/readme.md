# Solution: Heavy Load Smoke Test

Exact numbers vary.

Expected pattern:

- a small number of initial misses.
- many hits after Redis has the key.
- traffic handled by more than one app instance.

Multiple misses can happen at the beginning because concurrent requests can all observe the key as missing before the first writer stores it. That is a cache stampede.

If every request used a random product ID, hit ratio would drop because fewer requests would reuse the same cache key.

