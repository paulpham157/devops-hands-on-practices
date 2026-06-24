# Exercises: Python, Java Spring, Ruby, Go, and Rust Containers

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-runtime-models/01.01-compare-language-runtimes`
   - Compare interpreted, JVM, and compiled runtime models.

2. `01-runtime-models/01.02-read-dockerfiles`
   - Read the Dockerfiles and identify caching, build, and runtime stages.

3. `02-build-and-run/02.01-build-five-images`
   - Build each service image and compare build behavior.

4. `02-build-and-run/02.02-test-http-contract`
   - Run the services and test their shared HTTP contract.

5. `03-production-readiness/03.01-optimize-cache-and-size`
   - Improve Docker layer caching and reason about image size.

6. `03-production-readiness/03.02-choose-runtime-for-a-service`
   - Choose a runtime for practical service scenarios.

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

