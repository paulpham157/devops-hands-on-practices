# Explainer: Test the HTTP Contract

Every service in this lesson has the same HTTP contract:

```text
GET /
GET /healthz
GET /work
```

This makes different runtimes easier to compare because the behavior is similar.

The smoke test checks:

- health endpoint returns successfully.
- root endpoint includes the service name.
- work endpoint includes `elapsed_ms`.

