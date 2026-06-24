# Explainer: Avoid Plaintext in Git

Git history is sticky.

If a real secret is committed, deleting the line in a later commit is not enough. The old value may still exist in history, forks, caches, pull requests, CI logs, and local clones.

The right response is usually:

```text
revoke or rotate the secret -> remove it from code -> scan history -> review access logs
```

This lesson ignores generated local secret files and includes a lightweight scan script:

```bash
./scripts/scan-for-plaintext.sh
```
