# Why BFF

| Situation | Strong Fit? | Reason |
| --- | --- | --- |
| Mobile app needs compact payloads and fewer round trips | Yes | client-specific response shaping is valuable |
| Web dashboard needs one aggregated page response | Yes | BFF can orchestrate a page-oriented response |
| All clients already consume the same simple domain APIs comfortably | No | another backend layer would add little value |
| One team wants to put domain business rules near the UI | No | BFF should not absorb core business logic |

