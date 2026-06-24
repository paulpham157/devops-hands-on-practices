# Query Golden Signals

The four golden signals are:

- Latency: how long requests take.
- Traffic: how many requests arrive.
- Errors: how many requests fail.
- Saturation: how full the system is.

This lesson focuses on the first three. The sample app exports request counters and duration histograms. Prometheus turns those raw metrics into rates, ratios, and percentiles.

