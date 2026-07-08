# Reset Volume and Confirm Data Loss

`docker compose down` stops and removes containers but keeps named volumes.

`docker compose down --volumes` also removes the named volume, so Redis starts empty and `page_hits` is rebuilt from zero.
