# Solution: Read a Trust Policy

The EC2 service role trusts:

```text
ec2.amazonaws.com
```

It uses:

```text
sts:AssumeRole
```

The GitHub Actions role trusts:

```text
token.actions.githubusercontent.com
```

The repository and branch are restricted by the `sub` condition:

```text
repo:example-org/docker-course:ref:refs/heads/main
```
