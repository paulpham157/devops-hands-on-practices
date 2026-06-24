# Solution: Hit, Miss, and Invalidation

Expected sequence:

1. First `GET /product/7`: miss.
2. Second `GET /product/7`: hit.
3. `DELETE /cache/7`: deletes `lesson19:product:7`.
4. Third `GET /product/7`: miss again.

Stale data can happen when the origin changes but the cached value has not expired or been invalidated.

Explicit invalidation is better when the system knows a write changed data that readers must see quickly.

