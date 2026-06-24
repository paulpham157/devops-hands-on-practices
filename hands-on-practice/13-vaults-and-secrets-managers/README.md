# Lesson 13: Vaults and Secrets Managers

## Goal

Learn the main types of secret storage systems and practice a safe local workflow with HashiCorp Vault, Docker Compose, and Kubernetes examples.

This lesson teaches:

- What counts as a secret
- Why secrets should not be committed to Git
- The difference between Vault, cloud secrets managers, Kubernetes Secrets, CI/CD secrets, and GitOps secret encryption
- How to run HashiCorp Vault locally in dev mode
- How to write and read KV secrets
- How to pass a secret into a container through a mounted file
- How to reason about secret rotation, access control, audit, and blast radius

## What Counts as a Secret

A secret is any value that grants access or proves identity.

Examples:

- API tokens
- Database passwords
- TLS private keys
- OAuth client secrets
- SSH private keys
- Signing keys
- Webhook secrets
- Cloud access keys

Configuration values like hostnames and feature flags are usually not secrets unless they reveal sensitive internal information.

## Types of Secret Stores

| Type | Examples | Best For | Watch Out For |
| --- | --- | --- | --- |
| Central vault | HashiCorp Vault | Dynamic secrets, leasing, audit, multi-cloud access brokering | Operational complexity |
| Cloud secrets manager | AWS Secrets Manager, Azure Key Vault, Google Secret Manager | Cloud-native apps, IAM integration, managed rotation | Cloud lock-in and IAM design |
| Kubernetes Secret | Native `Secret` objects | Runtime injection into pods | Base64 is not encryption; enable encryption at rest and RBAC |
| External secret controller | External Secrets Operator, Secrets Store CSI Driver | Syncing cloud/Vault secrets into Kubernetes | Controller permissions become sensitive |
| GitOps encrypted secret | Sealed Secrets, SOPS | Storing encrypted desired state in Git | Key management and rotation |
| CI/CD secret store | GitHub Actions secrets, GitLab CI variables, Jenkins credentials | Pipeline credentials | Leakage through logs and over-broad workflows |

## Local Lab Architecture

```text
HashiCorp Vault dev server  http://localhost:8200
Demo app                    http://localhost:8100
Docker secret file          secrets/demo_api_token.txt
Sample Kubernetes files     kubernetes/
Generated local files       ignored by git
```

The lab uses Vault dev mode only for learning. Do not use Vault dev mode in production.

## Prerequisites

Install:

- Docker Desktop or Docker Engine
- Docker Compose plugin
- Optional for Kubernetes examples: `kubectl`

Check:

```bash
docker version
docker compose version
```

## Run Vault Locally

```bash
cd hands-on-practice/13-vaults-and-secrets-managers
./scripts/up-vault.sh
```

Vault UI:

```text
http://localhost:8200
```

Dev token:

```text
root
```

This token is intentionally weak and only for local practice.

## Write and Read a KV Secret

Write a demo secret:

```bash
./scripts/write-vault-secret.sh
```

Read it back:

```bash
./scripts/read-vault-secret.sh
```

The secret path is:

```text
secret/docker-course
```

Vault's KV v2 engine stores versioned key-value secrets. Versioning helps rollback and audit changes, but rotation policy still matters.

## Inject a Secret into a Container

Export the Vault value into a local Docker secret file:

```bash
./scripts/export-compose-secret.sh
```

Run the demo app:

```bash
./scripts/run-app.sh
```

In another terminal:

```bash
curl http://localhost:8100
```

The app reads the token from:

```text
/run/secrets/demo_api_token
```

The app never prints the full secret. It returns only metadata and a masked preview.

## Check for Plaintext Secrets

```bash
./scripts/scan-for-plaintext.sh
```

This is a lightweight guardrail, not a full secret scanner. In real projects, use dedicated tools such as Trivy secret scanning, Gitleaks, or your platform's secret scanning.

## Kubernetes Examples

This lesson includes three patterns:

```text
kubernetes/native-secret.yaml
kubernetes/external-secret-vault.yaml
kubernetes/sealed-secret-placeholder.yaml
```

Use them to compare:

- Native Kubernetes Secret: simple, but base64 is not encryption.
- ExternalSecret: pulls secret material from an external store such as Vault or a cloud secrets manager.
- SealedSecret/SOPS-style encrypted GitOps secret: stores encrypted desired state in Git.

Do not apply placeholder manifests directly to production.

## Choosing a Secret Store

Use this quick decision guide:

```text
Single Docker lab                 -> env/file secret is enough
Kubernetes app, low complexity    -> Kubernetes Secret plus encryption at rest and RBAC
Cloud app                         -> cloud-native secrets manager
Multi-cloud or dynamic database   -> Vault
GitOps desired state              -> External Secrets, Sealed Secrets, or SOPS
CI pipeline credential            -> CI/CD secret store with tight workflow permissions
```

## Production Notes

For production:

- Encrypt secrets at rest.
- Keep secrets out of images and Git history.
- Prefer short-lived credentials over static passwords.
- Use least-privilege access policies.
- Rotate secrets and rehearse rotation.
- Audit secret reads.
- Separate human access from workload access.
- Avoid printing secrets in logs.
- Treat backup files and state files as sensitive.

## Clean Up

```bash
./scripts/cleanup.sh
```

## Exercises

Use the exercise track after you can run Vault locally:

```text
exercises/README.md
```

The exercises cover secret store classification, lifecycle, Vault KV, file-based injection, avoiding plaintext Git secrets, Kubernetes secret patterns, and choosing the right store.

## References

- HashiCorp Vault documentation: https://developer.hashicorp.com/vault/docs
- Vault KV secrets engine: https://developer.hashicorp.com/vault/docs/secrets/kv
- AWS Secrets Manager: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html
- Azure Key Vault: https://learn.microsoft.com/azure/key-vault/general/overview
- Google Secret Manager: https://cloud.google.com/secret-manager/docs/overview
- Kubernetes Secrets: https://kubernetes.io/docs/concepts/configuration/secret/
- External Secrets Operator: https://external-secrets.io/latest/
- Sealed Secrets: https://github.com/bitnami-labs/sealed-secrets
- SOPS: https://getsops.io/
