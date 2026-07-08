plan puppet::remediate(
  TargetSpec $targets,
) {
  run_task('healthcheck', $targets)
}
