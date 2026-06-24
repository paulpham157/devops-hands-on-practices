# Exercises: Vaults and Secrets Managers

## Sections

1. `01-secret-management-basics`
   - Classify secret stores.
   - Map the secret lifecycle.

2. `02-local-vault-workflow`
   - Run a local Vault dev server.
   - Write and read KV secrets.

3. `03-container-secret-injection`
   - Inject secrets through mounted files.
   - Avoid plaintext secrets in Git.

4. `04-kubernetes-and-gitops-secrets`
   - Compare Kubernetes secret patterns.
   - Choose an appropriate secret store for different systems.

## Completion Target

By the end, you should be able to explain:

- Why base64 is not encryption.
- Why secret stores need identity, policy, audit, and rotation.
- When Vault is worth the operational cost.
- When a cloud secrets manager is the simpler choice.
- How Kubernetes and GitOps workflows should consume secrets without committing plaintext.
