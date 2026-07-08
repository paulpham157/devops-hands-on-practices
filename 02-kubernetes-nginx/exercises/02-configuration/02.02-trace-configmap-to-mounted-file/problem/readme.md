# Trace ConfigMap to Mounted File

## Task

Read the ConfigMap and Deployment manifests, then verify the mounted file inside a running Pod:

```bash
kubectl get configmap course-nginx-html -n docker-course -o yaml
kubectl exec -n docker-course deploy/course-nginx -- cat /usr/share/nginx/html/index.html
```

Answer:

1. Which ConfigMap key becomes the HTML file?
2. Which path inside the container receives that file?
3. Why can the team change HTML without rebuilding the image?

## Done When

You can connect the ConfigMap key, volume mount, and file seen by Nginx.
