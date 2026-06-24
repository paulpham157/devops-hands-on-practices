# Explainer: Threat Model a Container Pipeline

A threat model is a short, practical way to ask what can go wrong.

For a container pipeline, common risks include:

- A developer commits a secret.
- A dependency has a known vulnerability.
- The Dockerfile runs as root.
- The base image changes unexpectedly.
- The image includes files that should not ship.
- CI builds an image but no one knows what packages are inside.
- A scanner reports many findings but the team has no policy for action.

Threat modeling keeps DevSecOps grounded in risk instead of tool collecting.
