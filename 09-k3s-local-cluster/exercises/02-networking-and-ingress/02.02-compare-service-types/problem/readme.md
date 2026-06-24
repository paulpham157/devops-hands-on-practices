# Compare Service Types

## Task

Inspect the current Service:

```bash
kubectl get svc k3s-demo -n docker-course-k3s -o yaml
```

Answer:

1. What is the Service type?
2. Why can the app still be reached from localhost?
3. What component receives the HTTP request before the app Service?

## Done When

You can explain why the app does not need a NodePort Service in this lesson.
