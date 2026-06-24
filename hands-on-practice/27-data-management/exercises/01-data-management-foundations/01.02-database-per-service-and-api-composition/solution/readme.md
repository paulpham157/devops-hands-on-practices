# Database per Service and API Composition

1. Shared databases create tighter coupling and make service autonomy weaker.
2. API composition combines data from multiple service owners into one read response.
3. Higher latency and more partial failure handling.
4. When the read is frequent, predictable, and can tolerate asynchronous synchronization.

