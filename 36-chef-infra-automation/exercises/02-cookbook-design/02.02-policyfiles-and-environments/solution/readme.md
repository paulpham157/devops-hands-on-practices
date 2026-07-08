# Policyfiles and Environments

1. The promoted environment may resolve a different dependency graph than the one tested.
2. The lock file shows exactly which cookbook versions and sources were validated.
3. `policyfiles/Policyfile.rb` is the first place to confirm the intended run list, then the lock file confirms the resolved set.
