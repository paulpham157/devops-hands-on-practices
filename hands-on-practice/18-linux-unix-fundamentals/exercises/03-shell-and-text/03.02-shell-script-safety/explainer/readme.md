# Explainer: Shell Script Safety

Shell scripts are powerful and easy to misuse.

Common safety practices:

- use `set -eu` for simple scripts.
- quote variables: `"$name"`.
- check command exit codes.
- avoid unreviewed `rm -rf`.
- use explicit paths.
- avoid parsing complex formats with fragile text pipelines.
- prefer POSIX `sh` unless you require Bash features.

Containers often use shell scripts as entrypoints, so small shell mistakes can break deployments.

