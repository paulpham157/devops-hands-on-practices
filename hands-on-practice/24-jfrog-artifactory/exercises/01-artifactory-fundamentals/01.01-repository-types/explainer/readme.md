# Repository Types

Artifactory repositories have different jobs.

Local repositories store artifacts produced by your organization.

Remote repositories proxy and cache external registries such as Docker Hub, npmjs.org, Maven Central, or PyPI.

Virtual repositories combine local and remote repositories behind one endpoint.

Federated repositories synchronize artifacts across Artifactory sites for multi-site distribution.

Most teams expose virtual repositories to developers and CI. This keeps client configuration stable even when backing repositories change.

