# Pattern Comparison

| Pattern | Good Fit | Benefit | Main Cost |
| --- | --- | --- | --- |
| Strangler Fig | risky legacy replacement with incremental cutover | migrate capability by capability | coexistence and routing complexity |
| Sidecar | repeated cross-cutting runtime concerns | keep helper behavior outside app binary | extra component lifecycle and resource overhead |
| Anti-Corruption Layer | external model is awkward or legacy-heavy | protect internal domain language | more adapter and mapping code |

