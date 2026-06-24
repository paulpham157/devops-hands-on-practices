# Solution: Compare Dockerfiles

One possible comparison:

| File | Base image | Runs as root? | Package cleanup? | Cache-friendly? | Main risk |
| --- | --- | --- | --- | --- | --- |
| `examples/docker-image-examples/nginx/Dockerfile` | `ubuntu:latest` | Yes | No | Low | Floating tag, root runtime, package cache |
| `examples/docker-image-examples/nonroot-user/Dockerfile` | `ubuntu:latest` | No | Yes | Medium | Floating tag and broad filesystem ownership changes |
| `examples/docker-image-examples/python-flask/Dockerfile` | `python:3.12-slim` via ARG | No | Uses pip cache mount | High | Requires BuildKit for cache/bind mount syntax |

Reasonable answers:

1. Easiest to understand: NGINX example.
2. Safer at runtime: Python Flask or non-root NGINX because they use a non-root user.
3. Uses BuildKit features: Python Flask.
4. Improve first: basic NGINX because it uses `ubuntu:latest`, installs packages without cleanup, and runs as root.
