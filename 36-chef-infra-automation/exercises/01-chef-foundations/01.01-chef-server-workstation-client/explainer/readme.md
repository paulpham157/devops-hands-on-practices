# Chef Control Plane Roles

Use this exercise to separate authoring, coordination, and node execution.

- Chef Workstation is where teams generate cookbooks, test, and resolve policy.
- Chef Infra Server distributes cookbooks, policies, and node data in server-based setups.
- `chef-client` applies the run list on a node.
