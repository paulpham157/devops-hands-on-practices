# Path Routing

Use this file when the learner asks what to study next or which path fits their goal.

## Inputs To Consider

- learner background
- target role
- time budget
- whether they want local hands-on work or architecture reasoning
- whether they care more about CI/CD, Kubernetes, IaC, security, cloud, or reliability

## Default Routing

### New to DevOps

Use when the learner has basic terminal familiarity but weak DevOps foundations.

Start with:

1. `18-linux-unix-fundamentals`
2. `00-docker-fundamentals`
3. `01-docker-compose-flask-redis`

### Job-ready junior DevOps

Use when the learner wants a practical entry-level path.

Start with:

1. `00-docker-fundamentals`
2. `01-docker-compose-flask-redis`
3. `02-kubernetes-nginx`
4. `03-ansible-docker-host`

### Docker and Kubernetes first

Use when the learner mainly wants containers and platform basics.

Start with:

1. `00-docker-fundamentals`
2. `01-docker-compose-flask-redis`
3. `17-language-runtime-containerization`
4. `02-kubernetes-nginx`

### CI/CD and release engineering

Use when the learner mainly wants delivery pipelines and release flow.

Start with:

1. `00-docker-fundamentals`
2. `04-packer-docker-image`
3. `07-jenkins-ci-pipeline`
4. `08-github-actions-gitlab-ci`

### IaC and automation

Use when the learner mainly wants provisioning and config management.

Start with:

1. `03-ansible-docker-host`
2. `04-packer-docker-image`
3. `05-terraform-docker-container`
4. `10-opentofu-docker-module`

### Platform engineering and SRE

Use when the learner cares about operability, reliability, and production systems.

Start with:

1. `02-kubernetes-nginx`
2. `06-observability-prometheus-grafana-loki`
3. `09-k3s-local-cluster`
4. `12-argocd-gitops`

## Output Style

When recommending a path:

1. name the best-fit path
2. explain why it fits this learner
3. give the next 1 to 3 lessons only
4. say what the learner will be able to do after those lessons
