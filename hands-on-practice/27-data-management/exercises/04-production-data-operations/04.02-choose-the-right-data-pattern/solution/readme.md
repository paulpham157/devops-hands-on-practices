# Choose the Right Data Pattern

1. CQRS. Tradeoff: read model synchronization delay and more components.
2. Saga. Tradeoff: compensation logic and partial failure recovery are complex.
3. Event sourcing. Tradeoff: schema evolution, replay, and debugging are harder.
4. Partitioning. Tradeoff: hot partitions and rebalance strategy must be managed.

The wrong pattern is often choosing the most advanced one before the system has earned the complexity.

