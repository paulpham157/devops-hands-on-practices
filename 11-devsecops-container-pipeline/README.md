# Lesson 11: DevSecOps for a Container Pipeline

## Goal

Build a small DevSecOps workflow around a Dockerized Python app.

This lesson keeps the target local and practical. You will build one container image, scan it, generate an SBOM, and run a repeatable security gate that can later be copied into CI.

This lesson teaches:

- What DevSecOps adds to a normal CI/CD workflow
- How to shift security checks earlier without blocking learning speed
- Dockerfile linting
- Secret scanning
- Source, configuration, and container image vulnerability scanning
- SBOM generation
- A basic policy gate for pull requests or release pipelines

## Navigation

- Previous lesson: `10-opentofu-docker-module`
- Next lesson: `12-argocd-gitops`

## Related Lessons

- `07-jenkins-ci-pipeline`
- `08-github-actions-gitlab-ci`
- `33-snyk-and-sonar`

## What Is DevSecOps

DevSecOps means security checks are part of the normal delivery workflow instead of a separate late-stage review.

For container work, that usually means checking:

- Source code and dependencies
- Dockerfiles and image build configuration
- Secrets accidentally committed to the repository
- Container image vulnerabilities
- Runtime configuration
- Build provenance and deploy policy

The goal is not to run every possible scanner. The goal is to create fast feedback that catches common problems early and gives teams a clear path to fix them.

## Lab Architecture

```text
sample-app/                 Flask app and Dockerfile
scripts/build-image.sh       Build local image
scripts/lint-dockerfile.sh   Lint Dockerfile with Hadolint
scripts/scan-secrets.sh      Scan for committed secrets with Trivy
scripts/scan-filesystem.sh   Scan source/dependencies/config with Trivy
scripts/scan-image.sh        Scan the built container image with Trivy
scripts/generate-sbom.sh     Generate CycloneDX SBOM with Trivy
scripts/security-gate.sh     Run the repeatable gate
reports/                     Generated scan output, ignored by git
```

Default image:

```text
docker-course-devsecops:local
```

Default app URL when running locally:

```text
http://localhost:8098
```

## Prerequisites and Entry Check

Install:

- Docker Desktop or Docker Engine

The scripts run scanners through Docker images:

- `aquasec/trivy:0.72.0`
- `ghcr.io/hadolint/hadolint:v2.14.0-debian`

The versions are pinned so scanner behavior is repeatable during practice. In real CI, review and bump scanner versions on a schedule, and prefer pinned tags or digests over mutable `latest`.

Check:

```bash
docker version
```

Entry check: identify one secret-handling risk, one image-vulnerability risk, and why a security gate needs a documented exception path.

## Run the App

```bash
cd 11-devsecops-container-pipeline
./scripts/build-image.sh
./scripts/run-app.sh
```

In another terminal:

```bash
curl http://localhost:8098/health
```

Stop the app with `Ctrl+C`.

## Run Security Checks

Lint the Dockerfile:

```bash
./scripts/lint-dockerfile.sh
```

Scan source, config, and secrets:

```bash
./scripts/scan-filesystem.sh
./scripts/scan-secrets.sh
```

Scan the built image:

```bash
./scripts/build-image.sh
./scripts/scan-image.sh
```

Generate an SBOM:

```bash
./scripts/generate-sbom.sh
```

The SBOM is written to:

```text
reports/devsecops-sbom.cdx.json
```

## Run the Security Gate

```bash
./scripts/security-gate.sh
```

The default gate enforces deterministic local checks:

- Dockerfile lint must pass.
- Secret scan must pass.
- Image scan must run and report findings.
- SBOM must be generated.

Container vulnerability databases change over time, so image vulnerability findings are report-only by default in this local course. To make critical image vulnerabilities fail the gate:

```bash
IMAGE_VULN_GATE=1 ./scripts/security-gate.sh
```

## What to Fix First

Prioritize findings in this order:

1. Real secrets in git history or source files
2. Critical exploitable vulnerabilities in runtime packages
3. Root containers or overly broad runtime permissions
4. Unpinned dependencies and unreviewed base image changes
5. Missing SBOM or build provenance

Do not blindly chase every low-severity finding. Security work should reduce meaningful risk.

## CI Example

The sample workflow is in:

```text
ci/github-actions-devsecops.yml
```

It is not installed into `.github/workflows/` automatically because this repository is a learning workspace. Copy it into a real repository when you want the gate to run on pull requests.

## Exercises

Use the exercise track after the first successful gate:

```text
exercises/README.md
```

The exercises cover the DevSecOps feedback loop, threat modeling, Dockerfile linting, repository scanning, image scanning, SBOM review, policy gates, and CI translation.

## Cleanup

```bash
docker compose down --remove-orphans
```

Generated scanner output is local evidence. Remove it only after recording the findings needed for your exercise; never commit real secrets or scanner caches.

## References

- OWASP DevSecOps Guideline: https://owasp.org/www-project-devsecops-guideline/
- Trivy documentation: https://trivy.dev/docs/
- Hadolint documentation: https://github.com/hadolint/hadolint
- NIST Secure Software Development Framework: https://csrc.nist.gov/pubs/sp/800/218/final
- SLSA supply-chain security framework: https://slsa.dev/
- Trivy documentation: https://trivy.dev/latest/docs/
- Hadolint: https://github.com/hadolint/hadolint
- CycloneDX SBOM standard: https://cyclonedx.org/specification/overview/
