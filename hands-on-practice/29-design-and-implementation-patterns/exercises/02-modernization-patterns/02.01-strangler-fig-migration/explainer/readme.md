# Strangler Fig Migration

Strangler Fig works by placing a stable entry point in front of the system and moving one capability at a time to new components.

This avoids a single risky rewrite cutover.

The pattern is strongest when routing and rollback can happen per capability.

