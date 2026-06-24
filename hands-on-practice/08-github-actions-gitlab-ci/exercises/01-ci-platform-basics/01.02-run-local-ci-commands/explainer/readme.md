# Run Local CI Commands

Good CI pipelines should be easy to rehearse locally.

This lesson keeps the important commands in a local script:

```text
scripts/run-local-ci.sh
```

The script does not replace GitHub Actions or GitLab CI. It gives you a fast way to check the same behavior before pushing code.

The local flow is:

```text
run tests in Python container -> build image -> run image -> check /healthz
```
