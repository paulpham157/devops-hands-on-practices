import os
import sys

import grpc

import catalog_pb2
import catalog_pb2_grpc


def main():
    target = os.environ.get("GRPC_TARGET", "localhost:50051")
    product_id = sys.argv[1] if len(sys.argv) > 1 else "42"
    with grpc.insecure_channel(target) as channel:
        stub = catalog_pb2_grpc.CatalogServiceStub(channel)
        product = stub.GetProduct(catalog_pb2.ProductRequest(id=product_id), timeout=3)
        print(
            {
                "id": product.id,
                "name": product.name,
                "price": product.price,
                "protocol": product.protocol,
                "target": target,
            }
        )


if __name__ == "__main__":
    main()

