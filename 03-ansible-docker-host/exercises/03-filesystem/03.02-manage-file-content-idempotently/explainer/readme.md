# Manage File Content Idempotently

Creating a directory is only part of host configuration.

Real automation usually also manages file contents, ownership, and permissions in a way that can run repeatedly without drift.

Idempotence means the first run may change the host, but later runs should report no change unless the desired content changed.
