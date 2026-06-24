# Xray Policy Gates

| Case | Block Release? | Rule |
| --- | --- | --- |
| Critical vulnerability | Yes | `block-critical-vulnerabilities` |
| High vulnerability with fix available | Yes | `block-high-vulnerabilities-with-fix` |
| GPL-3.0 dependency in a restricted product | Yes | `block-disallowed-licenses` |
| Medium vulnerability with no fix | Not by this policy | Would need a separate severity or exception rule |
| Malicious package signal | Yes | `flag-malicious-packages` |

A production exception should require security owner approval, expiration date, affected artifact version, compensating controls, and a tracking ticket.

