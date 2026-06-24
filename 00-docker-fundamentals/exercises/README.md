# Exercises: Docker Fundamentals

Work through these exercises after reading the lesson README.

Each exercise has:

- `explainer/readme.md`: concept notes before doing the task.
- `problem/readme.md`: task instructions and verification commands.
- `solution/readme.md`: one possible solution and expected output.

## Exercise Map

1. `01-docker-basics/01.01-map-the-lab`
   - Identify the purpose of each folder and connect examples to Docker concepts.

2. `01-docker-basics/01.02-build-and-run-nginx`
   - Build, run, inspect, and clean up a simple NGINX container.

3. `02-dockerfile-quality/02.01-compare-dockerfiles`
   - Compare Dockerfiles and identify versioning, package, user, and runtime risks.

4. `02-dockerfile-quality/02.02-cache-and-layers`
   - Reason about layer count, package cleanup, and dependency-cache ordering.

5. `03-runtime-hardening/03.01-non-root-containers`
   - Verify which images run as root and which run as a dedicated user.

6. `03-runtime-hardening/03.02-distroless-tradeoffs`
   - Compare regular and distroless runtime images and explain debugging tradeoffs.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
docker build -t docker-course/nginx-basic:local examples/docker-image-examples/nginx
docker run --rm -p 8080:80 docker-course/nginx-basic:local
./scripts/image-report.sh
```

Build-heavy exercises can pull large base images. If you only want the reading path, complete the comparison tasks without running every image.
