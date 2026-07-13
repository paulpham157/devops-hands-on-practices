# Policy-as-Code Exercise

This exercise turns production constraints into a deterministic local policy check. It is intentionally small and provider-neutral; the same decisions can later be implemented with OPA, Kyverno, Sentinel, or a cloud-native policy engine.

## Run

```sh
python3 policy/validate_policy.py policy/input.json
```

The checked-in input is expected to pass. Make a copy before experimenting so the baseline remains reviewable.

## Policy Decisions

The check requires:

- an accountable service owner;
- an SLO reference;
- non-root runtime intent;
- an explicit network-policy boundary;
- immutable image tags;
- a monthly budget at or below the capstone target.

These are educational guardrails, not a universal production policy. A real team needs an exception workflow, policy versioning, audit evidence, and a way to distinguish a deliberate exception from an accidental bypass.

## Evidence

Retain the policy output, the changed input, the reason for any exception, and the reviewer/expiry signal. Do not paste real secrets into the input file.
