# Run a Docker-in-Docker Job

## Task

Find the `build-image` job in:

```text
gitlab-ci/.gitlab-ci.yml
```

Add one command after `docker info` to print the Docker version:

```bash
docker version
```

Then run the pipeline in GitLab.

## Done When

The `build-image` job log shows both Docker client and server information, and the smoke test passes.
