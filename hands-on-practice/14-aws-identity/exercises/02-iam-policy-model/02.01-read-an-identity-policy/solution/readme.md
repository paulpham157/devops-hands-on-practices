# Solution: Read an Identity Policy

Object reads are allowed by:

```text
s3:GetObject
```

Bucket listing is allowed by:

```text
s3:ListBucket
```

`s3:DeleteObject` is denied because there is no matching allow statement.

The policy scopes access to:

```text
arn:aws:s3:::docker-course-example
arn:aws:s3:::docker-course-example/*
```
