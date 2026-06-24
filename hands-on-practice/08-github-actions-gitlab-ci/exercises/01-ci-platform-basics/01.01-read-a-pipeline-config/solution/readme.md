# Read a Pipeline Config

Expected answers:

1. The GitHub Actions workflow runs on pushes to `main` and pull requests targeting `main`.
2. The GitHub Actions `docker` job waits for the `test` job through `needs: test`.
3. The GitLab CI stages are `test`, `image`, and `publish`.
4. The GitLab CI `test` job writes `build/test-results.xml` and exposes it as a JUnit report.
5. The GitLab CI `build-image` and `publish-image` jobs explicitly use `docker:28.5-dind` as a service.

The main design is the same in both platforms:

```text
test first -> build image second -> publish only when allowed
```
