
# docker specific aliases
# return 0

alias dr="docker run"

de() {
    # docker exec
    if [ $# -lt 2 ]; then
        echo "DESCRIPTION: function to run cmd in the first mathed by name container"
        echo "USAGE: $0 DOCKER-NAME CMD"
        return 1
    fi

    name=$1
    cmd=$2
    echo "$name" to "$cmd"

    id=$(docker ps | awk '/'"$name"'/{print $1}')
    echo "$id"
    docker exec -it "$id" "$cmd"
}

dm() {
    # docker machine
    docker-machine "$@"
}

ds() {
    docker search --no-trunc=true "$@"
}


di() {
    docker images
}

dls() {
    # docker ps -a
    docker ps -a "$@"
}

drmi() {
    # docker rmi
    docker rmi "$@"
}

drm() {
    # docker rm
    docker rm "$@"
}

drma() {
    # docker rm all containers
    ids=$(docker ps -aq)
    [ ! -z $ids ] && docker rm $ids
}

dkma() {
    # docker rm all conteiners
    ids=$(docker ps -q)
    [ ! -z $ids ] && docker kill $ids
}

###############################################################################
# DOCKER FUNCTIONS
###############################################################################

docker_images() {
    # Just shows a list of docker images without a noise.

    docker images | awk 'NR > 1 && $1 != "<none>" {print $1}' | sort -u
}

docker_versions() {
    # Shows tags of docker images without a noise.

    docker images | awk -v IMG="$1" 'NR > 1 && $1 == IMG {print $2}' | sort
}

docker_update() {
    # Updates all existing docker images (all versions).

    docker_images | xargs -P "$(cpu_count)" -n 1 docker pull -a
}

docker_stop() {
    # Stops all running containers.

    local images

    images="$(docker ps -a -q)"
    if [ -n "${images}" ]; then
        docker stop ${images}
    fi
}

docker_run() {
    # Runs docker container. If no second argument is set then bash
    # would be executed.

    local container
    local cmd
    local volumes

    container="$1"
    cmd="${2:-bash}"
    volumes=""

    if [[ "$#" -gt "2" ]]; then
        shift 2

        for mapping in "$@"; do
            volumes="-v $mapping $volumes"
        done
    fi

    eval docker run -it --rm=true $volumes $container $cmd
}

docker_rm() {
    # Removes all running containers.

    local containers
    containers="$(docker ps -a -q)"

    if [ -n "${containers}" ]; then
        docker rm ${containers}
    fi
}

docker_clean() {
    # Stops and removes all running containers. After it cleans stale images.

    docker_stop && docker_rm

    docker rmi $(docker images -f "dangling=true" -q)
}

docker_rmi() {
    # Removes images with all tags.
    #
    # Args:
    #     repo1 repo2 repo3...
    #
    # Example:
    #     $ docker_rmi ubuntu centos nineseconds/docker-vagrant

    local images

    images="$(docker images)"

    for repo in "$@"; do
        echo ${images} | grep "$repo" | awk '{print $2}' | xargs -n 1 -I {} docker rmi "$repo:{}"
    done
}

docker_pull() {
    # Pulls all tags for the repository.
    #
    # Args:
    #     repo1 repo2 repo3...
    #
    # Example:
    #     $ docker_pull ubuntu centos nineseconds/docker-vagrant

    echo -n "$@" | xargs -d ' ' -n 1 -P "$(cpu_count)" docker pull -a
}

docker_search() {
    # Searches for the docker image with at lease 1 star.
    #
    # Args:
    #     search_pattern
    #
    # Example:
    #     $ docker_search centos

    local delimeter

    delimeter="☃"

    docker search -s 1 "$@" \
        | sed "s/\s\{2,\}/${delimeter}/g" | \
        awk -F "${delimeter}" 'NR > 1 && $2 !~ /^[0-9]+/ {print}' | \
        column -xt -s "${delimeter}"
}


# docker-compose aliases
alias dco='docker-compose'
alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcps='docker-compose ps'
alias dcrestart='docker-compose restart'
alias dcrm='docker-compose rm'
alias dcr='docker-compose run'
alias dcstop='docker-compose stop'
alias dcup='docker-compose up'
alias dcdn='docker-compose down'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
