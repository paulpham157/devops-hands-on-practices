# Problem: Cache and Layers

Read:

```text
examples/optimize-docker-images/minimising-layers-count/Dockerfile1
examples/optimize-docker-images/minimising-layers-count/Dockerfile2
examples/optimize-docker-images/caching/Dockerfile3
examples/optimize-docker-images/caching/Dockerfile4
```

Answer:

1. Which Dockerfile has more layers than necessary?
2. Which Dockerfile improves package cleanup?
3. Which Dockerfile is more cache-friendly for dependency installation?
4. What change would cause the dependency layer to rebuild?

Optional: build the examples and inspect history:

```bash
docker build -t docker-course/layer-demo:1 -f examples/optimize-docker-images/minimising-layers-count/Dockerfile1 examples/optimize-docker-images/minimising-layers-count
docker history docker-course/layer-demo:1
```
