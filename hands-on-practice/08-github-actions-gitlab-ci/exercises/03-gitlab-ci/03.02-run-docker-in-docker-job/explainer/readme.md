# Run a Docker-in-Docker Job

GitLab CI jobs run inside runner-managed environments.

To run Docker commands from a job, the runner must support Docker access. One common lab pattern is Docker-in-Docker:

```text
job container -> docker CLI
service container -> docker daemon
```

The sample uses:

```yaml
image: docker:28.5-cli
services:
  - name: docker:28.5-dind
```

This requires a privileged runner. Treat it as powerful infrastructure access.
