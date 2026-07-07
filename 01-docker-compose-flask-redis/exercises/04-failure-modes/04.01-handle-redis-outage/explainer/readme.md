# Handle Redis Outage

Distributed apps fail at service boundaries.

In this lesson the Flask app depends on Redis. If Redis is down, the app should fail clearly instead of returning a confusing traceback or hanging.

Good local labs make failures observable.
