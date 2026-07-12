# Game Day 01: Redis Dependency Outage

This is a production-owner exercise for the reference order-flow system. Run it only after completing the reference-system smoke check and lessons 06, 16, 28, and 32, or after demonstrating equivalent evidence.

## Scenario

The order API depends on Redis for both its page counter and order queue. During a normal working period, Redis becomes unavailable. The gateway stays up, but requests that need Redis cannot complete.

Your job is to detect the impact, protect users, communicate what is known, recover safely, and record follow-up work. Do not read `facilitator-notes.md` until you have made an attempt or your facilitator explicitly permits it.

## Safety and Setup

This scenario uses only the local Docker Compose reference system. It does not require cloud credentials or real customer data.

```sh
cd reference-system
./scripts/up.sh
./scripts/check.sh
```

Open a timeline from [evidence/incident-template.md](evidence/incident-template.md) before injecting the fault.

## Inject the Fault

```sh
./scripts/inject-redis-outage.sh
```

Do not inspect the script before your first attempt if you want the scenario to remain blind. The command affects only the local `redis` container.

## Your Tasks

1. Establish the user-visible impact with a reproducible request.
2. Identify which components are healthy, unhealthy, or uncertain. Record evidence, not guesses.
3. State a mitigation decision: what would you communicate or limit while the dependency is unavailable?
4. Recover the dependency safely and verify the user journey again.
5. Write a blameless incident summary and two prioritized follow-up actions.
6. Relate the event to the declared SLO policy, including what the local lab can and cannot measure.

Do not change application code just to make the scenario disappear. If you make a mitigation change, explain its tradeoff and rollback boundary.

## Recovery and Cleanup

```sh
./scripts/recover-redis.sh
./scripts/check.sh
./scripts/cleanup.sh
```

## Evidence Required

Submit or retain:

- incident timeline with timestamps;
- request, log, metric, or container-status evidence;
- impact and mitigation statement;
- recovery verification;
- SLO/error-budget interpretation with limitations;
- blameless postmortem and prioritized follow-up actions.

Use [rubric.md](rubric.md) to review your work after the attempt.
