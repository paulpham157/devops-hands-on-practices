# Choose the Right Design Pattern

1. Strangler Fig. Tradeoff: temporary coexistence and routing complexity.
2. Anti-Corruption Layer. Tradeoff: more translation and adapter code to own.
3. Sidecar. Tradeoff: extra runtime component lifecycle and monitoring.
4. No sidecar or ACL here; keep it in app code. Tradeoff: less reuse, but correct ownership of domain logic.

The wrong pattern is usually the one that hides ownership instead of clarifying it.

