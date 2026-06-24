import grpc

import catalog_pb2
import catalog_pb2_grpc


with grpc.insecure_channel("127.0.0.1:50051") as channel:
    stub = catalog_pb2_grpc.CatalogServiceStub(channel)
    reply = stub.Health(catalog_pb2.HealthRequest(), timeout=2)
    if reply.status != "ok":
        raise SystemExit(1)

