# Solution: Run gRPC Service

The host port is:

```text
5201
```

The product method is:

```text
GetProduct
```

The request message is:

```text
ProductRequest
```

Generated files:

```text
catalog_pb2.py
catalog_pb2_grpc.py
```

gRPC is less convenient to call manually because it uses Protobuf and HTTP/2 RPC semantics instead of plain JSON over simple HTTP URLs.

