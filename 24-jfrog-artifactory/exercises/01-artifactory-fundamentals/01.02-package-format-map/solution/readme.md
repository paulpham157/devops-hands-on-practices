# Package Format Map

| Package Type | Development Repo | Release Repo | Remote Cache | Virtual Repo |
| --- | --- | --- | --- | --- |
| Docker | `docker-dev-local` | `docker-release-local` | `dockerhub-remote` | `docker-virtual` |
| npm | `npm-dev-local` | `npm-release-local` | `npmjs-remote` | `npm-virtual` |
| Maven | `maven-snapshot-local` | `maven-release-local` | `maven-central-remote` | `maven-virtual` |
| PyPI | `pypi-dev-local` | `pypi-release-local` | `pypi-remote` | `pypi-virtual` |
| Generic | `generic-dev-local` | `generic-release-local` | optional | `generic-virtual` |

The exact names can vary, but package type plus lifecycle should be visible.

