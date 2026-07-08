# Limit Concurrency and Failed Build Drift

Typical controls:

- disable concurrent builds or use pipeline options that serialize job runs
- clean the workspace before or after builds
- keep artifacts intentionally instead of leaving random files in the workspace

The goal is deterministic job behavior, especially after failures or retries.
