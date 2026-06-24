# Explainer: Classify Secret Stores

Different secret stores solve different problems.

HashiCorp Vault is a central vault. It can store static secrets, broker dynamic secrets, lease credentials, and audit access.

Cloud secrets managers are managed services. They integrate with cloud IAM and are usually the simplest choice for cloud-native workloads.

Kubernetes Secrets are runtime objects for pods. They are useful inside a cluster, but they are not a complete enterprise secret management system by themselves.

GitOps encrypted secret tools let teams keep encrypted desired state in Git.

CI/CD secret stores are for pipeline credentials and should be scoped tightly to workflows.
