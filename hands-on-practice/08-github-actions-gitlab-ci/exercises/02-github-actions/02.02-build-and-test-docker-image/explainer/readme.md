# Build and Test a Docker Image

The GitHub Actions workflow builds the image with Docker Buildx.

The important setting for a smoke test is:

```text
load: true
```

That loads the image into the runner's Docker daemon, so the next shell step can run:

```text
docker run
docker exec
```

Without `load: true`, the image may be built by BuildKit but not available to a later `docker run` command on the runner.
