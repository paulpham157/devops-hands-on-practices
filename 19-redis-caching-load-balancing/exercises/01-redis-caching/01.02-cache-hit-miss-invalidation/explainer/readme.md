# Explainer: Hit, Miss, and Invalidation

A cache hit means Redis had the value.

A cache miss means the app had to call the slow origin.

Invalidation removes a cached value before TTL expiry.

Common invalidation approaches:

- delete one key after write.
- use short TTL.
- version keys.
- publish an invalidation event.
- refresh cache in the background.

Invalidation is hard because every writer must agree which cached reads are affected.

