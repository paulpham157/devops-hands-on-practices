# Read Rollout and Pod Replacement

A Deployment owns a ReplicaSet, and the ReplicaSet owns Pods.

When the Deployment template changes, Kubernetes creates a new ReplicaSet and replaces Pods gradually according to rollout strategy.

Good debugging starts by checking ownership and rollout status, not only by reading one Pod log.
