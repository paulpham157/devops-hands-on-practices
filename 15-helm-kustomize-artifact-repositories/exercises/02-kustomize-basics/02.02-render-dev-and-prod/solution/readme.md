# Solution: Render Dev and Prod

Expected differences:

- dev should use a dev namespace and lower replica count.
- prod should use a prod namespace and higher replica count.
- dev and prod should use different image tags if they represent different release maturity.
- prod should normally have stronger resource requests and limits.
- ingress host and ConfigMap environment values can differ.

Risky differences:

- prod points to a mutable `latest` tag.
- prod has fewer replicas than intended.
- prod disables resource limits accidentally.
- prod uses a dev hostname or dev namespace.
- prod uses a different application config that was not reviewed.

