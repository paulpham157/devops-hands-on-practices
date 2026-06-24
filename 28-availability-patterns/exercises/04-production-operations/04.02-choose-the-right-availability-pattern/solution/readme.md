# Choose the Right Availability Pattern

1. Throttling, often paired with queueing. Tradeoff: some traffic is delayed or rejected.
2. Health endpoint monitoring with readiness failure. Tradeoff: traffic routing becomes dependent on accurate health policy.
3. Graceful degradation. Tradeoff: users receive reduced functionality.
4. Queue-based load leveling. Tradeoff: completion becomes asynchronous and backlog must be managed.

The best availability pattern is often a combination, not a single mechanism.

