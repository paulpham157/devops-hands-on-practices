# When to Use Design Patterns

| Situation | Strong Fit? | Likely Pattern |
| --- | --- | --- |
| Legacy app must be replaced capability by capability | Yes | Strangler Fig |
| External system uses ugly field names that leak into domain code | Yes | Anti-Corruption Layer |
| Every service has custom log shipping code | Yes | Sidecar |
| Single small app has no migration or integration pressure | No | none yet |

Patterns should answer pressure, not decorate architecture.

