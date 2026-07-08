# Lesson 12: Argo CD GitOps on K3s

## Goal

Run a small GitOps workflow with Argo CD and a local K3s cluster created by `k3d`.

This lesson teaches:

- What GitOps changes compared with manual `kubectl apply`
- The four OpenGitOps ideas: declarative state, versioned state, pull-based delivery, and continuous reconciliation
- How Argo CD watches a Git repository and reconciles Kubernetes resources
- How to model a small app with Kustomize
- How to create an Argo CD `Application`
- How automated sync, prune, and self-heal behave
- How to create drift and let Argo CD repair it

## Why Argo CD

Argo CD is a Kubernetes-native GitOps controller.

Instead of pushing manifests from CI directly into a cluster, you commit desired state to Git. Argo CD pulls that desired state into the cluster, compares it with live resources, and reconciles drift.

That gives a clear operational loop:

```text
change Git -> Argo CD detects desired state -> Argo CD syncs cluster -> Argo CD reports health and drift
```

## Lab Architecture

```text
k3d cluster                 docker-course-argocd
Argo CD namespace           argocd
Application namespace       docker-course-gitops
Ingress URL                 http://localhost:8099
GitOps desired state        gitops-repo/apps/course-web/overlays/dev
Argo CD Application template argocd/applications/course-web.yaml.tpl
Rendered local manifest     reports/course-web-application.yaml
```

## Repository Layout

```text
gitops-repo/
  apps/
    course-web/
      base/
        namespace.yaml
        configmap.yaml
        service-account.yaml
        deployment.yaml
        service.yaml
        ingress.yaml
        kustomization.yaml
      overlays/
        dev/
          kustomization.yaml
          patch-deployment.yaml

argocd/
  applications/
    course-web.yaml.tpl
```

The `gitops-repo` directory is intentionally shaped like a small real GitOps repository. Argo CD should read from Git, not from your local filesystem.

## Prerequisites

Install:

- Docker Desktop or Docker Engine
- `kubectl`
- `k3d`
- Optional: `argocd` CLI

Check:

```bash
docker version
kubectl version --client
k3d version
```

## Fast Local Validation

Validate scripts and render the Kustomize app locally:

```bash
cd 12-argocd-gitops
./scripts/validate-manifests.sh
```

This does not require a running cluster.

## Create the Cluster

```bash
./scripts/create-cluster.sh
```

Default ports:

```text
localhost:8099 -> K3s HTTP load balancer
localhost:8445 -> K3s HTTPS load balancer
```

## Install Argo CD

```bash
./scripts/install-argocd.sh
```

The script installs `ARGOCD_VERSION=v3.4.4` by default and uses server-side apply because Argo CD's install manifest includes large CRDs. Override `ARGOCD_VERSION` only after checking the release notes and Kubernetes compatibility.

Get the initial admin password:

```bash
./scripts/get-admin-password.sh
```

Open the UI with port-forwarding:

```bash
./scripts/port-forward-ui.sh
```

Then visit:

```text
https://localhost:8080
```

Username:

```text
admin
```

## Render the Application

Argo CD must pull from a Git repository. Push this repository to GitHub, GitLab, or another Git server first, then set `REPO_URL`.

```bash
REPO_URL=https://github.com/YOUR_ORG/devops-hands-on-practices.git ./scripts/render-application.sh
```

Optional overrides:

```bash
TARGET_REVISION=main
APP_PATH=12-argocd-gitops/gitops-repo/apps/course-web/overlays/dev
```

The rendered file is written to:

```text
reports/course-web-application.yaml
```

## Apply the Application

```bash
REPO_URL=https://github.com/YOUR_ORG/devops-hands-on-practices.git ./scripts/apply-application.sh
```

Argo CD will create the `docker-course-gitops` namespace and sync the app from Git.

Watch status:

```bash
./scripts/show-status.sh
```

Open the app:

```bash
curl http://localhost:8099
```

## Simulate Drift

Change the live Deployment manually:

```bash
./scripts/simulate-drift.sh
```

Argo CD should mark the application out of sync, then self-heal it back to the value declared in Git.

Check:

```bash
kubectl get deployment course-web -n docker-course-gitops -o jsonpath='{.spec.replicas}{"\n"}'
```

The desired dev overlay sets:

```text
replicas: 2
```

## Clean Up

Delete the Application and the k3d cluster:

```bash
./scripts/cleanup.sh
```

## Production Notes

For a real production setup:

- Use SSO and RBAC.
- Use separate Argo CD `AppProject` objects for teams or environments.
- Keep secrets out of plain Git. Use External Secrets, Sealed Secrets, SOPS, or a similar workflow.
- Use manual sync or approval gates for high-risk production changes.
- Use sync windows for planned maintenance periods.
- Monitor sync failures and degraded health.
- Treat prune as powerful. It deletes resources removed from Git.

## Exercises

Use the exercise track after you can render manifests locally:

```text
exercises/README.md
```

The exercises cover GitOps reconciliation, repo layout, Argo CD installation, Application rendering, sync, drift repair, and sync policy choices.

## References

- Argo CD getting started: https://argo-cd.readthedocs.io/en/stable/getting_started/
- Argo CD declarative setup: https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/
- Argo CD automated sync policy: https://argo-cd.readthedocs.io/en/stable/user-guide/auto_sync/
- Argo CD Application specification: https://argo-cd.readthedocs.io/en/stable/user-guide/application-specification/
- Argo CD App of Apps pattern: https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping/
- OpenGitOps principles: https://opengitops.dev/
