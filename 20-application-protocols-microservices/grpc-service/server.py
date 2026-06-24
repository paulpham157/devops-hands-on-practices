from concurrent import futures

import grpc

import catalog_pb2
import catalog_pb2_grpc


def product_price(product_id):
    return 19.0 + (int(product_id) % 5) * 2 if product_id.isdigit() else 19.0


class CatalogService(catalog_pb2_grpc.CatalogServiceServicer):
    def GetProduct(self, request, context):
        return catalog_pb2.ProductReply(
            id=request.id,
            name=f"training-product-{request.id}",
            price=product_price(request.id),
            protocol="grpc",
        )

    def Health(self, request, context):
        return catalog_pb2.HealthReply(status="ok")


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=4))
    catalog_pb2_grpc.add_CatalogServiceServicer_to_server(CatalogService(), server)
    server.add_insecure_port("[::]:50051")
    server.start()
    print("gRPC catalog service listening on :50051", flush=True)
    server.wait_for_termination()


if __name__ == "__main__":
    serve()

