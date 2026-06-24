# Partitioning Large Datasets

1. Hash partitioning.
2. `customer_id`.
3. It can distribute customer writes across several partitions.
4. Large tenants can still create skew, and cross-customer analytics may require fan-out reads.
5. Range or time partitioning is often better when queries naturally scan time windows or ordered ranges.

