# Solution: Avoid Hot Keys and Cache Stampede

A hot key is a key that receives a disproportionate amount of traffic.

A cache stampede is when many requests miss the same key at the same time and all hit the origin.

TTL expiry can cause a spike because many clients may need the same expired value at once.

Mitigations:

- add TTL jitter.
- use a short distributed lock around origin refresh.
- serve stale data while one request refreshes.
- refresh popular keys in the background.
- rate limit expensive misses.

For this demo app, a good first improvement is TTL jitter plus a short Redis lock around the origin lookup.

