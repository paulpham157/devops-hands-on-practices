# Sidecar vs Embedded Logic

| Concern | Best Location |
| --- | --- |
| Domain-specific fraud scoring rules | App Code |
| Shared request proxy and telemetry | Sidecar or Helper |
| Business checkout validation | App Code |
| Secret refresh helper used by many services | Sidecar or Helper |

The rule is simple: domain decisions stay inside the app; repeated operational helpers can live beside it.

