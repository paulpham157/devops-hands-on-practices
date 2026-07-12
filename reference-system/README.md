# Reference System: Order Flow

This is the shared, local-first system used by redesigned advanced lessons. It composes the Flask and Redis application from `01-docker-compose-flask-redis` rather than creating a second disconnected sample application.

## What It Models

```text
client -> gateway -> order API -> Redis cache / order queue -> worker
```

- **Gateway** is a deliberately small identity boundary: it requires an `X-Role` request header before forwarding traffic. It demonstrates a boundary only; it is not real authentication or authorization.
- **Order API** reuses lesson 01's Flask application, its `/healthz` endpoint, and its `POST /orders` queue endpoint.
- **Redis** provides cache state, a locally persistent queue list, and worker-result counters. It uses explicit snapshot backup/restore for the local DR drill. The initial worker uses at-most-once `BLPOP`; it is deliberately not a durable acknowledged-delivery design. A later recovery module will replace or extend it with an acknowledgement/requeue pattern.
- **Worker** consumes queue messages and records completed work.
- **Prometheus** scrapes API metrics for local observability practice.

The system is intentionally small. Production modules add observability, delivery, policy, recovery, scale, and failure overlays without replacing this system.

## Prerequisites

- Docker Engine with `docker compose`.
- `curl` for the local end-to-end check.
- Completion of lessons `00` and `01`, or equivalent evidence that you can build, run, inspect, and clean up a Compose application.

## Run

```sh
./scripts/up.sh
./scripts/check.sh
```

The check sends an order request through the gateway using the demo boundary, then confirms that the worker processed the queued order.

For the optional Prometheus overlay, which pulls an additional image:

```sh
./scripts/up.sh --observability
./scripts/check-observability.sh
```

## Inspect

```sh
docker compose ps
docker compose logs gateway api worker
docker compose exec redis redis-cli get completed_orders
```

Prometheus UI: <http://localhost:9098>.

## Scenario Overlays

| Scenario | Current consumer lessons | Learner evidence |
| --- | --- | --- |
| Dependency unavailable | 06, 16, 28 | Symptoms, hypothesis, mitigation, and recovery check. |
| Queue backlog | 19, 28, 32 | Queue-depth signal, SLO impact, capacity decision. |
| Unsafe delivery or drift | 10, 11, 12, 15 | Change plan, validation, rollback rationale. |
| Identity-boundary failure | 13, 14, 33 | Threat/risk note and safe access decision. |
| Data recovery | 27, 34 | Backup/restore decision and RPO/RTO rationale. |

Detailed game days and capstone assessments are still being added. Do not treat this reference system as a production deployment template.

The first runnable scenario is [Game Day 01: Redis Dependency Outage](game-days/01-redis-dependency-outage/README.md). It is a production-owner preparation exercise, not a certification.

## Service Objectives

[`slo/order-flow.yml`](slo/order-flow.yml) declares the local order-flow objectives and their deliberate limitations. It is a learning policy connected to lesson 32, not a customer-facing SLA or a claim that the local Compose stack enforces production objectives.

## Clean Up

```sh
./scripts/cleanup.sh
```

Use `./scripts/cleanup.sh --volumes` only when you intentionally want to remove the local Redis data used by scenarios.
