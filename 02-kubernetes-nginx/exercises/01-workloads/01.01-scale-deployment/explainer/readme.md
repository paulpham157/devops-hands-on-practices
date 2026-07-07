# Scale Deployment

A Deployment declares desired state for a ReplicaSet and its Pods.

Changing `spec.replicas` tells the controller how many matching Pods should exist. Kubernetes then reconciles actual state toward that number.
