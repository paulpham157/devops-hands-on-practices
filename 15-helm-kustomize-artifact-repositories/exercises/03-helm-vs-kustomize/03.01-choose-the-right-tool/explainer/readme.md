# Explainer: Choose the Right Tool

Helm and Kustomize both produce Kubernetes YAML, but they solve different problems.

Use Helm when:

- you need a reusable application package.
- users need configurable values.
- you want chart versioning.
- you publish the app to a chart repository or OCI registry.

Use Kustomize when:

- you already have plain YAML.
- environments mostly differ by small patches.
- you want overlays without template syntax.
- GitOps needs readable desired state in Git.

Use both when:

- a vendor or platform team publishes a Helm chart.
- your environment team needs to patch the rendered result or manage per-environment overlays.

