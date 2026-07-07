# Debug ImagePullBackOff

`ImagePullBackOff` means Kubernetes could not pull the container image and is backing off before retrying.

Common causes include a bad tag, private registry credentials, or network access problems.

The fastest first command is usually `kubectl describe pod`.
