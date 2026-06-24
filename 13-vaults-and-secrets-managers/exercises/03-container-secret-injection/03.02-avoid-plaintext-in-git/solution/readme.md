# Solution: Avoid Plaintext in Git

`secrets/demo_api_token.txt` should not appear as an untracked file after it is generated.

The ignore rule should cover:

```text
13-vaults-and-secrets-managers/secrets/*.txt
```

while keeping:

```text
!13-vaults-and-secrets-managers/secrets/*.example.txt
```

If a real token is committed, rotate or revoke it first. Then remove it from code and clean history if needed.

`.gitignore` only prevents future tracking. It does not remove secrets that already exist in commit history.
