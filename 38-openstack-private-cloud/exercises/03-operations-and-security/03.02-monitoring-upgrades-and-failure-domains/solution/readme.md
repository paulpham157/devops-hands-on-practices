# Monitoring, Upgrades, and Failure Domains

| Concern | Control Plane | Capacity | Failure Domain | Upgrade Planning |
| --- | --- | --- | --- | --- |
| message queue outage for API services | Yes | No | Yes | No |
| exhausted compute pool in one region | No | Yes | Yes | No |
| major release crossing database migrations | Yes | No | No | Yes |

Edge regions often have weaker links and smaller pools, so one local failure can strand workloads unless boundaries are designed deliberately.
