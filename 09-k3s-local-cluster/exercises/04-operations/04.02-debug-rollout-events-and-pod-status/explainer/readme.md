# Debug Rollout Events and Pod Status

When a Kubernetes rollout fails, the fastest path is usually:

1. inspect rollout status
2. inspect Pod status
3. read events
4. inspect logs only after the resource state is understood

Events often explain image, scheduling, probe, or config problems more directly than logs.
