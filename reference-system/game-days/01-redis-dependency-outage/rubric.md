# Review Rubric: Redis Dependency Outage

| Criterion | Insufficient | Meets production-owner preparation | Strong evidence |
| --- | --- | --- | --- |
| Detection and impact | Claims an outage without checking the user journey. | Shows request or service evidence and states impact. | Separates confirmed impact, uncertainty, and affected scope. |
| Investigation | Guesses a cause or changes code immediately. | Checks gateway, API, Redis, and worker states. | Uses logs/metrics/status to test competing hypotheses. |
| Mitigation | Restarts components without a reason. | States a safe mitigation and recovery boundary. | Explains user communication and tradeoffs. |
| Recovery | Declares success without verification. | Verifies the reference-system journey after recovery. | Identifies residual risk and a follow-up check. |
| SLO and follow-up | Names an SLO without connecting it to the event. | Explains the objective and local measurement limits. | Prioritizes concrete, blameless risk/toil reductions. |
