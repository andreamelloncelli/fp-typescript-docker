# #!/bin/bash

# ################
# ## settings

# set -u

# IMAGE=idea
# CONTAINER=idea
# DOCKER_FOLDER=./idea
# REPO="https://github.com/andreamelloncelli/docker-intellij.git"
# action="$1"
# D_HOME="/root"
# SHARED_FOLDER="$HOME/dev"

################
## functions

function build_image() {
    [[ -d "${DOCKER_FOLDER}" ]] || git clone "${REPO}" "${DOCKER_FOLDER}" || exit 2
    docker build -t "${IMAGE}" "${DOCKER_FOLDER}"
}

function run_container() {
    if ! docker images |grep "${IMAGE}" ; then # image not found
	build_image
    fi
    docker run --name "${CONTAINER}" -d -e DISPLAY \
	   -v /tmp/.X11-unix:/tmp/.X11-unix \
	   -v $HOME/.Xauthority:$D_HOME/.Xauthority \
	   -v $SHARED_FOLDER:$D_HOME/hostfolder \
	   --net=host "${IMAGE}"
}

function start_container() {
    if ! docker ps -a 2>&1 |grep "${IMAGE}" > /dev/null ; then # container not found
	run_container
    fi
    docker start "${IMAGE}"    
}

function stop_container() {
    docker stop "${IMAGE}"    
}

function rm_container() {
    docker rm "${IMAGE}"    
}

function rm_image() {
    docker rmi "${IMAGE}"    
}


################
## main
case "${action}" in
    "build" )
	build_image
	;;
    "run" )
	run_container
	;;
    "start" )
	start_container
	;;
    "stop" )
	stop_container
	;;
    "rm" )
	rm_container
	;;
    "rmi" )
	rm_image
	;;
    * )
	exit 1
	;;
esac

exit 0


