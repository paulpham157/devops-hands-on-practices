# Artifacts, Cache, and Secrets

CI hardening is mostly about reducing surprise.

Artifacts preserve useful outputs:

```text
test reports
coverage reports
build metadata
release packages
```

Cache speeds up repeated work:

```text
dependency downloads
language package caches
tool caches
```

Secrets should never be committed to YAML. Put them in the platform secret store and pass them to jobs only when needed.

Also keep job permissions narrow. A test job usually needs read-only repository access, not package publishing rights.
