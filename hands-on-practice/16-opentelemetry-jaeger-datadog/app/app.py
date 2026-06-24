import os
import random
import time
from datetime import datetime, timezone

from flask import Flask, request
from opentelemetry import trace
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor, ConsoleSpanExporter
from opentelemetry.trace import Status, StatusCode


SERVICE_NAME = os.environ.get("OTEL_SERVICE_NAME", "course-otel-app")
SERVICE_VERSION = os.environ.get("OTEL_SERVICE_VERSION", "dev")
DEPLOYMENT_ENVIRONMENT = os.environ.get("OTEL_DEPLOYMENT_ENVIRONMENT", "local")
OTLP_ENDPOINT = os.environ.get("OTEL_EXPORTER_OTLP_ENDPOINT", "otel-collector:4317")


def configure_tracing():
    resource = Resource.create(
        {
            "service.name": SERVICE_NAME,
            "service.version": SERVICE_VERSION,
            "deployment.environment.name": DEPLOYMENT_ENVIRONMENT,
        }
    )
    provider = TracerProvider(resource=resource)
    provider.add_span_processor(
        BatchSpanProcessor(OTLPSpanExporter(endpoint=OTLP_ENDPOINT, insecure=True))
    )

    if os.environ.get("OTEL_CONSOLE_EXPORTER") == "true":
        provider.add_span_processor(BatchSpanProcessor(ConsoleSpanExporter()))

    trace.set_tracer_provider(provider)
    return trace.get_tracer(__name__)


tracer = configure_tracing()
app = Flask(__name__)


def trace_id():
    span_context = trace.get_current_span().get_span_context()
    return format(span_context.trace_id, "032x")


def sleep_ms(low, high):
    duration = random.uniform(low, high) / 1000
    time.sleep(duration)
    return round(duration * 1000, 2)


@app.get("/")
def index():
    with tracer.start_as_current_span("GET /") as span:
        span.set_attribute("http.route", "/")
        span.set_attribute("http.method", request.method)
        span.add_event("homepage rendered")
        return {
            "service": SERVICE_NAME,
            "message": "OpenTelemetry tracing practice",
            "trace_id": trace_id(),
            "try": ["/checkout", "/checkout?slow=true", "/checkout?fail=true"],
        }


@app.get("/checkout")
def checkout():
    slow = request.args.get("slow") == "true"
    fail = request.args.get("fail") == "true"

    with tracer.start_as_current_span("GET /checkout") as span:
        span.set_attribute("http.route", "/checkout")
        span.set_attribute("http.method", request.method)
        span.set_attribute("checkout.slow", slow)
        span.set_attribute("checkout.fail", fail)
        span.set_attribute("request.started_at", datetime.now(timezone.utc).isoformat())

        with tracer.start_as_current_span("inventory.lookup") as inventory_span:
            inventory_ms = sleep_ms(80 if slow else 15, 260 if slow else 45)
            inventory_span.set_attribute("inventory.items_checked", 3)
            inventory_span.set_attribute("work.duration_ms", inventory_ms)

        with tracer.start_as_current_span("payment.authorize") as payment_span:
            payment_ms = sleep_ms(450 if slow else 25, 950 if slow else 80)
            payment_span.set_attribute("payment.provider", "training-gateway")
            payment_span.set_attribute("work.duration_ms", payment_ms)

            if fail:
                error = RuntimeError("payment authorization rejected")
                payment_span.record_exception(error)
                payment_span.set_status(Status(StatusCode.ERROR, str(error)))
                span.record_exception(error)
                span.set_status(Status(StatusCode.ERROR, str(error)))
                return {
                    "status": "failed",
                    "error": str(error),
                    "trace_id": trace_id(),
                }, 500

        span.set_status(Status(StatusCode.OK))
        return {
            "status": "ok",
            "trace_id": trace_id(),
            "inventory_ms": inventory_ms,
            "payment_ms": payment_ms,
        }


@app.get("/healthz")
def healthz():
    return {"status": "ok"}


if __name__ == "__main__":
    host = os.environ.get("FLASK_HOST", "127.0.0.1")
    port = int(os.environ.get("FLASK_PORT", "5000"))
    app.run(host=host, port=port)

