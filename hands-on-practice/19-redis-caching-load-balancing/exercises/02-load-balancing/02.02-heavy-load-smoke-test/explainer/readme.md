# Explainer: Heavy Load Smoke Test

The load test sends many concurrent requests through NGINX.

It records JSON responses in:

```text
reports/
```

The report lets you inspect:

- cache hits
- cache misses
- which backend instance handled requests
- response latency

This is not a full benchmark. It is a controlled training smoke test.

