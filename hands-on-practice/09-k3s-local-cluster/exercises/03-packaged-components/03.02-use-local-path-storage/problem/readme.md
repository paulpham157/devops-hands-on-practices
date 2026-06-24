# Use Local Path Storage

## Task

Create a small PVC:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: k3s-demo-data
  namespace: docker-course-k3s
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: local-path
  resources:
    requests:
      storage: 128Mi
```

Apply it from a temporary file, then inspect:

```bash
kubectl get pvc -n docker-course-k3s
kubectl describe pvc k3s-demo-data -n docker-course-k3s
```

## Done When

You can see the PVC and explain why it may stay `Pending` until a pod uses it.
