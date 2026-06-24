# Explainer: Render and Package a Chart

Rendering turns a Helm chart into plain Kubernetes YAML.

```bash
helm template course-web charts/course-web
```

Packaging creates a versioned `.tgz` chart archive.

```bash
helm package charts/course-web --destination artifacts
```

Rendering is useful before deployment because you can inspect exactly what Kubernetes will receive.

Packaging is useful because CI can publish a versioned chart to an artifact repository.

