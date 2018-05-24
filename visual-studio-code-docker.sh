#!/bin/bash

################
## settings

## see-also
##
## https://hub.docker.com/r/ducatel/visual-studio-linux-build-box/
## Wrong: Docker container used to allows Visual Studio to build a Linux application.
##
## 

set -u

IMAGE=visual-studio-code-2
CONTAINER="${IMAGE}"
DOCKER_FOLDER=./visual-studio-code
REPO="https://github.com/Ducatel/Visual-Studio-Linux-Build-Box.git" 
action="$1"
D_HOME="/root"
SHARED_FOLDER="$HOME/dev"



source ./libdocker-funs.sh
