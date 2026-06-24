# Managed Kubernetes vs Managed Containers

Managed Kubernetes platforms expose the Kubernetes API as the workload contract.

Managed container services expose a provider-specific API for tasks or services instead.

This is the first platform decision:

- standardize on Kubernetes abstractions
- or use a simpler cloud-specific container service

Portability, team skill, and platform ownership all follow from that choice.

