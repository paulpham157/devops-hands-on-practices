# Add App Message

Environment variables are a common container configuration boundary.

Compose can inject variables into a service without baking them into the image. The FastAPI app can read the value at runtime with `os.environ`.

This keeps the same image reusable across environments.
