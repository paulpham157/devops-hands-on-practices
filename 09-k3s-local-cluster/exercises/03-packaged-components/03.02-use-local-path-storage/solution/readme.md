# Use Local Path Storage

Create the PVC:

```bash
cat > /tmp/k3s-demo-pvc.yaml <<'YAML'
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
YAML

kubectl apply -f /tmp/k3s-demo-pvc.yaml
kubectl get pvc -n docker-course-k3s
```

If it is `Pending`, inspect the StorageClass:

```bash
kubectl get storageclass local-path -o yaml
```

Many local-path style provisioners wait until a pod uses the claim before binding storage.

Clean up:

```bash
kubectl delete -f /tmp/k3s-demo-pvc.yaml
```
