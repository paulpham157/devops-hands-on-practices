# Trace ConfigMap to Mounted File

ConfigMaps separate image content from runtime configuration.

In this lesson, the Deployment mounts ConfigMap data into the container filesystem so Nginx serves content that can change without rebuilding the image.

To debug ConfigMap issues, trace the value from the manifest key to the mount path inside the Pod.
