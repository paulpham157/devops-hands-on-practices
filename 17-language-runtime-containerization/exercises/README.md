# Exercises: Python, Java Spring, Ruby, Go, and Rust Containers

Work through these exercises after reading the lesson README.

## Sections

1. `01-runtime-models`
   - Compare interpreted, JVM, and compiled runtime models.
   - Read Dockerfiles and identify caching, build, and runtime stages.
2. `02-build-and-run`
   - Build each service image and compare build behavior.
   - Run the services and test their shared HTTP contract.
3. `03-production-readiness`
   - Improve Docker layer caching and reason about image size.
   - Choose a runtime for practical service scenarios.
4. `04-container-hardening`
   - Review non-root runtime users.
   - Compare healthcheck and startup behavior across runtimes.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
./scripts/build-one.sh python-flask
docker compose up --build
./scripts/smoke-test.sh
./scripts/image-report.sh
docker compose down
```

Full image builds can take time because Java, Go, and Rust builder images are larger than the Python and Ruby examples.
