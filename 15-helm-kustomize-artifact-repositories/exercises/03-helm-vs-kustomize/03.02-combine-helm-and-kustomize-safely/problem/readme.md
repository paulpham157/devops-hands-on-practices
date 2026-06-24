# Problem: Combine Helm and Kustomize Safely

Design a workflow for this case:

```text
Platform team publishes a Helm chart for course-web.
Application teams deploy dev and prod from Git.
Dev and prod differ by image tag, replicas, ingress host, and resources.
```

Write:

1. What Helm should own.
2. What Kustomize should own.
3. Which fields must not be changed in both places.
4. Where the rendered output should be reviewed.
5. What should be published to the artifact repository.

