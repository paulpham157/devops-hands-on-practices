# Facilitator Notes: Worker Interruption

The intended learning point is not that every processing entry should be requeued. In a real workflow, the learner must know whether the external side effect occurred and whether the order operation is idempotent. Accept different recovery decisions when they are evidence-backed.

The local worker may not leave a processing entry in every timing run. If that happens, ask the learner to explain the race and demonstrate the intended state using the migration exercise rather than inventing evidence.
