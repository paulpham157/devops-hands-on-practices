# Change Published Port

Compose port mappings use `HOST:CONTAINER`.

The FastAPI app listens on port `5000` inside the container. The lesson publishes it as `5001:5000`, so requests to `localhost:5001` reach the container.

Changing the host port does not change the FastAPI process. It only changes how your workstation reaches the service.
