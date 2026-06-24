# Solution: Map a Secret Lifecycle

One reasonable lifecycle:

1. A platform or security operator creates the provider token.
2. The value is stored in Vault or a cloud secrets manager.
3. Only the workload identity and a small operator group can read it.
4. The app receives it as a mounted file or environment variable at runtime.
5. It could leak through Git, image layers, logs, crash dumps, CI output, or broad admin access.
6. Rotation creates a new token, updates the store, restarts or reloads the app, then removes the old token.
7. Revocation disables the old token at the provider and removes access from the store.
