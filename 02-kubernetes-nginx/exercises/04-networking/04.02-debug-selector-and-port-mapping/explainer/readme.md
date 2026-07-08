# Debug Selector and Port Mapping

Kubernetes Service routing depends on two things:

- the selector must match Pod labels
- the Service target port must match the container port

If either side is wrong, the Service exists but traffic still fails.
