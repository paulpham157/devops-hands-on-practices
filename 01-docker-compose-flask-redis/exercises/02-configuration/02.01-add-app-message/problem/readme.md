# Add App Message

## Task

Add an environment variable to the `web` service:

```yaml
environment:
  APP_MESSAGE: "Hello from Compose"
```

Update `app/app.py` to read `APP_MESSAGE` and pass it to the template. Update `app/templates/index.html` to render the message.

## Done When

The browser page shows the custom message and the counter still works.
