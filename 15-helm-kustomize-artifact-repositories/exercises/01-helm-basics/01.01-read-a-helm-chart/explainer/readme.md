# Explainer: Read a Helm Chart

A Helm chart is a package for a Kubernetes application.

The chart in this lesson is under:

```text
charts/course-web/
```

Important files:

| File | Purpose |
| --- | --- |
| `Chart.yaml` | Chart metadata: name, version, app version, description |
| `values.yaml` | Default configuration values |
| `values-dev.yaml` | Dev-specific values |
| `values-prod.yaml` | Prod-specific values |
| `values.schema.json` | Validation rules for values |
| `templates/` | Kubernetes YAML templates |
| `templates/_helpers.tpl` | Reusable template helpers |
| `.helmignore` | Files excluded from packaged chart archive |

Helm renders templates by combining chart templates with values.

```text
templates + values -> rendered Kubernetes YAML
```

