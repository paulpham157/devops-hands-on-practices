# Lesson 08: GitHub Actions and GitLab CI

## Goal

Build CI pipelines for a small Flask app using GitHub Actions and GitLab CI.

This lesson teaches:

- CI pipeline concepts across hosted CI platforms
- GitHub Actions workflow files, jobs, steps, artifacts, and Docker image builds
- GitLab CI stages, jobs, artifacts, cache, rules, and Docker-in-Docker
- How to keep CI behavior close to local Docker commands
- Where GitHub Actions, GitLab CI, and Jenkins differ in real projects

## Navigation

- Previous lesson: `07-jenkins-ci-pipeline`
- Next lesson: `09-k3s-local-cluster`

## Related Lessons

- `07-jenkins-ci-pipeline`
- `11-devsecops-container-pipeline`
- `37-teamcity-ci-pipelines`

## Prerequisites and Entry Check

- Completion of `07-jenkins-ci-pipeline`, or equivalent ability to read a CI pipeline and run local tests.
- Docker Engine and Python available for the local simulation; GitHub/GitLab accounts are optional.

Entry check: identify the difference between a workflow, job, step, artifact, and a secret in CI configuration.

## Why These Platforms

GitHub Actions and GitLab CI are CI/CD systems built into source control platforms.

Jenkins usually runs as infrastructure you operate. GitHub Actions and GitLab CI usually start from a YAML file committed to the repository, and the platform schedules jobs on managed or self-hosted runners.

Use this lesson after the Jenkins lesson to compare three CI models:

| Platform | Pipeline file | Runner model | Common fit |
|---|---|---|---|
| Jenkins | `Jenkinsfile` | You operate controller and agents | Highly customized enterprise CI |
| GitHub Actions | `.github/workflows/*.yml` | GitHub-hosted or self-hosted runners | GitHub repositories, PR checks, package publishing |
| GitLab CI | `.gitlab-ci.yml` | GitLab shared, project, group, or self-managed runners | GitLab repositories, integrated CI/CD and container registry |

## Lesson Layout

```text
08-github-actions-gitlab-ci/
├── github-actions/workflows/
│   ├── python-docker-ci.yml
│   └── publish-ghcr.yml
├── gitlab-ci/
│   └── .gitlab-ci.yml
├── sample-app/
│   ├── Dockerfile
│   ├── app.py
│   ├── requirements.txt
│   ├── requirements-dev.txt
│   └── tests/test_app.py
├── scripts/run-local-ci.sh
└── exercises/
```

The workflow files are stored inside the lesson directory so they do not accidentally enable CI for this repository. When practicing in a real GitHub or GitLab repository, copy them to the platform's expected location.

## Sample App

Run the Python tests locally:

```bash
cd 08-github-actions-gitlab-ci/sample-app
python3 -m pip install -r requirements-dev.txt
python3 -m pytest -q
```

Build and run the image:

```bash
docker build -t docker-course/ci-platform-sample:local .
docker run --rm -p 5000:5000 docker-course/ci-platform-sample:local
```

Check the health endpoint:

```bash
curl http://localhost:5000/healthz
```

## Local CI Simulation

Run the main CI behavior without GitHub or GitLab:

```bash
cd 08-github-actions-gitlab-ci
./scripts/run-local-ci.sh
```

The script runs:

1. Python tests in a disposable `python:3.12-slim` container.
2. Docker image build.
3. Smoke test against `/healthz`.

This mirrors the core work done by both CI platform examples.

## GitHub Actions Practice

Copy the workflow into a GitHub repository:

```bash
mkdir -p .github/workflows
cp 08-github-actions-gitlab-ci/github-actions/workflows/python-docker-ci.yml .github/workflows/python-docker-ci.yml
```

Commit and push. The workflow runs on pushes and pull requests.

The workflow does two jobs:

1. `test`: install Python dependencies, run pytest, upload a JUnit test report.
2. `docker`: build the image, load it into the runner, and run a smoke test.

The optional publishing example is:

```text
github-actions/workflows/publish-ghcr.yml
```

Use it only when you want to publish tagged releases to GitHub Container Registry.

## GitLab CI Practice

Copy the GitLab CI file into a GitLab repository:

```bash
cp 08-github-actions-gitlab-ci/gitlab-ci/.gitlab-ci.yml .gitlab-ci.yml
```

Commit and push. The pipeline runs on branches and merge requests.

The GitLab CI file does three things:

1. Runs Python tests with cache and a JUnit artifact.
2. Builds and smoke-tests the Docker image with Docker-in-Docker.
3. Optionally publishes to the GitLab Container Registry on the default branch.

## Security Notes

- Do not put secrets directly in YAML.
- Use GitHub repository or environment secrets for GitHub Actions.
- Use GitLab CI/CD variables for GitLab CI.
- Docker-in-Docker requires a privileged runner. Use it only on runners you trust.
- Prefer short-lived tokens and least-privilege permissions for image publishing.
- For stricter supply-chain security, pin third-party GitHub Actions to commit SHAs instead of version tags.

## Exercises

Use the structured exercises after you understand the sample app:

```text
exercises/README.md
```

The exercises cover reading pipeline YAML, running local CI, creating GitHub Actions workflows, creating GitLab CI pipelines, Docker image jobs, artifacts, cache, and secrets.

## Cleanup

The local simulation uses disposable containers. Remove any container/image created during an optional local run with:

```bash
docker compose down --remove-orphans
```

Do not delete GitHub/GitLab project settings, registries, or secrets as a general cleanup step.

## References

- GitHub Actions workflow syntax: https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax
- GitHub Actions Python build and test guide: https://docs.github.com/en/actions/tutorials/build-and-test-code/python
- GitHub Actions Docker image publishing guide: https://docs.github.com/en/actions/tutorials/publish-packages/publish-docker-images
- GitLab CI/CD YAML syntax reference: https://docs.gitlab.com/ci/yaml/
- GitLab Docker image build guide: https://docs.gitlab.com/ci/docker/using_docker_build/
- GitLab CI lint guide: https://docs.gitlab.com/ci/yaml/lint/
