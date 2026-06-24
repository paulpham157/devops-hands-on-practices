# Control Plane and Data Plane

| Responsibility | Layer |
| --- | --- |
| Distribute mTLS certificates | Control plane |
| Intercept request traffic between services | Data plane |
| Enforce retry and timeout policy during a request | Data plane |
| Publish routing configuration to proxies | Control plane |
| Emit request telemetry from the traffic path | Data plane |

Both layers matter because broken policy distribution and broken traffic enforcement can cause different failure modes with similar symptoms.

