# Trace Service Ports

A Service gives stable networking to changing Pods.

The Service selects Pods by label. Its `port` is what clients use. Its `targetPort` is the port on the selected Pods.

In this lesson Nginx runs unprivileged on container port `8080`.
