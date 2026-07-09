# Solution: Review CI Cache Risk

1. Wrong base branch can under-run or over-run affected tasks.
2. Uncommitted generated clients can make local and CI behavior diverge.
3. Missing env inputs can produce unsafe cache hits.
4. Missing graph edges can skip dependent project tasks.
5. Deployment tasks should be environment-aware and often should not reuse generic cached output blindly.

The common theme is that Nx can optimize only the model it sees.
