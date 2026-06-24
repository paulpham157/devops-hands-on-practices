# Explainer: Run gRPC Service

gRPC models service methods instead of HTTP resources.

In this lesson:

```text
CatalogService.GetProduct(ProductRequest) returns ProductReply
```

The contract lives in:

```text
grpc-service/proto/catalog.proto
```

Python code is generated from the `.proto` file during Docker build.

gRPC is common for internal service-to-service APIs where typed contracts and efficient transport matter.

