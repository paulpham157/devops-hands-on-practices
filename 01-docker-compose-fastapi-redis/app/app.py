import os

import uvicorn
from fastapi import FastAPI, HTTPException, Request, status
from fastapi.responses import HTMLResponse, Response
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
from prometheus_client import CONTENT_TYPE_LATEST, Counter, generate_latest
from redis.asyncio import Redis
from redis.exceptions import RedisError


app = FastAPI(title="Docker Compose Practice API")
templates = Jinja2Templates(directory="templates")

redis_client = Redis(
    host=os.environ.get("REDIS_HOST", "localhost"),
    port=int(os.environ.get("REDIS_PORT", "6379")),
    decode_responses=True,
)

orders_queued_total = Counter(
    "orders_queued_total",
    "Orders accepted by the local reference-system API.",
)


class OrderRequest(BaseModel):
    id: str


@app.get("/", response_class=HTMLResponse)
async def index(request: Request) -> HTMLResponse:
    try:
        hits = await redis_client.incr("page_hits")
    except RedisError as exc:
        raise HTTPException(status_code=503, detail="Redis is unavailable") from exc
    return templates.TemplateResponse(
        request=request,
        name="index.html",
        context={"hits": hits},
    )


@app.get("/healthz")
async def healthz() -> dict[str, str]:
    try:
        await redis_client.ping()
    except RedisError as exc:
        raise HTTPException(status_code=503, detail="Redis is unavailable") from exc
    return {"status": "ok"}


@app.post("/orders", status_code=status.HTTP_202_ACCEPTED)
async def create_order(payload: OrderRequest) -> dict[str, str]:
    order_id = payload.id.strip()
    if not order_id:
        raise HTTPException(
            status_code=400,
            detail="JSON field 'id' must be a non-empty string",
        )

    try:
        await redis_client.lpush("order_queue", order_id)
    except RedisError as exc:
        raise HTTPException(status_code=503, detail="Redis is unavailable") from exc
    orders_queued_total.inc()
    return {"status": "queued", "id": order_id}


@app.get("/metrics")
def metrics() -> Response:
    return Response(content=generate_latest(), media_type=CONTENT_TYPE_LATEST)


if __name__ == "__main__":
    host = os.environ.get("FASTAPI_HOST", "127.0.0.1")
    port = int(os.environ.get("FASTAPI_PORT", "5000"))
    uvicorn.run(app, host=host, port=port)
