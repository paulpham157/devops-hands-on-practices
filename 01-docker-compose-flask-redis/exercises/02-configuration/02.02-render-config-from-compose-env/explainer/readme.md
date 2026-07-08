# Render Config from Compose Environment

Compose can inject environment variables into a container at start time.

This is useful for simple runtime configuration because the image stays the same while values change per environment.

The application still needs explicit code to read the variable and expose it in a useful way.
