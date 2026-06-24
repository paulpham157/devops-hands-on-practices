# Choose the Right SLI and SLO

1. Use a strict user-journey SLI and tighter SLO. Tradeoff: less budget for risky change.
2. Use a looser SLO or separate SLI so optional failure does not dominate critical-path objectives. Tradeoff: feature reliability may visibly vary.
3. Use internal SLOs before publishing an SLA. Tradeoff: no formal customer commitment yet.
4. Define the SLI so valid zero results are good events and backend failure remains bad. Tradeoff: measurement logic must distinguish semantic zero from system failure.

The wrong objective is usually the one that looks precise but does not reflect user value.

