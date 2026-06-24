#!/usr/bin/env sh
set -eu

cd grpc-service
python3 -m grpc_tools.protoc -I./proto --python_out=. --grpc_python_out=. ./proto/catalog.proto
echo "Generated grpc-service/catalog_pb2.py and grpc-service/catalog_pb2_grpc.py"

