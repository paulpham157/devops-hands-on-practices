# Problem: Distroless Tradeoffs

Read:

```text
examples/multi-stage-builds/Dockerfile1
examples/multi-stage-builds/Dockerfile2
examples/multi-stage-builds/Dockerfile3
```

Answer:

1. Which Dockerfile is single-stage?
2. Which Dockerfile separates build and runtime images?
3. Which Dockerfile uses a distroless runtime?
4. Why might `docker exec -it <container> sh` fail in the distroless image?
5. What debugging strategy would you use instead?

Optional builds:

```bash
docker build -t docker-course/node-single:local -f examples/multi-stage-builds/Dockerfile1 examples/multi-stage-builds
docker build -t docker-course/node-multistage:local -f examples/multi-stage-builds/Dockerfile2 examples/multi-stage-builds
docker build -t docker-course/node-distroless:local -f examples/multi-stage-builds/Dockerfile3 examples/multi-stage-builds
./scripts/image-report.sh
```
