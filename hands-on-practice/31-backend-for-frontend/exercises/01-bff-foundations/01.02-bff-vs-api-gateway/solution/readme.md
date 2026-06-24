# BFF vs API Gateway

| Responsibility | Best Fit |
| --- | --- |
| TLS termination | API Gateway |
| Rate limiting | API Gateway |
| Aggregate one dashboard response for web | BFF |
| Shape compact mobile payloads | BFF |
| Generic routing by path and host | API Gateway |

Mixing them carelessly creates unclear ownership and a boundary component that is hard to evolve safely.

