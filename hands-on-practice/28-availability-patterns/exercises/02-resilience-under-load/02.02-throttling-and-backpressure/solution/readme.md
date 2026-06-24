# Throttling and Backpressure

1. `429`.
2. `retry_after_seconds: 10`.
3. Payment latency above 800 ms.
4. They prevent infinite buffering and expose when the system is beyond safe capacity.
5. Unbounded inflight work can exhaust threads, memory, and dependency pools, turning slowdown into collapse.

