# Limit Concurrency and Failed Build Drift

## Task

Review the Jenkins pipeline and propose two controls:

1. One control that prevents overlapping or duplicate builds from fighting each other.
2. One control that reduces stale workspace or failed-build residue.

Then explain where each control belongs: Jenkins job setting, Jenkinsfile option, or cleanup step.

## Done When

You can explain how concurrency and stale build state create misleading CI behavior.
