# Explainer: Observability and Failure Modes

Caching and load balancing need metrics.

Watch:

- cache hit ratio
- cache miss rate
- Redis command latency
- Redis memory usage
- Redis evictions
- backend request rate
- backend latency
- load balancer 5xx responses
- origin latency

Failure modes:

- Redis down
- backend instance down
- origin slow
- memory full
- hot key overload
- load balancer retry storm

