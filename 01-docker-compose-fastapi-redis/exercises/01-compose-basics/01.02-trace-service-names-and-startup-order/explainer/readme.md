# Trace Service Names and Startup Order

Compose gives each service a stable DNS name on the default project network.

`web` can reach `redis` by the service name `redis`, not by `localhost`.

`depends_on` controls startup order hints, but it does not guarantee that the dependency is fully ready unless health checks are part of the design.
