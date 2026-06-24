# Anti-Corruption Layer Integration

1. `txn_state`.
2. The adapter should translate fields and enums, then validate against internal domain rules.
3. They pollute the core domain with external assumptions and make later change harder.
4. Translation drift and inconsistent behavior across integrations.

