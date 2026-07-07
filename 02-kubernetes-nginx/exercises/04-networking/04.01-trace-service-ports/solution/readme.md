# Trace Service Ports

Expected mapping:

- Pods have the label `app: course-nginx`.
- The Service selects `app: course-nginx`.
- The Service exposes port `80`.
- The Service forwards to target port `8080`.

The local command:

```bash
kubectl port-forward -n docker-course svc/course-nginx 8080:80
```

maps your workstation port `8080` to Service port `80`.
