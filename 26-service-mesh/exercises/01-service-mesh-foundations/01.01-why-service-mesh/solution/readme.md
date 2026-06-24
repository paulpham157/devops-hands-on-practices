# Why Service Mesh

| Problem | Strong Fit? | Reason |
| --- | --- | --- |
| Team wants uniform mTLS between dozens of services | Yes | mesh identity and encryption are core use cases |
| Team wants richer east-west traffic visibility | Yes | telemetry is one of the main mesh benefits |
| Team wants to avoid writing business logic | No | a mesh does not replace application logic |
| Team wants weighted canary rollout between service versions | Yes | traffic management is a common mesh capability |
| Team only runs one simple monolith | No | the operational cost is unlikely to pay off |

