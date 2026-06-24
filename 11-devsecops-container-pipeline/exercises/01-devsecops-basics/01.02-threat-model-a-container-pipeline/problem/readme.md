# Problem: Threat Model the Lab

Inspect:

```bash
sed -n '1,220p' sample-app/Dockerfile
sed -n '1,220p' sample-app/app.py
sed -n '1,220p' ci/github-actions-devsecops.yml
```

Answer:

1. What could go wrong before the image is built?
2. What could go wrong during the image build?
3. What could go wrong after the image is built?
4. Which script catches each risk?
5. Which risk is not fully solved by scanning?
