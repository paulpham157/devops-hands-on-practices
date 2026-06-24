# Why Service Mesh

Teams usually consider a service mesh when too many network concerns leak into application code.

Common signals:

- every service reimplements retries and timeouts differently
- mTLS is required across many services
- service-to-service authorization is inconsistent
- traffic shifting and canary rollout need central control
- operators lack request-level visibility for east-west traffic

A service mesh centralizes these concerns in infrastructure instead of duplicating them in each service.

