# Ingress, Egress, and Boundaries

| Pattern | Classification |
| --- | --- |
| Gateway Routing | Mostly Ingress |
| Gatekeeper | Mostly Ingress |
| Ambassador | Mostly Egress |
| Valet Key | Direct Access Delegation |

Mixing them carelessly creates unclear ownership, harder debugging, and boundary components that do too many unrelated jobs.

