# Observability Exercises

These exercises extend lesson 06. Run the stack first:

```bash
cd hands-on-practice/06-observability-prometheus-grafana-loki
docker compose up --build
```

Each exercise has:

- `explainer/readme.md`: concept notes before doing the task.
- `problem/readme.md`: task instructions and verification commands.
- `solution/readme.md`: one possible solution and expected output.

## Exercise Order

1. `01.01-instrument-a-business-endpoint`
2. `01.02-query-golden-signals`
3. `02.01-parse-logs-with-alloy`
4. `02.02-debug-errors-with-logql`
5. `03.01-build-dashboard-and-alert`

## Completion Rule

For each exercise, finish only when you can verify the change from the running tools, not only from the file edit.

```text
edit -> restart or reload -> generate traffic -> query Prometheus/Loki/Grafana
```

