# Run a Docker-in-Docker Job

Update the `before_script`:

```yaml
before_script:
  - docker info
  - docker version
```

Expected behavior:

- `docker info` proves the job can reach the daemon.
- `docker version` prints client and server versions.
- `docker build` creates the app image.
- `docker exec` checks `/healthz`.

If the job cannot connect to Docker, the runner may not support privileged Docker-in-Docker.
