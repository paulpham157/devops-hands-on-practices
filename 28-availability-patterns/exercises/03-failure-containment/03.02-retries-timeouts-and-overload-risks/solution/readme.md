# Retries, Timeouts, and Overload Risks

1. They add more work to an already failing dependency.
2. Long waits hold resources open and delay recovery decisions.
3. Rising dependency latency, queue depth, error rate, or inflight request count.
4. Throttling limits retry storms and protects critical capacity.

