# Cache and Immutability

Remote repositories cache external dependencies. This improves build reliability and centralizes control over upstream package sources.

Release repositories should usually be immutable. A tag or version used by production should not be overwritten silently.

Retention policies prevent storage growth. Different lifecycle repos need different retention:

- dev repos can expire quickly.
- staging repos can keep recent candidates.
- release repos keep longer history.
- remote caches can delete unused cached artifacts.

