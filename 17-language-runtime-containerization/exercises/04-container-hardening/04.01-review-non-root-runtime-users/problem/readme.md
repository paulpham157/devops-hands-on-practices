# Review Non-root Runtime Users

## Task

Read each app Dockerfile under `apps/`.

For each language, answer:

1. Does the runtime stage define a non-root user?
2. Which files must be readable by that user?
3. Would the app still bind to its configured port?
4. Which Dockerfile would you harden first?

## Done When

You can name the runtime user posture for all five services and propose one safe hardening change.
