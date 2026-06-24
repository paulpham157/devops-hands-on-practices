# Problem: Render an Argo CD Application

Push this repository to a Git remote or fork it, then run:

```bash
REPO_URL=https://github.com/YOUR_ORG/devops-hands-on-practices.git ./scripts/render-application.sh
```

Inspect:

```bash
sed -n '1,220p' reports/course-web-application.yaml
```

Answer:

1. What is the rendered `repoURL`?
2. What is the rendered `path`?
3. Which namespace will the app deploy into?
4. Which sync options are enabled?
