# Resources, Catalogs, and Idempotence

A manifest declares state, then Puppet compiles a catalog for one node and applies it until the node matches the desired state.

Check these ideas as you read the sample manifests:

- resources declare state, not shell steps
- catalogs are node-specific compiled views
- a second run should not create more changes when the node already matches
