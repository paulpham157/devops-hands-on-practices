# Solution: Distroless Tradeoffs

Expected answers:

1. Single-stage: `examples/multi-stage-builds/Dockerfile1`
2. Multi-stage: `examples/multi-stage-builds/Dockerfile2`
3. Distroless runtime: `examples/multi-stage-builds/Dockerfile3`
4. `docker exec -it <container> sh` can fail because distroless images usually do not include a shell.
5. Use application logs, health endpoints, metrics/traces, a debug variant image, or platform-level debug tools.

The goal is to understand the operational tradeoff. Smaller images are useful only when the team can still observe and debug the service.
