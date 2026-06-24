# Problem: Debug a Slow Request

Generate a slow request:

```bash
curl -fsS "http://localhost:5016/checkout?slow=true"
```

Open the returned trace in Jaeger.

Answer:

1. What is the total trace duration?
2. How long did `inventory.lookup` take?
3. How long did `payment.authorize` take?
4. Which span should you investigate first?
5. Which attribute confirms the request was intentionally slow?

