# Avoid Shared General-Purpose BFF

1. The clients are still similar and mostly need generic routing.
2. It adds another backend layer without solving a real client mismatch.
3. Clients diverge materially in payload, latency, auth, or ownership needs.

