# Read a Pipeline Config

CI systems turn YAML into a graph of jobs.

A useful first pass is to identify:

- Trigger: what event starts the pipeline.
- Jobs: independent units of work.
- Dependencies: which jobs wait for another job.
- Runner image: the environment used by the job.
- Script or steps: the commands that run.
- Artifacts: files retained after the job finishes.

GitHub Actions uses `on`, `jobs`, `runs-on`, and `steps`.

GitLab CI uses `stages`, job names, `image`, `script`, and `artifacts`.
