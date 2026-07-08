# Tune Alert Threshold

Alert thresholds encode an operational decision.

The sample alert fires when the 5xx error ratio is above `0.05`. Lowering it to `0.01` makes the alert more sensitive, but it may also create noisy alerts in real services.

Tune alerts against user impact and error budget, not only against what is easy to query.
