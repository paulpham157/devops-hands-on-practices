# Read Rollout and Pod Replacement

Pods are owned directly by a ReplicaSet, and the ReplicaSet is owned by the Deployment.

`kubectl rollout status deployment/course-nginx -n docker-course` shows whether the rollout completed.

Replacement is visible when a new ReplicaSet appears and Pods with the new template hash become Ready while the old set scales down.
