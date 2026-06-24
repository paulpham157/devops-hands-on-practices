# Build and Test a Docker Image

## Task

Modify the GitHub Actions workflow to add a second Docker tag:

```text
ci-platform-sample:latest
```

Then update the smoke test step to run the `latest` tag.

## Done When

The Docker job builds two tags and the smoke test passes using `ci-platform-sample:latest`.
