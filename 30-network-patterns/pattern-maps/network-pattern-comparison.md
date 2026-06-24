# Network Pattern Comparison

| Pattern | Good Fit | Benefit | Main Cost |
| --- | --- | --- | --- |
| Ambassador | shared outbound access to external systems | centralize auth, retries, and protocol handling | helper ownership and extra hop |
| Gateway Routing | many entry paths to different backends | clear ingress routing control | routing layer becomes critical dependency |
| Gateway Aggregation | client would otherwise call many backends | fewer client round trips | fan-out failure handling and edge complexity |
| Gateway Offloading | shared edge concerns like TLS or compression | simpler backend services | more responsibility at gateway |
| Gatekeeper | protect sensitive services from invalid traffic | reject bad requests early | policy drift if rules are unclear |
| Valet Key | client needs direct but limited resource access | lower backend bandwidth and latency | token scope and expiry management |
| Static Content Hosting | static assets do not need app compute | cheaper and faster delivery | separate cache and deployment coordination |

