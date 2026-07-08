# Debug Rollout Events and Pod Status

Suggested order:

1. `kubectl rollout status` to confirm the Deployment is stalled.
2. `kubectl get pods` to see high-level state such as `Pending`, `CrashLoopBackOff`, or `ImagePullBackOff`.
3. `kubectl describe pod` to inspect container state, probes, mounts, and recent events.
4. `kubectl get events` to review cluster-level scheduling or pull failures.

Logs are still useful, but only after the resource state points to the failing area.
