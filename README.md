# What it is

It is a docker container with visual-studio-code and typescript.

# Requirements

- Docker installed

Suggested:

- SO Ubuntu: the file `visual-studio-code-docker.sh` is tested on ubuntu 16.04.

# How use it

If you are able to use docker, you can use the directly build the container with `visual-studio-code/Dockerfile`.

Otherwise:

1. in order to bulid the container image

		./visual-studio-code-docker.sh build

2. in order to start the container and visual-studio-code

		./visual-studio-code-docker.sh start

3. in order to stop the container (or simply close the app)

		./visual-studio-code-docker.sh stop


