# Partitioning Large Datasets

Partitioning spreads data and throughput across multiple partitions.

The partition key matters because it determines:

- write distribution
- read fan-out
- hot spot risk
- tenant isolation behavior

There is no universally good key. It must match access patterns.

