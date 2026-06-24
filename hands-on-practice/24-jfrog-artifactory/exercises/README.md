# Exercises: JFrog Artifactory

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-artifactory-fundamentals/01.01-repository-types`
   - Compare local, remote, virtual, and federated repositories.

2. `01-artifactory-fundamentals/01.02-package-format-map`
   - Map package ecosystems to Artifactory repository patterns.

3. `02-repository-design/02.01-design-local-remote-virtual`
   - Design repository layout for a platform team.

4. `02-repository-design/02.02-permissions-and-access-control`
   - Assign fine-grained permissions for developers, CI, release managers, and runtimes.

5. `03-ci-cd-lifecycle/03.01-publish-build-info`
   - Understand JFrog CLI build info publishing.

6. `03-ci-cd-lifecycle/03.02-promote-artifacts`
   - Promote the same tested artifact across lifecycle repositories.

7. `04-security-and-operations/04.01-cache-and-immutability`
   - Reason about dependency caching, immutable release repos, and retention.

8. `04-security-and-operations/04.02-xray-policy-gates`
   - Design Xray-style vulnerability and license gates.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
./scripts/simulate-promotion.sh
```

The simulation writes only under `sandbox/`.

