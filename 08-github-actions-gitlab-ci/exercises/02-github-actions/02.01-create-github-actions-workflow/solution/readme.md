# Create a GitHub Actions Workflow

The workflow should be copied to:

```text
.github/workflows/python-docker-ci.yml
```

Expected workflow shape:

```text
on push and pull_request
test job on ubuntu-latest
docker job needs test
pytest report uploaded as an artifact
```

If the workflow does not start, check:

- The file is inside `.github/workflows/`.
- The file extension is `.yml` or `.yaml`.
- The branch or pull request matches the `on` trigger.
- The repository has GitHub Actions enabled.
