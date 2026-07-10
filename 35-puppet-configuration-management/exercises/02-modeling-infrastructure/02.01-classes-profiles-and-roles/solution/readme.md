# Classes, Profiles, and Roles

One reasonable split:

- Shared profile: `profile::base`
- Unique runner profile: `profile::ci_runner`
- Direct node assignment: `role::docker_host`, `role::ci_runner`, `role::artifact_cache`

The key is that nodes should receive roles, not a loose pile of component classes.
