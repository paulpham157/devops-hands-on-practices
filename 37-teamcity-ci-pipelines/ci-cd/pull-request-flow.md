# Pull Request Flow

1. VCS trigger starts a build for `feature-*`.
2. Build and Test publishes branch metadata.
3. Container Package consumes upstream metadata and produces image digest output.
4. TeamCity reports build status back to the pull request.
5. Release branches require an approval step before publish.
