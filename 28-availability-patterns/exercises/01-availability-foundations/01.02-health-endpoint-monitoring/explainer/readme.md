# Health Endpoint Monitoring

Health endpoints answer different operational questions.

- liveness asks whether a process should be restarted
- readiness asks whether an instance should receive traffic
- deeper dependency health asks whether critical downstream systems are functioning

Confusing these layers leads to bad routing and unstable recovery.

