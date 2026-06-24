# Solution: Compare Kubernetes Secret Patterns

The native Secret contains plaintext placeholder data through `stringData`.

The ExternalSecret expects an external controller such as External Secrets Operator.

The SealedSecret stores encrypted data for GitOps.

For Argo CD, a strong default is External Secrets when a central store already exists. Sealed Secrets or SOPS can also work when the team wants encrypted desired state directly in Git.
