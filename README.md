# DevOps Hands-on Practices

This repository is a practical DevOps learning workspace. It starts with Docker fundamentals, then expands into infrastructure automation, CI/CD, Kubernetes platforms, security, observability, cloud, distributed systems, reliability, and data pipeline practices.

The labs are designed to be runnable locally first. Cloud accounts are optional for most lessons; when a lesson touches AWS, Azure, Google Cloud, Artifactory, Datadog, or similar services, the core material still includes offline reading, validation, and design exercises.

## Repository Layout

| Area | Path | Purpose |
| --- | --- | --- |
| Docker foundations | `00-docker-fundamentals` | Optional Vagrant VM, first images, Dockerfiles, multi-stage builds, distroless, layer, and cache examples |
| Main DevOps labs | `01-*` to `40-*` | Numbered hands-on lessons grouped by DevOps domain |

Start by opening any numbered lesson folder from the repository root.

For goal-specific study plans, see [Goal-Oriented Learning Paths](LEARNING_PATHS.md).

## How To Use This Repository

Use the root repository as a map, then work lesson by lesson inside the numbered folders.

Before starting:

- Install the local tools required by the lesson you want to study, such as `docker`, `kubectl`, `terraform`, `ansible`, or `packer`.
- Read the lesson `README.md` first to understand the goal, prerequisites, commands, and cleanup steps.
- Prefer lessons with local validation or offline exercises before moving to cloud-dependent topics.

Recommended lesson workflow:

1. Pick a lesson from the default sequence below or from [Goal-Oriented Learning Paths](LEARNING_PATHS.md).
2. Read that lesson's `README.md` from top to bottom before running commands.
3. Run `./scripts/validate.sh` inside the lesson directory when the script exists.
4. Complete the exercises under `exercises/` before checking solution notes.
5. Run any cleanup commands from the lesson README so containers, VMs, or temporary files do not accumulate.

Use the repository-level `./scripts/validate-all.sh` when you want a broad curriculum check. Use lesson-level validation when you are actively working on one topic and want faster feedback.

## Study With AI

This repository includes two local Codex skills for AI-assisted learning under `.agents/skills/`.

### `dohp-how-to-learn`

Use this skill when you want learning guidance during a lesson.

What it is good for:

- choosing the right lesson or learning path
- explaining the lesson goal in plain language
- giving a short pre-lab checklist
- guiding you through `./scripts/validate.sh`
- debugging command failures step by step
- giving hints before full answers
- ending with a recap, quiz, and next-lesson recommendation

Use it for requests like:

- "What lesson should I study next?"
- "Explain this lesson in simpler language."
- "Help me debug `./scripts/validate.sh`."
- "Quiz me after I finish this lesson."

### `dohp-review-my-practice`

Use this skill after you have already attempted an exercise or lab and want strict feedback.

What it is good for:

- reviewing command output, manifests, configs, or written answers
- comparing your attempt against the lesson goal
- identifying missing steps or missing verification
- pointing out concept mistakes, not just syntax issues
- deciding whether the exercise passes yet
- telling you the next concrete fix

Use it for requests like:

- "Review my work for this exercise."
- "Does this attempt meet the lesson goal?"
- "Show me what is missing in this manifest or config."
- "Grade this strictly against the exercise requirements."

### Recommended Workflow

Use the two skills in this order:

1. Start with `dohp-how-to-learn` to choose the lesson, understand the goal, and get a pre-lab checklist.
2. Read the lesson `README.md`.
3. Run the lesson steps and `./scripts/validate.sh` when available.
4. If you get blocked, keep using `dohp-how-to-learn` for hints and debugging.
5. After you finish your attempt, switch to `dohp-review-my-practice` for a strict review.
6. Check the solution notes only after you have tried the exercise yourself or explicitly want the full answer.

### How To Ask For Help Well

When using either skill, include:

- the lesson folder, such as `12-argocd-gitops`
- the exact exercise or step
- the command you ran
- the real output or failing line
- what you expected instead

Good example:

```text
Use dohp-how-to-learn for lesson 12-argocd-gitops.
I ran ./scripts/validate.sh and got "kubectl not found".
Explain the lesson goal, then give me the next debugging step without giving the full solution.
```

Good review example:

```text
Use dohp-review-my-practice for my attempt in 15-helm-kustomize-artifact-repositories/exercises.
Here is my manifest and validate.sh output.
Tell me whether it meets the lesson goal, list the gaps first, and give me the next fix.
```

Weak example:

```text
This lesson is broken. Fix it.
```

### Learning Rules

- Use AI as a learning partner, not as a shortcut to skip the lab.
- Read the lesson `README.md` before asking for help.
- Run the commands yourself instead of asking for answers first.
- Prefer hints before full solutions.
- Use real `validate.sh` output as evidence when asking for debugging help.
- Ask for review only after you have a real attempt to inspect.

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
| CI/CD, GitOps, and supply chain | `07`, `08`, `11`, `12`, `15`, `24`, `33`, `37` |
| Kubernetes and platform engineering | `02`, `09`, `25`, `26` |
| Observability and reliability | `06`, `16`, `28`, `32` |
| Cloud and identity | `13`, `14`, `21`, `22`, `38` |
| Configuration management | `03`, `35`, `36` |
| Distributed application architecture | `19`, `20`, `27`, `29`, `30`, `31` |
| Data engineering | `34` |
| AWS application scaffolding | `39` |
| Monorepo and workspace engineering | `40` |

## Suggested Learning Path

If you want a practical default path instead of choosing lessons by number alone, use this sequence:

1. Foundations: `00` to `05`
2. Core delivery and platform flow: `06` to `12`
3. Security, identity, and packaging: `13` to `16`
4. Runtime, systems, and application architecture: `17` to `20`
5. Cloud and platform comparison: `21` to `26`
6. Reliability, patterns, and data: `27` to `34`
7. Extended platform topics:
   - `35` Puppet after `03` if you want deeper configuration management
   - `36` Chef after `03` if you want cookbook and Policyfile workflows
   - `37` TeamCity after `07` and `08` if you want another enterprise CI model
   - `38` OpenStack after `21` and `25` if you want private-cloud platform context
   - `39` AWS Nx Plugin after `21`, `22`, and `23` if you want AWS full-stack app scaffolding
   - `40` Nx Workspace after `08` or `31` if you want monorepo, plugin, and CI scaling patterns

## Curriculum Coverage

| Lessons | Coverage | Notes |
| --- | --- | --- |
| `00-05` | Foundational hands-on, exercises, validation | Docker, Compose, Kubernetes, Ansible, Packer, Terraform |
| `06-14` | Platform labs, exercises, validation | Observability, CI/CD, K3s, OpenTofu, DevSecOps, GitOps, secrets, AWS identity |
| `15-24` | Advanced tooling, exercises, validation | Helm, Kustomize, artifacts, OTel, runtimes, Linux, protocols, cloud, serverless, IaC, Artifactory |
| `25-34` | Architecture and reliability patterns, exercises, validation | Managed platforms, service mesh, data management, availability, network, backend, SLOs, security quality gates, data pipeline |
| `35-40` | Additional platform and operations coverage, exercises, validation | Puppet, Chef, TeamCity, OpenStack private cloud, AWS Nx Plugin, and Nx workspace fundamentals |

## Lesson Maturity Matrix

| Lessons | Runnable local | Deep exercises | Validation | Live cloud optional | Notes |
| --- | --- | --- | --- | --- | --- |
| `00-05` | Yes | Yes | Yes | No | Foundation labs for Docker, Kubernetes, Ansible, Packer, and Terraform |
| `06-10` | Yes | Yes | Yes | Optional | Core platform labs for observability, CI/CD, K3s, and OpenTofu |
| `11-15` | Mostly yes | Yes | Yes | Optional | Security, GitOps, secrets, identity, Helm, Kustomize, and artifact patterns |
| `16-20` | Mostly yes | Yes | Yes | Optional | Telemetry, runtimes, Linux, caching, load balancing, and protocols |
| `21-24` | Offline-first | Yes | Yes | Yes | Cloud, serverless, IaC platforms, and artifact repository scenarios |
| `25-34` | Offline-first | Yes | Yes | Yes | Platform selection, architecture, reliability, network, backend, SLO, quality, and data pipeline patterns |
| `35-40` | Offline-first | Yes | Yes | Optional | Configuration management, enterprise CI, private cloud platform patterns, AWS app scaffolding, and workspace engineering |

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
git clone https://github.com/paulpham157/devops-hands-on-practices.git
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
