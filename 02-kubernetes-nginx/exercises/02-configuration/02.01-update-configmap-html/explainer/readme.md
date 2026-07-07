# Update ConfigMap HTML

ConfigMaps store non-secret configuration.

This lesson uses a ConfigMap for static Nginx content. Updating a ConfigMap changes the Kubernetes object, but a running Pod may need a restart or rollout to read the new mounted content reliably.
