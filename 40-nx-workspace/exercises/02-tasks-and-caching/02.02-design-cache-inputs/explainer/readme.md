# Explainer: Design Cache Inputs

Nx caching is based on computation hashing.

A cache hit is safe only if the hash includes every input that can affect the output. Source files are obvious inputs. Shared configs, lockfiles, environment variables, generated code, and command args can also matter.

Bad cache inputs make CI look fast while hiding stale or wrong results.
