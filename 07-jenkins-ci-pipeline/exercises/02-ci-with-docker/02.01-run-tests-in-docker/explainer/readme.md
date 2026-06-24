# Run Tests in Docker

CI should avoid "works on my machine" test environments.

This pipeline runs unit tests in a disposable Python container:

```text
docker run --rm python:3.12-slim ...
```

The app source is mounted into the test container. The test container installs dependencies, runs `pytest`, and compiles the app.

