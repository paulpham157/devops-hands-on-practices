# Orchestration and Dependencies

Pipelines need explicit dependency order.

Transformation should not publish before validation, and validation should not run before data is loaded.

This sequencing is part of pipeline correctness, not only convenience.

