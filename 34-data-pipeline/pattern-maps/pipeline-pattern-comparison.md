# Data Pipeline Pattern Comparison

| Choice | Good Fit | Benefit | Main Cost |
| --- | --- | --- | --- |
| ETL | transform before loading | strict pre-load control | less raw data retained for later remodelling |
| ELT | warehouse or lakehouse-centric pipelines | preserve raw data and transform flexibly later | more responsibility in the target platform |
| Batch | periodic processing | simpler operations and cost control | data is stale between runs |
| Streaming | low-latency event flow | fresher outputs | more operational complexity |

