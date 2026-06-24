# Explainer: Regions, Zones, and Resource Hierarchy

Cloud resources are organized by ownership and location.

Ownership hierarchy controls billing, access, policy, and isolation.

Location controls latency, availability, data residency, and disaster recovery.

Common location terms:

- region: geographic area
- availability zone or zone: isolated datacenter area inside a region
- global service: not tied to one region

Do not design production workloads without deciding account/project/subscription and region strategy first.

