# Explainer: Compare Kubernetes Secret Patterns

Kubernetes has native Secret objects, but they are only one part of the story.

Native Secret:

- Simple and built in.
- Can be mounted as a file or environment variable.
- Base64 encoding is not encryption.

ExternalSecret:

- Pulls from an external store such as Vault or a cloud secrets manager.
- Keeps plaintext out of Git.
- Requires a controller and careful permissions.

SealedSecret or SOPS:

- Stores encrypted values in Git.
- Works well with GitOps.
- Requires key management and rotation planning.
