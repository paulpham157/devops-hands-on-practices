# Debug ImagePullBackOff

## Task

Edit the image tag in `manifests/03-deployment.yaml` to a fake tag.

Apply the manifest and inspect the failure:

```bash
kubectl apply -f manifests/03-deployment.yaml
kubectl get pods -n docker-course
kubectl describe pod -n docker-course -l app=course-nginx
```

Restore the valid image afterward.

## Done When

You can point to the event that explains the pull failure, then restore a healthy rollout.
