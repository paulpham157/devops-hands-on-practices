# Debug Selector and Port Mapping

The Service selector must match the Pod labels from the Deployment template.

Clients connect to the Service port, and Kubernetes forwards to the target port that must match the container's listening port.

If the selector matches nothing, the Service has no endpoints. If the target port is wrong, endpoints may exist but requests fail at runtime.
