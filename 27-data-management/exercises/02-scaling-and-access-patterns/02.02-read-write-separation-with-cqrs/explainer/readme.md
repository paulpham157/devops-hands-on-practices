# Read-Write Separation with CQRS

CQRS separates command handling from query handling.

This is not automatically event sourcing. CQRS can exist with ordinary write storage and a separate read model.

Use CQRS when the read side and write side have different scale or modeling needs.

