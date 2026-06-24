# Explainer: Combine Helm and Kustomize Safely

Combining Helm and Kustomize can work well, but ownership must be clear.

Good split:

```text
Helm chart owns reusable app defaults.
Kustomize overlay owns environment-specific patches.
```

Risky split:

```text
Helm values and Kustomize patches both change the same field.
```

Examples of fields that should have one owner:

- replica count
- image tag
- resource requests and limits
- ingress host
- environment variables

If both tools can change the same field, reviewers cannot easily tell which layer is authoritative.

