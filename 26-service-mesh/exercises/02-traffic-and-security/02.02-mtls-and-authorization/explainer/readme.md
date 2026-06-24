# mTLS and Authorization

Service mesh security is often built from two separate layers:

- workload identity and encrypted transport
- authorization policy about who may call whom

This separation is important. Encryption alone does not answer whether a caller is allowed.

