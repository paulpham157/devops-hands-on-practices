# Control Plane and Data Plane

The control plane distributes configuration, certificates, and policy.

The data plane handles actual request traffic and enforces policy in the path between services.

This separation matters because incidents can come from either layer:

- bad routing policy from the control plane
- overloaded or misconfigured proxies in the data plane

