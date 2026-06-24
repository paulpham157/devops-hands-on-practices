# Read-Write Separation with CQRS

1. `orders_write_db`.
2. The command side emits the `order-created` event after persisting the aggregate.
3. Queries can be optimized independently from the write schema.
4. The read model can lag and the system gains more moving parts.
5. Because reads and writes can scale and evolve independently.

