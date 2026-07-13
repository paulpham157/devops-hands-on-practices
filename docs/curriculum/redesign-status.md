# Curriculum Redesign Status

This is the current evidence-backed status of the redesign described in `CONTEXT.md`. “Complete” here means the repository artifact and its checks exist; it does not claim learner or workplace outcomes that have not been observed.

| Phase | Status | Evidence | Remaining gate |
| --- | --- | --- | --- |
| 0. Baseline and decisions | Complete | ADR 0002, personas, competency matrix, workstream register, metadata manifest | Maintainer review of future scope changes. |
| 1. Curriculum map and structural fixes | Complete | 41 lesson contracts, entry/cleanup sections, exercise parity, local validators | Continue improving lesson depth where a competency is still conceptual. |
| 2. Practitioner integration | Complete | Level paths, resume map, reference system, cross-lesson delivery project | Keep path migration notes current when lessons change. |
| 3. Production ownership | Implemented and runtime-verified for local core | Game days, capacity/FinOps, DR, migration, policy/platform modules; full validation; reference core/DR/worker/Prometheus smoke checks | Add more failure scenarios and production implementations over time. |
| 4. Senior capstone and pilot | Framework ready; pilot pending | Public brief, artifacts, rubric, defense protocol, pilot plan and calibration record | Run at least three anonymized pilots and record reviewer disagreement. |
| 5. Migration and stable release | Workflow ready; release pending | Legacy mapping, release-readiness gates, manual draft-release workflow | Complete pilot gates, write curated notes, then perform editorial review. |

## Verification Snapshot

- `./scripts/validate-all.sh`: pass on the current worktree.
- Reference core smoke: pass.
- Redis backup/restore and worker reconnect: pass.
- Optional Prometheus target and `orders_queued_total` query: pass.
- Capstone pilot calibration: no learner records yet; do not infer completion.

## Maintainer Rule

Do not change “pilot pending” or “release pending” to complete based on intent, a green structural validator, or a self-authored example. Update those rows only with the evidence named in the remaining gate.
