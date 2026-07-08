# Review Non-root Runtime Users

Containers should not run as root by default.

Running as a non-root user reduces the impact of app-level compromise and catches file permission assumptions earlier. The exact Dockerfile pattern differs by base image and language runtime.
