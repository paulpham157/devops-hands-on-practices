# Lesson 24: JFrog Artifactory

## Goal

Learn how JFrog Artifactory works as a universal artifact repository manager for CI/CD and platform engineering.

This lesson teaches:

- Artifactory's role in the software supply chain.
- local, remote, virtual, and federated repositories.
- package format support and repository naming.
- dependency caching and upstream proxying.
- build info, artifact publishing, and artifact promotion.
- fine-grained permissions and access patterns.
- Xray-style vulnerability and license policy gates.
- operational practices for retention, immutability, cleanup, and auditability.

No JFrog account is required for the core exercises. The scripts in this lesson simulate repository lifecycle behavior locally.

## Mental Model

```text
developer or CI -> package manager or JFrog CLI -> Artifactory repository -> promotion -> runtime deployment
                                                  -> Xray scanning -> policy gate
```

Artifactory is not just file storage. It is a control point for software artifacts:

- what gets published.
- who can read or deploy it.
- which upstream dependencies are cached.
- which build produced an artifact.
- whether an artifact can be promoted to staging or production.
- whether security policy allows release.

## Repository Types

| Type | Purpose | Example |
| --- | --- | --- |
| Local | Artifacts produced by your organization | `npm-dev-local`, `docker-release-local` |
| Remote | Cached proxy for an external upstream | `npmjs-remote`, `dockerhub-remote` |
| Virtual | Single URL that aggregates local and remote repositories | `npm-virtual`, `docker-virtual` |
| Federated | Synchronizes artifacts across Artifactory sites | `maven-release-federated` |

Use virtual repositories as the developer-facing URL when possible. They hide internal repository layout and allow the platform team to change backing repositories later.

## Common Package Formats

Artifactory supports many ecosystems, including:

- Docker and OCI images.
- Maven and Gradle.
- npm.
- PyPI.
- NuGet.
- Go modules.
- Helm charts.
- RubyGems.
- Debian and RPM.
- Generic binary artifacts.

This lesson uses Docker, npm, Maven, PyPI, and generic examples because those map cleanly to DevOps workflows.

## Lab Layout

```text
repository-design/    Repository layout, permission targets, and promotion flow
ci-cd/                JFrog CLI and pipeline examples
policies/             Xray-style security and license policy examples
sample-package/       Tiny sample package metadata
scripts/              Local validation and promotion simulation
exercises/            Structured hands-on practice
```

## Production Repository Pattern

A common pattern is:

```text
dev local repo -> staging local repo -> release local repo
             \-> virtual repo for consumers
```

Example names:

```text
docker-dev-local
docker-staging-local
docker-release-local
dockerhub-remote
docker-virtual
```

The same pattern can be repeated for npm, Maven, PyPI, Helm, and generic artifacts.

## Artifact Promotion

Promotion moves or copies a build's artifacts from one lifecycle repository to another.

Typical promotion stages:

1. CI builds and publishes to a development repository.
2. CI publishes build info.
3. Security scanning runs.
4. A gate checks vulnerability, license, and quality policy.
5. Approved artifacts are promoted to staging.
6. After integration testing, artifacts are promoted to release.

Do not rebuild for production if you can avoid it. Promote the same artifact that was tested.

## Dependency Caching

Remote repositories cache dependencies from upstream registries.

Benefits:

- faster builds.
- fewer external network failures.
- central control over allowed upstreams.
- retained dependency evidence for audits.

Risks:

- stale or poisoned cache if controls are weak.
- accidental dependency confusion if internal and external names overlap.
- uncontrolled storage growth without retention policies.

## Access Control

Design permissions around repository lifecycle:

- developers can deploy to dev repositories.
- CI service accounts can deploy build outputs and publish build info.
- release managers or CD automation can promote to release.
- runtime clusters should read only release or approved virtual repositories.
- anonymous access should be disabled unless explicitly required.

## Xray and Security Gates

JFrog Xray is commonly used with Artifactory to scan artifacts and dependencies for supply-chain risk. A practical gate checks:

- high or critical vulnerabilities.
- malicious package signals.
- license violations.
- operational risk such as unapproved package sources.
- SBOM and base-image impact, where the platform has the related Xray/Security features enabled.

JFrog has been moving some remote-repository blocking capabilities toward JFrog Curation, so treat download-blocking policy design as version- and product-plan-sensitive instead of assuming every Xray gate is enforced the same way.

The policy examples in `policies/` model the decision logic without requiring a live Xray instance.

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

Optional local lifecycle simulation:

```bash
./scripts/simulate-promotion.sh
```

The simulation writes only under `sandbox/`.

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover repository types, package mapping, repository design, access control, build info, promotion, caching, immutability, and Xray-style policy gates.

## References

- JFrog Artifactory documentation: https://jfrog.com/help/r/jfrog-artifactory-documentation
- Repository management: https://jfrog.com/help/r/jfrog-artifactory-documentation/repository-management
- Repository types: https://jfrog.com/help/r/jfrog-artifactory-documentation/repository-types
- Package management: https://jfrog.com/help/r/jfrog-artifactory-documentation/package-management
- Build integration: https://jfrog.com/help/r/jfrog-artifactory-documentation/build-integration
- Build promotion: https://jfrog.com/help/r/jfrog-artifactory-documentation/build-promotion
- JFrog Xray: https://jfrog.com/help/r/jfrog-security-documentation/jfrog-xray
- JFrog CLI: https://jfrog.com/help/r/jfrog-cli
