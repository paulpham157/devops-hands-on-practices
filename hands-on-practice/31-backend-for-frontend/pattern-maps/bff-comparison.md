# BFF Comparison

| Shape | Good Fit | Benefit | Main Cost |
| --- | --- | --- | --- |
| Shared generic API only | clients are similar and service APIs already fit them | fewer backend surfaces | clients may become chatty or overfetch |
| Web BFF | browser app needs aggregated, UI-shaped responses | faster web page composition | extra orchestration layer |
| Mobile BFF | mobile app needs compact responses and reduced round trips | better mobile latency and payload control | another backend surface to operate |
| One BFF for every client type | clients truly diverge in behavior and ownership | clean client boundaries | risk of duplicated client orchestration logic |

