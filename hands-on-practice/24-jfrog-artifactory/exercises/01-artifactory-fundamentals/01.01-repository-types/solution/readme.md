# Repository Types

| Repository | Type | Why |
| --- | --- | --- |
| `docker-dev-local` | Local | Internal CI publishes development images there |
| `dockerhub-remote` | Remote | It proxies and caches Docker Hub |
| `docker-virtual` | Virtual | It aggregates local and remote Docker repositories |
| `maven-release-federated` | Federated | It syncs release artifacts across sites |

Answers:

1. Developers should normally use virtual repositories.
2. Remote repositories reduce dependency on external registries by caching.
3. Local repositories store artifacts your organization creates.

