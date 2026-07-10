# Build Chain

A practical TeamCity chain can look like:

1. `Build and Test`
2. `Container Package`
3. `Security Scan`
4. `Staging Approval`
5. `Release Publish`

Snapshot dependencies keep the chain on the same source revision, while artifact dependencies pass packaged outputs between stages.
