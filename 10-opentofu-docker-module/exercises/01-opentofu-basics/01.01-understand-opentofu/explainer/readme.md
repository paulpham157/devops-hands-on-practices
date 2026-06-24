# Explainer: Understand OpenTofu

OpenTofu turns HCL configuration into infrastructure changes.

The basic loop is:

```text
write configuration -> init providers -> plan changes -> apply changes -> inspect state -> destroy when done
```

In this lab, the infrastructure is local Docker:

- The Docker provider talks to the Docker API.
- `docker_image` pulls an Nginx image.
- `docker_container` creates a container from that image.
- State records which real Docker objects belong to this configuration.

OpenTofu does not just run shell commands. It builds a dependency graph, compares configuration with state and real resources, then proposes a plan.
