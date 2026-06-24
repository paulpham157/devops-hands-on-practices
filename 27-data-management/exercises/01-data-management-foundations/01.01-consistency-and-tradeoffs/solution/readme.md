# Consistency and Tradeoffs

| Requirement | Consistency | Reason |
| --- | --- | --- |
| Payment must not be double-captured | Strong immediate consistency | critical financial invariant |
| Customer dashboard can lag by a few seconds | Eventual consistency | read freshness is less critical than write correctness |
| Inventory availability must avoid overselling | Strong immediate consistency around reservation rules | inventory invariant matters |
| Search index can catch up asynchronously | Eventual consistency | search views are commonly projection-based |

Immediate global freshness is expensive because it increases coordination, latency, and failure sensitivity across distributed components.

