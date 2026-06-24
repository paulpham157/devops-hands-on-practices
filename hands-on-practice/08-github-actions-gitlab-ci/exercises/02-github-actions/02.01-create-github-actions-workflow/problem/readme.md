# Create a GitHub Actions Workflow

## Task

Copy the sample workflow into a GitHub repository:

```bash
mkdir -p .github/workflows
cp hands-on-practice/08-github-actions-gitlab-ci/github-actions/workflows/python-docker-ci.yml .github/workflows/python-docker-ci.yml
```

Commit and push to a branch.

Then open the GitHub Actions run and inspect:

- The `test` job.
- The uploaded `pytest-results` artifact.
- The `docker` job.

## Done When

The workflow run is green and the test report artifact exists.
