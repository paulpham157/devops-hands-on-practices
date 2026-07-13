# Lesson 37: TeamCity CI Pipelines

## Goal

Learn how TeamCity organizes projects, build configurations, templates, agents, and build chains for enterprise CI/CD workflows.

This lesson teaches:

- TeamCity server and build agent roles.
- VCS roots, triggers, parameters, branch filters, and build steps.
- Kotlin DSL and configuration as code for TeamCity 2026.1 style setups.
- build chains, snapshot dependencies, and artifact dependencies.
- branch policies, approvals, secrets, and governance.
- migration tradeoffs compared with Jenkins and GitHub Actions.

No TeamCity server is required for the core exercises. The lesson is offline-first and focuses on design, review, and configuration modeling.

## Navigation

- Previous lesson: `36-chef-infra-automation`
- Next lesson: `38-openstack-private-cloud`

## Related Lessons

- `07-jenkins-ci-pipeline`
- `08-github-actions-gitlab-ci`
- `33-snyk-and-sonar`

## Prerequisites and Entry Check

- Completion of `07-jenkins-ci-pipeline` and `08-github-actions-gitlab-ci`, or equivalent CI/CD governance experience.
- No TeamCity server is required for the offline-first exercises.

Entry check: explain the difference between a build chain, snapshot dependency, artifact dependency, and release gate.

## Mental Model

```text
vcs change -> TeamCity project and VCS root -> build configuration -> agent execution -> artifacts and status -> downstream release gate
```

TeamCity is strongest where teams want a rich self-hosted CI control plane with reusable templates, enterprise governance, and explicit build chain modeling.

## Lab Layout

```text
build-configs/       Project, branch policy, and build chain design notes
ci-cd/               TeamCity Kotlin DSL and pipeline examples
scenario-designs/    Governance and migration scenarios
scripts/             Validation helper
exercises/           Structured hands-on practice
```

## Core Concepts

| Concept | Purpose | Example |
| --- | --- | --- |
| Project | Organizational container for CI settings | `Payments Platform` |
| Build configuration | One pipeline or job definition | `Build and Test` |
| Agent | Worker that executes build steps | Linux Docker agent pool |
| VCS root | Repository connection settings | Git repo and branch rules |
| Snapshot dependency | Upstream build relationship | test before package |
| Artifact dependency | Consume output from another build | deploy packaged image metadata |

## Kotlin DSL

TeamCity Kotlin DSL moves UI-managed configuration into source control. Teams use it to:

- version project settings
- review pipeline changes like code
- reuse templates across many build configurations
- bootstrap new projects consistently

That makes TeamCity less dependent on click-only administration.

## Practical Build Chain Thinking

A realistic TeamCity chain usually includes:

- branch-aware VCS triggers
- shared parameters and templates
- artifact rules between stages
- approvals or manual gates before release
- agent-pool placement for privileged or internal-network builds

## Governance Questions

TeamCity usually appears in environments that need:

- self-hosted control of agents and plugins
- approval gates or manual promotion
- build templates reused across many repos
- fine-grained parameter and secret management
- explicit resource planning for agents and queues

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks required files, shell syntax, YAML syntax, and exercise coverage.

Optional local inspection command:

```bash
sed -n '1,240p' ci-cd/.teamcity/settings.kts
```

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover TeamCity architecture, VCS triggers, Kotlin DSL, build chains, artifact flow, secrets, branch governance, capacity planning, and migration tradeoffs.

## Cleanup

The core lesson is offline-first. Remove only generated Kotlin/build inspection output or disposable local files created by an exercise; never delete a real CI project as cleanup.

## References

- TeamCity documentation: https://www.jetbrains.com/help/teamcity/
- Kotlin DSL overview: https://www.jetbrains.com/help/teamcity/kotlin-dsl.html
- Build chain documentation: https://www.jetbrains.com/help/teamcity/build-chain.html
- Snapshot dependencies: https://www.jetbrains.com/help/teamcity/snapshot-dependencies.html
- Artifact dependencies: https://www.jetbrains.com/help/teamcity/artifact-dependencies.html
- TeamCity cloud and on-prem overview: https://www.jetbrains.com/teamcity/
