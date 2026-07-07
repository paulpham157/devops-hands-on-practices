# Debug ImagePullBackOff

Expected failure state:

```text
ErrImagePull
ImagePullBackOff
```

Expected event detail mentions that the image or tag could not be found.

Fix the image back to the original unprivileged Nginx image, then run:

```bash
kubectl apply -f manifests/03-deployment.yaml
kubectl rollout status deployment/course-nginx -n docker-course
```
