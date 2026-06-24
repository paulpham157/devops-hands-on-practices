# Permissions and Access Control

| Actor | Requested Permission | Decision | Reason |
| --- | --- | --- | --- |
| Developer | deploy to `docker-dev-local` | Approve | Developers need a safe development publish target |
| Developer | delete from `docker-release-local` | Reject | Release deletes need strong control and audit |
| Runtime cluster | read from `docker-release-local` | Approve | Runtime needs approved artifacts only |
| Runtime cluster | deploy to `docker-release-local` | Reject | Runtime should not publish artifacts |
| CI service account | publish build info | Approve | Build info links artifacts to source, build, and dependencies |

Access control should separate build, release, and runtime duties.

