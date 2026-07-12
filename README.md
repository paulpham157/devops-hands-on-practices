# DevOps Hands-on Practices

This repository is a practical DevOps learning workspace. It starts with Docker fundamentals, then expands into infrastructure automation, CI/CD, Kubernetes platforms, security, observability, cloud, distributed systems, reliability, and data pipeline practices.

The labs are designed to be runnable locally first. Cloud accounts are optional for most lessons; when a lesson touches AWS, Azure, Google Cloud, Artifactory, Datadog, or similar services, the core material still includes offline reading, validation, and design exercises.

## Repository Layout

| Area | Path | Purpose |
| --- | --- | --- |
| Docker foundations | `00-docker-fundamentals` | First images, Dockerfiles, multi-stage builds, distroless, layer, and cache examples |
| Main DevOps labs | `01-*` to `40-*` | Numbered hands-on lessons grouped by DevOps domain |

Start by opening any numbered lesson folder from the repository root.

For level-based study plans, specialization overlays, and resume guidance, see [Learning Paths](LEARNING_PATHS.md).

## How To Use This Repository

Use the root repository as a map, then work lesson by lesson inside the numbered folders.

Start with:

1. Pick a starting level from [Learning Paths](LEARNING_PATHS.md); add a specialization overlay after the shared core.
2. Read that lesson's `README.md` from top to bottom before running commands.
3. Run the lesson commands, examples, or exercises in the order described by the lesson.
4. Complete the exercises under `exercises/` before checking solution notes.
5. Run any cleanup commands from the lesson README so containers, VMs, or temporary files do not accumulate.

If you are contributing or editing lessons, see [CONTEXT.md](CONTEXT.md) for contributor context, validation scripts, and lesson authoring workflow.

## Study With AI

This repository includes two local Codex skills for AI-assisted learning under `.agents/skills/`.

If you use another agentic coding tool, copy `.agents` and rename the copy to the directory that tool expects. For example, Claude Code can use:

```sh
cp -av .agents .claude
```

Check that tool's documentation for its expected directory name.

### `dohp-how-to-learn`

Use this skill during a lesson when you want help choosing what to study, understanding the goal, working through a step, debugging a command, or getting a quiz at the end.

### `dohp-review-my-practice`

Use this skill after you have attempted an exercise or lab and want strict feedback on whether your work meets the lesson goal.

### Recommended Workflow

1. Start with `dohp-how-to-learn` to choose the lesson, understand the goal, and get a pre-lab checklist.
2. Read the lesson `README.md`.
3. Run the lesson steps, commands, or exercises yourself.
4. If you get blocked, keep using `dohp-how-to-learn` for hints and debugging.
5. After you finish your attempt, switch to `dohp-review-my-practice` for a strict review.
6. Check the solution notes only after you have tried the exercise yourself or explicitly want the full answer.

### How To Ask For Help Well

When using either skill, include the lesson folder, the exact step or exercise, the command you ran, the real output or failing line, and what you expected instead.

### Learning Rules

- Use AI as a learning partner, not as a shortcut to skip the lab.
- Read the lesson `README.md` before asking for help.
- Run the commands yourself instead of asking for answers first.
- Prefer hints before full solutions.
- Use real command output as evidence when asking for debugging help.
- Ask for review only after you have a real attempt to inspect.

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
