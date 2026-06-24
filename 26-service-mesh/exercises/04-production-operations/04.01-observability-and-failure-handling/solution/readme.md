# Observability and Failure Handling

1. `retries` and `timeout`.
2. Excessive retries can amplify load and make failures worse.
3. A mesh can expose request-level telemetry consistently across services even when application instrumentation differs.
4. Because proxies are now part of the request path and can create or surface their own failure modes.

