# Trace Service Names and Startup Order

The FastAPI app should reach Redis by the service name `redis`.

`localhost` inside `web` points back to the `web` container itself, not the Redis container.

`depends_on` helps Compose start `redis` before `web`, but without health checks it does not prove Redis is ready to answer requests.
