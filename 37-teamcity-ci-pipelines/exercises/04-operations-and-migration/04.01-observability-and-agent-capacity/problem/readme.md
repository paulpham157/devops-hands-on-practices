# Observability and Agent Capacity

A release week produces long queue times for Docker builds, while lightweight lint jobs stay fast.

1. What does that suggest about agent pooling?
2. Which metric matters first: queue duration or repository size?
3. Why should GPU or privileged builds live in separate pools?
