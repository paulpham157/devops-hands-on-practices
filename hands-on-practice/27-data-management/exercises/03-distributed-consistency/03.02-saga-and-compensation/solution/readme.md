# Saga and Compensation

1. The `order` service.
2. `refund_payment`.
3. Previously successful steps should run compensations in reverse order.
4. External effects may already have happened in other services, so the system must actively undo them instead of rolling back one local transaction.
5. Cross-service business workflows such as order fulfillment, payments, inventory reservation, and shipping.

