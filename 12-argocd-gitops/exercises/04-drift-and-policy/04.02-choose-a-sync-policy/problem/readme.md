# Problem: Choose a Sync Policy

Read:

```bash
sed -n '1,220p' argocd/applications/course-web.yaml.tpl
```

Choose policy for two environments:

1. Dev: fast feedback, disposable resources
2. Production: customer-facing, stricter change control

Answer:

1. Should dev use automated sync?
2. Should production use automated prune?
3. Should production use self-heal?
4. What extra controls should production add?
