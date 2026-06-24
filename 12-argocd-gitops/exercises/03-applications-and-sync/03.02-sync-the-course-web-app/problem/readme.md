# Problem: Sync the Course Web App

Apply the Application:

```bash
REPO_URL=https://github.com/YOUR_ORG/devops-hands-on-practices.git ./scripts/apply-application.sh
```

Watch status:

```bash
./scripts/show-status.sh
kubectl get all,ingress -n docker-course-gitops
```

Test:

```bash
curl http://localhost:8099
```

Answer:

1. Is the Application synced?
2. Is the Application healthy?
3. Which Kubernetes resources did Argo CD create?
4. Which URL serves the app?
