# Dockerfile Review Checklist

Use this checklist when reviewing Dockerfiles in this lesson and later labs.

## Base Image

- Prefer explicit versions over floating tags such as `latest`.
- Use slim or minimal runtime images when they fit the workload.
- Keep build tooling out of the final runtime image.
- Understand the maintenance model of the base image.

## Build Cache

- Copy dependency manifests before application source.
- Install dependencies in a deterministic step.
- Avoid invalidating dependency layers for every source change.
- Use BuildKit cache mounts when appropriate.

## Runtime Safety

- Run as a non-root user when the application allows it.
- Avoid copying credentials, tokens, `.env`, SSH keys, and cloud config into images.
- Expose only the application port.
- Use explicit startup commands.

## Size and Reproducibility

- Remove package-manager caches in the same layer where packages are installed.
- Avoid installing debug tools in production runtime images.
- Prefer multi-stage builds for compiled or bundled applications.
- Tag images with meaningful versions in CI/CD.

## Operations

- Know how to inspect logs.
- Know how to exec into debug-friendly images.
- For distroless images, plan debugging through logs, metrics, sidecars, ephemeral debug containers, or a separate debug image.
