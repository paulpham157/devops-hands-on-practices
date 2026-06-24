# Design Local, Remote, and Virtual Repositories

1. `docker-dev-local`, `docker-staging-local`, and `docker-release-local`.
2. `dockerhub-remote`.
3. `docker-virtual`.
4. Release images should be immutable so production references cannot silently change.
5. Reasonable additions include `helm-dev-local`, `helm-release-local`, `helm-remote`, and `helm-virtual`, or a PyPI set such as `pypi-dev-local`, `pypi-release-local`, `pypi-remote`, and `pypi-virtual`.

