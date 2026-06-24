# Backpressure Notes

Backpressure means the system pushes capacity limits outward instead of pretending every request can be served immediately.

Good backpressure behavior usually includes:

- bounded queues
- concurrency limits
- explicit rejection or delay
- client-visible retry guidance

Without backpressure, overload spreads from one component to many.

