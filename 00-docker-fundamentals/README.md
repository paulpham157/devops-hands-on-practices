# Lesson 00: Docker Fundamentals

## Goal

Build a practical Docker baseline before moving into Compose, Kubernetes, CI/CD, and platform lessons.

By the end of this lesson, you should be able to:

- Explain image, container, registry, layer, tag, and Dockerfile.
- Build and run simple images locally.
- Read Dockerfiles and identify risky defaults.
- Compare single-stage, multi-stage, and distroless image patterns.
- Understand how layer ordering affects build cache.
- Run a disposable Linux VM for Docker practice when needed.

## Mental Model

```text
Dockerfile + app files -> image layers -> tagged image -> container process
```

Docker is not a VM manager. A container is a process with filesystem, network, and resource isolation. Images are immutable templates used to create containers.

## Lab Layout

```text
examples/lab-setup/                  Optional Vagrant Ubuntu VM for Docker practice
examples/docker-init/                Minimal Flask app for first Dockerfile experiments
examples/docker-image-examples/      NGINX, Flask, Node.js, Prometheus, Grafana, non-root examples
examples/images/                     Small image build examples
examples/multi-stage-builds/         Single-stage, multi-stage, and distroless Node.js builds
examples/optimize-docker-images/     Layer count and cache ordering examples
notes/                      Concept and production-readiness notes
scripts/                    Validation and helper scripts
exercises/                  Structured hands-on practice
```

Some examples are intentionally simple or old-fashioned so you can spot issues. For example, `ubuntu:latest` is useful for discussion, but production images should usually pin versions and minimize runtime packages.

## Prerequisites

Required:

- Docker Desktop or Docker Engine
- Docker Compose plugin for later lessons

Optional:

- Vagrant
- VirtualBox

Use Vagrant only if you want a disposable Linux VM. You can complete most of this lesson directly on your workstation.

## Quick Start

From this lesson directory:

```bash
./scripts/validate.sh
```

Build a basic NGINX image:

```bash
docker build -t docker-course/nginx-basic:local examples/docker-image-examples/nginx
```

Run it:

```bash
docker run --rm -p 8080:80 docker-course/nginx-basic:local
```

Open:

```text
http://localhost:8080
```

Stop the container with `Ctrl+C`.

## Optional Vagrant VM

Start the VM:

```bash
cd examples/lab-setup
vagrant up
vagrant ssh Docker
```

Inside the VM, check Docker:

```bash
docker version
docker run --rm hello-world
```

Stop the VM from `examples/lab-setup/`:

```bash
vagrant halt
```

Destroy local VM state:

```bash
vagrant destroy -f
```

## Core Commands

Inspect local Docker:

```bash
docker version
docker info
docker image ls
docker container ls -a
```

Build and tag:

```bash
docker build -t docker-course/python-flask:local examples/docker-image-examples/python-flask
```

Run in the background:

```bash
docker run -d --name flask-demo -p 8000:8000 docker-course/python-flask:local
curl http://localhost:8000
docker logs flask-demo
docker rm -f flask-demo
```

Compare image sizes:

```bash
./scripts/image-report.sh
```

## What To Look For

When reading a Dockerfile, check:

- Is the base image pinned intentionally?
- Are dependency files copied before application source to improve cache reuse?
- Does the final image contain build tools it does not need?
- Does the container run as root?
- Are secrets copied into the image?
- Is the exposed port documented?
- Is the startup command explicit?
- Can the image be rebuilt predictably?

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover lab orientation, building/running containers, Dockerfile review, cache and layer optimization, non-root runtime users, and distroless tradeoffs.

## Cleanup

Remove containers created by the examples:

```bash
docker rm -f nginx-basic flask-demo node-single node-multistage node-distroless 2>/dev/null || true
```

Remove lesson images:

```bash
docker image rm \
  docker-course/nginx-basic:local \
  docker-course/python-flask:local \
  docker-course/node-single:local \
  docker-course/node-multistage:local \
  docker-course/node-distroless:local 2>/dev/null || true
```

## References

- Docker overview: https://docs.docker.com/get-started/docker-overview/
- Dockerfile reference: https://docs.docker.com/reference/dockerfile/
- Build cache optimization: https://docs.docker.com/build/cache/optimize/
- Multi-stage builds: https://docs.docker.com/build/building/multi-stage/
- Docker image best practices: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
