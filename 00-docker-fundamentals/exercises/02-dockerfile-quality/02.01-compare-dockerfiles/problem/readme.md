# Problem: Compare Dockerfiles

Read these files:

```text
examples/docker-image-examples/nginx/Dockerfile
examples/docker-image-examples/nonroot-user/Dockerfile
examples/docker-image-examples/python-flask/Dockerfile
```

Create a comparison table with:

| File | Base image | Runs as root? | Package cleanup? | Cache-friendly? | Main risk |
| --- | --- | --- | --- | --- | --- |

Then answer:

1. Which Dockerfile is easiest to understand?
2. Which Dockerfile is safer at runtime?
3. Which Dockerfile uses BuildKit features?
4. Which Dockerfile would you improve first before production use?
