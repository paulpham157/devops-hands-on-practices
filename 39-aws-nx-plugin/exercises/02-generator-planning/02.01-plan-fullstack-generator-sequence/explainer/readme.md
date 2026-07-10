# Explainer: Plan Full-Stack Generator Sequence

Generator order matters because later generators often attach to earlier projects.

A full-stack TypeScript shape usually needs:

1. workspace
2. website
3. API
4. auth
5. infrastructure
6. connection between website and API

Use `--dry-run` when planning inside an existing workspace so you can inspect intended changes before writing files.
