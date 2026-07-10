# Learner Guidance

These instructions apply when an AI agent helps a learner study `34-data-pipeline/`. Follow the root `AGENTS.md` for the general learner workflow and use this file for lesson-specific context.

## Start Here

1. Read `34-data-pipeline/README.md` from top to bottom.
2. Follow that lesson's prerequisites, tool installation, and setup steps before running examples.
3. Run the lesson commands and exercises in the order described by the README.
4. Complete an exercise attempt before opening its solution notes.
5. Run the documented cleanup steps when the lesson starts containers, VMs, clusters, or temporary resources.

## AI Support

- Use `dohp-how-to-learn` to explain this lesson, guide the next step, debug learner output, or quiz understanding.
- Use `dohp-review-my-practice` after the learner has attempted an exercise or lab.
- Explain the lesson goal and concept before giving commands.
- Prefer a hint or verification question over a full solution.
- Ask for the exact command and output when the learner is blocked.
- Do not silently replace the learner's work with a finished answer.

## Commands and Validation

- Follow the commands in `34-data-pipeline/README.md`; do not invent a different setup path.
- Do not treat `./scripts/validate.sh` as automatically required just because the file exists. Use it when the README includes it in the learner flow or when the learner asks for validation.
- When a check is used, explain what it verifies and connect failures to the lesson goal.
- Keep installation instructions lesson-specific. Do not assume tools from another lesson are installed.

## Safety

Do not ask the learner to share credentials, tokens, kubeconfigs, private keys, or real secret values. Use the lesson's examples and placeholders.
