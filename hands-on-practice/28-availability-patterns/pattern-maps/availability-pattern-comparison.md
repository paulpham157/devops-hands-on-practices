# Availability Pattern Comparison

| Pattern | Good Fit | Benefit | Main Cost |
| --- | --- | --- | --- |
| Health endpoint monitoring | instance routing and orchestration decisions | faster fault detection | shallow checks can mislead |
| Queue-based load leveling | bursty or asynchronous workloads | smoother downstream pressure | delayed completion and queue ops complexity |
| Throttling | overload protection and fairness | prevents collapse under spikes | some traffic is delayed or rejected |
| Graceful degradation | partial dependency failure | preserves core user value | user experience becomes reduced or stale |

