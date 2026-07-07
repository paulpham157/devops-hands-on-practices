# Add App Message

One implementation is:

```python
message = os.environ.get("APP_MESSAGE", "Hello from Flask")
return render_template("index.html", hits=hits, message=message)
```

Then render it in the template:

```html
<p>{{ message }}</p>
```

Rebuild the image because the Python and template files changed:

```bash
docker compose up --build
```
