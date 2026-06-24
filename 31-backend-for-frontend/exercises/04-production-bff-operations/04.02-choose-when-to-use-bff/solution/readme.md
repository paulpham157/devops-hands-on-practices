# Choose When to Use BFF

1. Mobile BFF. Tradeoff: another backend surface to own and observe.
2. Web BFF. Tradeoff: fan-out orchestration and partial failure behavior become the BFF's responsibility.
3. API gateway only for now. Tradeoff: less client-specific optimization, but simpler architecture.
4. Do not use BFF for that. Tradeoff: domain logic stays where it belongs, even if the client team cannot change it as quickly.

The best BFF decision is usually the one that keeps client orchestration close to the client and business truth close to the domain.

