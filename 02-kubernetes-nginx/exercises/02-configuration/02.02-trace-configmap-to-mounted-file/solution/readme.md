# Trace ConfigMap to Mounted File

The HTML value comes from the ConfigMap key that is projected into `/usr/share/nginx/html/index.html`.

Because the data is mounted at runtime, the image stays unchanged while the served content changes through Kubernetes configuration.
