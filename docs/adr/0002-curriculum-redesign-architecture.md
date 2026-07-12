# ADR 0002: Competency-based curriculum redesign

## Status

Accepted for phased implementation.

## Context

The repository contains a broad, validated set of tool-oriented lessons. It needs a coherent progression that measures production judgment without claiming that a public course alone confers workplace seniority.

## Decisions

1. Keep lesson directories `00` through `40` stable during migration. A merge, split, rename, or deprecation needs a new ADR and a legacy migration entry.
2. Build one local-first reference system incrementally from the Compose app in lesson 01. It will be a small order-processing system with API, worker, Redis, persistent store, identity boundary, telemetry, and delivery configuration. Cloud-only variants are design exercises.
3. Assess four levels: foundation, delivery practitioner, production owner, and senior capstone. A senior capstone assesses curriculum evidence only, not employment seniority.
4. Keep `explainer`, `problem`, and `solution` public, but do not surface solutions in the normal learner path before an attempt. Review uses evidence and rubrics rather than a single expected answer.
5. Use a shared production-ownership core with DevOps, platform engineering, and SRE specialization overlays.

## Consequences

- Existing learners retain credit for validated lessons.
- New advanced content must attach to the reference system or explicitly justify why it cannot.
- Maintainers must keep the competency matrix, lesson inventory, migration guide, and validation gate aligned.
