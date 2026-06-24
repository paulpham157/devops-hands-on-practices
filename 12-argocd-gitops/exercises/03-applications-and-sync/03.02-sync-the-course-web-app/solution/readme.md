# Solution: Sync the Course Web App

When sync succeeds, the Application should become:

```text
Synced
Healthy
```

Expected resources include:

```text
Namespace
ConfigMap
ServiceAccount
Deployment
Service
Ingress
ReplicaSet
Pods
```

The app should be reachable at:

```text
http://localhost:8099
```

If the Application is stuck out of sync, confirm that `REPO_URL`, `targetRevision`, and `path` point to a pushed Git commit that Argo CD can read.
