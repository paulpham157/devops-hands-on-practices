# Solution: Contracts and Schemas

`/products/{productId}` is defined in:

```text
rest-api/openapi.yaml
```

`GetProduct` is defined in:

```text
grpc-service/proto/catalog.proto
```

GraphQL `Query` is defined in:

```text
protocol-specs/schema.graphql
```

The `catalog.product.changed` event channel is defined in:

```text
protocol-specs/asyncapi.yaml
```

Contracts should be reviewed in pull requests because they define integration promises between teams and services.

