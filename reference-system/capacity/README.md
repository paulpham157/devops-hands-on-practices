# Capacity and Cost Exercise

This production-owner exercise connects a small local load test to capacity and cost decisions. It does not generate a production capacity number: laptop resources, Docker settings, and the at-most-once worker make that impossible. Its purpose is to form and test a measurable hypothesis.

## Prerequisites

- Complete the reference-system smoke check.
- Install [`hey`](https://github.com/rakyll/hey) only if you want to run the optional local load command.
- Keep the request count small on a laptop. Do not run the command against a shared or production endpoint.

## Exercise

1. Copy assumptions into [capacity-decision-template.md](capacity-decision-template.md).
2. State a bottleneck hypothesis: gateway, API, Redis, worker, or client.
3. If `hey` is available, run a bounded test:

   ```sh
   ./scripts/load-orders.sh --requests 100 --concurrency 5
   ```

4. Inspect queue depth, worker completion, and API/Prometheus signals where available.
5. Decide which signal would trigger scale-out, admission control, or feature degradation in a real environment.
6. Complete [cost-model-template.md](cost-model-template.md) using explicit unit-cost assumptions; do not invent provider pricing.

## Evidence Required

- command output or a stated reason the load command was not run;
- bottleneck hypothesis and result;
- capacity threshold and scaling/degradation decision;
- cost drivers, budget guardrail, and validation plan;
- limitations of the local exercise.

This exercise maps to lessons 19, 28, and 32, plus the FinOps gap in the competency matrix.
