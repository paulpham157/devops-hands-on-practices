# Explain NetworkPolicy

NetworkPolicy defines allowed traffic between Pods when the cluster CNI enforces it.

Policies are namespace-scoped. A policy selects target Pods, then describes allowed ingress or egress.

If the local cluster CNI does not enforce NetworkPolicy, the object can exist without changing traffic behavior.
