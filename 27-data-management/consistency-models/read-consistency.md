# Read Consistency Notes

Distributed systems often trade strict freshness for scale and availability.

Common expectations:

- strong read-after-write: the next read must reflect the write
- eventual consistency: replicas or projections catch up asynchronously
- session consistency: a user sees their own writes within a session

The application must state these guarantees clearly. Hidden inconsistency becomes an incident source.

