# BFF Ownership and Bounded Context

BFF works best when its ownership matches the client boundary.

That usually means:

- web team owns web BFF
- mobile team owns mobile BFF
- domain teams own domain APIs and business rules

This keeps the orchestration layer close to the client experience it serves.

