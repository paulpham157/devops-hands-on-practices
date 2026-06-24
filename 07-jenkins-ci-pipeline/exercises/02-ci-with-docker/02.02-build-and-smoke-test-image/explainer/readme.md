# Build and Smoke Test an Image

Unit tests prove code behavior. A smoke test proves the packaged image can start and answer a basic health check.

This lesson builds a Docker image and runs it:

```text
docker build -> docker run -> check /healthz -> docker rm
```

Smoke tests should be small and fast. They are not a replacement for full integration tests.

