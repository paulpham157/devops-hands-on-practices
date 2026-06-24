# Latency, Security, and Failure Modes

1. The client makes fewer round trips, but the gateway now performs fan-out work itself.
2. Direct access must be limited so leaked tokens do not become broad long-lived access paths.
3. The application may look healthy while outbound helper behavior is failing.
4. Routing, auth, validation, compression, and aggregation in one place can create a hot boundary component.

