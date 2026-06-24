# Strangler Fig Migration

1. `/checkout`.
2. Any path not explicitly moved, including `/`.
3. It routes the affected capability back to legacy when the new service health fails.
4. Each capability can migrate and rollback independently.
5. Dual routing, coexistence monitoring, and temporary split ownership.

