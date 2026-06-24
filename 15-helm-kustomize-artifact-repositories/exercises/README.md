# Exercises: Helm, Kustomize, and Artifact Repositories

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-helm-basics/01.01-read-a-helm-chart`
   - Identify the purpose of the chart files, templates, values, and schema.

2. `01-helm-basics/01.02-render-and-package-a-chart`
   - Render the chart, inspect the output, and package it into a versioned chart archive.

3. `02-kustomize-basics/02.01-read-base-and-overlays`
   - Understand how the base and environment overlays relate.

4. `02-kustomize-basics/02.02-render-dev-and-prod`
   - Render dev and prod overlays and compare the differences.

5. `03-helm-vs-kustomize/03.01-choose-the-right-tool`
   - Decide when to use Helm, Kustomize, or both.

6. `03-helm-vs-kustomize/03.02-combine-helm-and-kustomize-safely`
   - Design a workflow that avoids confusing ownership between Helm and Kustomize.

7. `04-artifact-repositories/04.01-compare-hosted-proxy-group`
   - Compare hosted, proxy, group, local, remote, and virtual repository modes.

8. `04-artifact-repositories/04.02-publish-chart-to-nexus-or-artifactory`
   - Draft a safe publish flow for a Helm chart and Docker image.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/render-helm.sh
./scripts/package-chart.sh
./scripts/render-kustomize.sh dev
./scripts/render-kustomize.sh prod
./scripts/compare-rendered.sh
./scripts/validate.sh
```

If `helm` is not installed, complete the Kustomize and artifact repository exercises first.

