# Use Local Path Storage

K3s includes a local-path provisioner. It creates local persistent volumes on cluster nodes.

This is useful for labs and simple single-node workloads.

It is not the same as a replicated production storage system. If the node or disk disappears, the data is tied to that node's local filesystem.

In k3d, local-path data lives inside the K3s node container unless you mount a host directory into the cluster nodes.
