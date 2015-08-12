
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
