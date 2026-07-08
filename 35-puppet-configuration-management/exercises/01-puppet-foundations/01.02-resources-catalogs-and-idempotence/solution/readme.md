# Resources, Catalogs, and Idempotence

1. `role::docker_host` expresses the node role.
2. The `file` resource for `/etc/motd` should converge and then remain unchanged unless content drifts.
3. The package resource for `docker.io` would fail during apply, leaving downstream service expectations unsatisfied.
