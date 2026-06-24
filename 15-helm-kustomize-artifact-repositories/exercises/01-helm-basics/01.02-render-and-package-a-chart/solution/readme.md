# Solution: Render and Package a Chart

The rendered YAML is:

```text
reports/helm-rendered.yaml
```

The packaged chart is:

```text
artifacts/course-web-0.1.0.tgz
```

The package version comes from `charts/course-web/Chart.yaml`.

CI should publish chart packages because releases need repeatable, traceable, versioned artifacts. A local laptop build is not a release system.

Example install command:

```bash
helm repo add internal https://artifact.example.com/helm
helm upgrade --install course-web internal/course-web --version 0.1.0
```

