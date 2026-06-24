# Saga and Compensation

Saga patterns coordinate multi-service workflows through local transactions and compensation.

This is different from one distributed ACID transaction. A saga accepts that partial progress can happen and must be undone deliberately.

That makes compensation logic part of the domain design.

