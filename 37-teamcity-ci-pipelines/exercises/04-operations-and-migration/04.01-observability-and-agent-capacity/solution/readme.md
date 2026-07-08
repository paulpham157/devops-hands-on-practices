# Observability and Agent Capacity

1. Docker-heavy workloads likely need a dedicated or larger pool.
2. Queue duration is the first operational signal because it reflects user-visible contention.
3. Separate pools prevent specialized workloads from starving or over-privileging the general fleet.
