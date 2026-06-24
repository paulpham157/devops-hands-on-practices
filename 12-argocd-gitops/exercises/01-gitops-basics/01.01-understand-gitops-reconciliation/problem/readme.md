# Problem: Identify the Source of Truth

Read:

```bash
sed -n '1,220p' README.md
sed -n '1,220p' argocd/applications/course-web.yaml.tpl
```

Answer:

1. Where is the desired Kubernetes state stored?
2. Which controller compares Git with the live cluster?
3. What does self-heal repair?
4. Why is direct `kubectl apply` not the main deployment mechanism in this lesson?
