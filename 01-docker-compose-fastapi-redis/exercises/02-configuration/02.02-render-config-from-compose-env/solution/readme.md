# Render Config from Compose Environment

Typical pattern:

```python
app_message = os.environ.get("APP_MESSAGE", "Hello from Compose")
```

Then pass `app_message` into the template response so the page reflects the runtime configuration instead of a hardcoded string.
