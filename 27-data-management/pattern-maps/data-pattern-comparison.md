# Data Pattern Comparison

| Pattern | Good Fit | Benefit | Main Cost |
| --- | --- | --- | --- |
| Database per service | microservices with clear domain ownership | loose coupling and autonomy | cross-service joins become harder |
| API composition | read views assembled from several services | avoids shared database | latency and partial failure handling |
| CQRS | read-heavy systems with different query needs | read scaling and tailored projections | synchronization delay and more components |
| Event sourcing | audit-heavy domains and replay needs | full history and reconstructable state | event schema and replay complexity |
| Saga | multi-service business workflows | local transactions without distributed lockstep | compensation and failure recovery complexity |
| Partitioning | high-scale datasets and throughput | better scale and isolation | hot keys and rebalance work |

