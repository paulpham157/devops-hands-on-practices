# Exercises: GitHub Actions and GitLab CI

## Sections

1. `01-ci-platform-basics`
   - Read pipeline configuration.
   - Run CI behavior locally with Docker.

2. `02-github-actions`
   - Create a GitHub Actions workflow.
   - Build and smoke-test a Docker image in GitHub Actions.

3. `03-gitlab-ci`
   - Create a GitLab CI pipeline.
   - Use Docker-in-Docker for image builds.

4. `04-ci-hardening`
   - Use artifacts, cache, rules, permissions, and secrets safely.

## Suggested Flow

Start with the local script. Then read the GitHub Actions and GitLab CI YAML files side by side.

```text
local commands -> GitHub Actions -> GitLab CI -> hardening
```

## Completion Target

By the end, you should be able to explain:

- How a CI trigger starts a pipeline.
- How jobs are ordered.
- How test results and build artifacts are retained.
- How Docker images are built in hosted CI.
- Why secrets and Docker runner privileges need careful handling.
