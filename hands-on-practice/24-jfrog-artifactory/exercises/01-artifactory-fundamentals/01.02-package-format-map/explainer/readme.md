# Package Format Map

Artifactory supports many package formats, but each ecosystem expects different client behavior.

Examples:

- Docker clients use registry endpoints.
- npm uses registry URLs in `.npmrc`.
- Maven uses repositories in `settings.xml` or build files.
- PyPI uses index URLs in `pip.conf` or command flags.
- Helm uses chart repositories or OCI registries.
- Generic repositories store arbitrary binaries, SBOMs, tarballs, and reports.

The repository naming pattern should make package type, lifecycle, and purpose obvious.

