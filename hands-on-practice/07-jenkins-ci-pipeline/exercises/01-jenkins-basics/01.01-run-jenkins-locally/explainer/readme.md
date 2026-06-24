# Run Jenkins Locally

Jenkins is the CI server. It stores jobs, runs builds, shows console logs, and keeps build history.

In this lesson Jenkins runs as a container. A second container runs Docker-in-Docker, giving Jenkins a Docker daemon for build and smoke-test stages.

This setup is useful for learning because it keeps all Jenkins state inside Docker volumes.

