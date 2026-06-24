FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY proto ./proto
RUN python -m grpc_tools.protoc -I./proto --python_out=. --grpc_python_out=. ./proto/catalog.proto

COPY server.py client.py healthcheck.py .

RUN useradd --uid 10001 --create-home appuser
USER appuser

EXPOSE 50051

CMD ["python", "server.py"]

