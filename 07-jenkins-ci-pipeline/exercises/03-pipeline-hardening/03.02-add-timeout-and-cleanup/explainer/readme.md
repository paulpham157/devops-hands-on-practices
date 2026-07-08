# Add Timeout and Cleanup

CI jobs should fail predictably.

A timeout prevents stuck builds from consuming executors indefinitely. Cleanup steps remove containers even when tests fail.

The sample already removes the smoke-test container in a `post` block. This exercise adds a global timeout and verifies cleanup behavior.
