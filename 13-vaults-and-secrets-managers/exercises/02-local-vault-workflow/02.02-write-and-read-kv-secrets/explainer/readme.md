# Explainer: Write and Read KV Secrets

Vault has multiple secrets engines.

The KV engine stores key-value data. KV v2 adds versioning, metadata, and soft delete behavior.

This lesson writes:

```text
secret/docker-course
```

with fields:

```text
api_token
username
```

The path is a logical API path inside Vault. It is not a local file path.
