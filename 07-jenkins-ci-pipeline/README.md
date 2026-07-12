# Lesson 07: Jenkins CI Pipeline with Docker

## Goal

Run Jenkins locally and execute a CI pipeline for a small Flask app.

This lesson teaches:

- Jenkins controller basics
- Pipeline as code with a `Jenkinsfile`
- CI stages: test, build, smoke test, archive artifacts
- Running Docker commands from Jenkins through a Docker-in-Docker sidecar

## Navigation

- Previous lesson: `06-observability-prometheus-grafana-loki`
- Next lesson: `08-github-actions-gitlab-ci`

## Related Lessons

- `08-github-actions-gitlab-ci`
- `11-devsecops-container-pipeline`
- `37-teamcity-ci-pipelines`

## Prerequisites and Entry Check

- Completion of `01-docker-compose-flask-redis` and `06-observability-prometheus-grafana-loki`, or equivalent container/CI basics.
- Docker Engine with Compose; the local lab uses a privileged Docker-in-Docker sidecar.

Entry check: identify one reason a CI job needs isolated credentials and one reason a pipeline should run tests before publishing an artifact.

## Why Jenkins

Jenkins is an automation server. In CI/CD work, Jenkins commonly watches code changes, runs tests, builds artifacts or container images, and publishes results.

Modern Jenkins pipelines should live in source control as a `Jenkinsfile` instead of being typed only into the UI.

## Components

| Service | URL | Purpose |
|---|---:|---|
| Jenkins | http://localhost:8085 | CI server and pipeline UI |
| Docker sidecar | internal only | Docker daemon used by Jenkins builds |
| Sample app | built by pipeline | Flask app used for tests and image builds |

Jenkins login:

```text
admin / admin
```

## Security Note

This lesson uses a privileged `docker:dind` sidecar because it is a local lab. Do not copy this Compose file directly into production. Production Jenkins should use a hardened agent model, isolated credentials, and least-privilege access to build infrastructure.

## Run

```bash
cd 07-jenkins-ci-pipeline
docker compose up --build
```

Open Jenkins:

```text
http://localhost:8085
```

Jenkins creates a job automatically:

```text
docker-course-sample-app
```

Open that job and click:

```text
Build Now
```

## What the Pipeline Does

The sample pipeline is in:

```text
sample-app/Jenkinsfile
```

Stages:

1. `Verify Docker`: confirms Jenkins can reach the sidecar Docker daemon.
2. `Unit Tests`: runs Python tests in a disposable Python container.
3. `Build Image`: builds the Flask app Docker image.
4. `Smoke Test`: starts the image and checks `/healthz`.
5. `Archive Build Metadata`: archives a small build report.

## Useful Commands

Show Jenkins logs:

```bash
docker compose logs -f jenkins
```

Show running services:

```bash
docker compose ps
```

List images built by Jenkins:

```bash
docker compose exec docker docker image ls docker-course/jenkins-sample-app
```

## Cleanup

```bash
docker compose down --volumes
```

## Exercises

Use the exercise track after the first successful pipeline run:

```text
exercises/README.md
```

The exercises cover running Jenkins, creating a pipeline, running tests in Docker, building an image, smoke testing, and archiving artifacts.

## References

- Jenkins Docker install guide: https://www.jenkins.io/doc/book/installing/docker/
- Jenkins Pipeline overview: https://www.jenkins.io/doc/book/pipeline/
- Jenkins Pipeline syntax: https://www.jenkins.io/doc/book/pipeline/syntax/
- Jenkins Docker Pipeline guide: https://www.jenkins.io/doc/book/pipeline/docker/
