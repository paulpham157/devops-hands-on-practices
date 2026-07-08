# DevOps Hands-on Practices

This repository is a practical DevOps learning workspace. It starts with Docker fundamentals, then expands into infrastructure automation, CI/CD, Kubernetes platforms, security, observability, cloud, distributed systems, reliability, and data pipeline practices.

The labs are designed to be runnable locally first. Cloud accounts are optional for most lessons; when a lesson touches AWS, Azure, Google Cloud, Artifactory, Datadog, or similar services, the core material still includes offline reading, validation, and design exercises.

## Repository Layout

| Area | Path | Purpose |
| --- | --- | --- |
| Docker foundations | `00-docker-fundamentals` | Optional Vagrant VM, first images, Dockerfiles, multi-stage builds, distroless, layer, and cache examples |
| Main DevOps labs | `01-*` to `34-*` | Numbered hands-on lessons grouped by DevOps domain |

Start by opening any numbered lesson folder from the repository root.

## Validate the Lessons

Run all available lesson checks from the repository root:

```bash
./scripts/validate-all.sh
```

Lesson validation is local-first. Scripts check required files and syntax, then run optional tool checks only when the matching CLI is installed and usable.

## DevOps Practice Areas

The numbered lesson folders stay stable so links and exercises do not move, but the curriculum is organized around these DevOps areas:

| DevOps area | Lessons |
| --- | --- |
| Container foundations | `00`, `01`, `17`, `18` |
| Infrastructure automation and IaC | `03`, `04`, `05`, `10`, `23` |
| CI/CD, GitOps, and supply chain | `07`, `08`, `11`, `12`, `15`, `24`, `33` |
| Kubernetes and platform engineering | `02`, `09`, `25`, `26` |
| Observability and reliability | `06`, `16`, `28`, `32` |
| Cloud and identity | `13`, `14`, `21`, `22` |
| Distributed application architecture | `19`, `20`, `27`, `29`, `30`, `31` |
| Data engineering | `34` |

## Curriculum Coverage

| Lessons | Coverage | Notes |
| --- | --- | --- |
| `00-05` | Foundational hands-on, exercises, validation | Docker, Compose, Kubernetes, Ansible, Packer, Terraform |
| `06-14` | Platform labs, exercises, validation | Observability, CI/CD, K3s, OpenTofu, DevSecOps, GitOps, secrets, AWS identity |
| `15-24` | Advanced tooling, exercises, validation | Helm, Kustomize, artifacts, OTel, runtimes, Linux, protocols, cloud, serverless, IaC, Artifactory |
| `25-34` | Architecture and reliability patterns, exercises, validation | Managed platforms, service mesh, data management, availability, network, backend, SLOs, security quality gates, data pipeline |

## Lesson Maturity Matrix

| Lessons | Runnable local | Deep exercises | Validation | Live cloud optional | Notes |
| --- | --- | --- | --- | --- | --- |
| `00-05` | Yes | Yes | Yes | No | Foundation labs for Docker, Kubernetes, Ansible, Packer, and Terraform |
| `06-10` | Yes | Yes | Yes | Optional | Core platform labs for observability, CI/CD, K3s, and OpenTofu |
| `11-15` | Mostly yes | Yes | Yes | Optional | Security, GitOps, secrets, identity, Helm, Kustomize, and artifact patterns |
| `16-20` | Mostly yes | Yes | Yes | Optional | Telemetry, runtimes, Linux, caching, load balancing, and protocols |
| `21-24` | Offline-first | Yes | Yes | Yes | Cloud, serverless, IaC platforms, and artifact repository scenarios |
| `25-34` | Offline-first | Yes | Yes | Yes | Platform selection, architecture, reliability, network, backend, SLO, quality, and data pipeline patterns |

Use `Runnable local` for lessons that can be executed mainly with local tools. Use `Offline-first` for lessons where the core exercise is design, reading, validation, or scenario analysis without requiring paid cloud resources.

Time-sensitive lessons should prefer current tool names and supported paths:

- Use `docker compose` instead of legacy `docker-compose`.
- Use Grafana Alloy for new Loki collection examples; Promtail is only legacy context.
- Treat CDKTF as deprecated context, not a recommended new IaC path.
- Refer to Google Cloud Functions 2nd gen as Cloud Run functions where relevant.
- Pin CI runner images or document the update policy for production examples.

## Optional Vagrant Lab

You can run most lessons directly on a workstation with Docker Desktop or Docker Engine. The Vagrant setup is optional and useful when you want a disposable Linux VM for Docker practice.

### Install VirtualBox

You need administrator permission on the workstation for VirtualBox.

Download VirtualBox from:

```text
https://www.virtualbox.org/wiki/Downloads
```

### Install Vagrant

Download Vagrant from:

```text
https://developer.hashicorp.com/vagrant/downloads
```

Restart the workstation after installing VirtualBox and Vagrant.

### Bring Up the VM

Clone this repository:

```bash
git clone https://github.com/YOUR_ORG/devops-hands-on-practices.git
```

Open a terminal and move into the lab setup:

```bash
cd devops-hands-on-practices/00-docker-fundamentals/examples/lab-setup
```

Start the VM:

```bash
vagrant up
```

Check VM status:

```bash
vagrant status
```

Connect to the VM:

```bash
vagrant ssh Docker
```

### Stop or Destroy the VM

Stop the VM when you are not using it:

```bash
vagrant halt
```

Destroy the VM and its local state:

```bash
vagrant destroy -f
```
