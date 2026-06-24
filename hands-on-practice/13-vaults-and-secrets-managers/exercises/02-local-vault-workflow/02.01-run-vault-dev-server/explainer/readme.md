# Explainer: Run a Vault Dev Server

Vault dev mode starts an unsealed local Vault with an in-memory backend and a known root token.

In this lesson:

```text
Vault URL: http://localhost:8200
Root token: root
```

Dev mode is useful for learning the API and CLI.

It is not production safe because the root token is static, storage is not durable, and security controls are intentionally relaxed.
