# Sidecar for Cross-Cutting Concerns

Sidecars are useful when many services need the same helper behavior but that behavior is not core business logic.

Typical sidecar concerns:

- proxying
- log forwarding
- config sync
- secret refresh

This keeps runtime behavior standardized across workloads.

