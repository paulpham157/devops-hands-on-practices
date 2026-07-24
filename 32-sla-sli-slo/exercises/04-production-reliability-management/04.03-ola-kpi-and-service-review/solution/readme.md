# OLA, KPI, and Service Review

One acceptable design is:

- **SLI:** percentage of accepted orders that receive a successful API response within one second.
- **SLO:** 99.9 percent over 30 days.
- **SLA:** provide a service credit when the externally measured order API falls below 99.5 percent, with documented exclusions.
- **OLA:** Platform acknowledges a P1 Redis or gateway alert within five minutes, starts escalation within ten minutes, and keeps the application team informed until recovery is verified.
- **KPI 1:** change failure rate; a worsening trend triggers release review and rollback analysis.
- **KPI 2:** cost per accepted order; a worsening trend triggers capacity and cost investigation.

The OLA describes an internal response path. The KPIs describe operating and economic trends. Neither one replaces the user-focused SLI/SLO.
