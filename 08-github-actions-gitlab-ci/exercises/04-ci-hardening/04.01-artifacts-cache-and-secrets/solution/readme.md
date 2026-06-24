# Artifacts, Cache, and Secrets

Expected mapping:

- GitHub artifact: `actions/upload-artifact@v4`.
- GitLab artifact: `artifacts: reports: junit`.
- GitHub cache: `actions/setup-python@v5` with `cache: pip`.
- GitLab cache: top-level `cache` with `.cache/pip`.
- GitHub publishing permission: `packages: write` in `publish-ghcr.yml`.
- GitLab registry credentials: `CI_REGISTRY_USER` and `CI_REGISTRY_PASSWORD`.
- GitLab publishing limit: `rules` requiring `CI_COMMIT_BRANCH == CI_DEFAULT_BRANCH`.

The highest blast-radius jobs are publishing jobs. They can write images to a registry, so they should run only on trusted tags or trusted default-branch pipelines.
