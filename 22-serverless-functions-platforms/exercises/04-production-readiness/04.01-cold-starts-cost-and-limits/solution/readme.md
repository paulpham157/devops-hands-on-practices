# Solution: Cold Starts, Cost, and Limits

Cold starts happen when the platform initializes a new function instance.

Mitigations:

- reduce dependencies and package size.
- use lighter runtimes.
- avoid heavy initialization.
- use provisioned or reserved concurrency when available.

Cost dimensions include invocations, duration, memory or CPU allocation, data transfer, logs, and downstream services.

Excessive logging can become expensive because logs are stored, indexed, queried, and retained.

Long-running jobs are often a poor fit because functions have timeouts and synchronous clients should not wait for slow background work.

