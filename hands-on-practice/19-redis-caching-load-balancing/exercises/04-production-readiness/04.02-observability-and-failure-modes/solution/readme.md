# Solution: Observability and Failure Modes

If Redis is down but origin is available, the app should still answer by using origin, but latency will increase and cache hit ratio will drop.

If one app instance fails, the load balancer should route traffic to healthy instances.

Cache effectiveness metrics:

- hit ratio
- miss rate
- origin request rate
- response latency

Redis memory pressure metrics:

- used memory
- maxmemory
- evictions
- rejected writes
- key count

Retries can make an outage worse because they multiply traffic against already slow or failing backends.

