#!/bin/sh

# mkdir & cd to it
mcd() { [ -n "$1" ] && mkdir -p -v "$1" && cd "$1" || exit 1; }

# Create temporary directory and go to it
cdt() {
    cd "$(mktemp -d)" || return 1
    pwd
}

ssh_reagent () {
    for agent in /tmp/ssh-*/agent.*; do
        export SSH_AUTH_SOCK=$agent
        if ssh-add -l  >/dev/null 2>&1; then
            echo Found working SSH Agent:
            ssh-add -l
            return
        fi
    done
    echo "Cannot find ssh agent - maybe you should reconnect and forward it?"
}


stail () {
    # screen size tail
    [ "-h" = "$1" ] && echo "Usage: stail [FILENAME [SCREEN_PERCENT]]" && exit 0
    fn=${1:--}
    percent=${2:-90}
    l=$(((LINES - 4) * percent / 100))
    tail -n"$l" "$fn"
}

shead () {
    # screen size head
    [ "-h" = "$1" ] && echo "Usage: stail [FILENAME [SCREEN_PERCENT]]" && exit 0
    fn=${1:--}
    percent=${2:-90}
    l=$(((LINES - 4) * percent / 100))
    sed ${l}q "$fn"
}

alisten() {
    if [ $# -lt 1 ]; then
        echo "Usage: $0 user@host"
        exit 1
    fi
    arecord -f dat | ssh -C user@host aplay -f dat
}

genpasswd() {
    len=${1:-20}
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c "${len}" | xargs
}

purgeoldkernels() {
    # Purges old Ubuntu kernels
    # http://askubuntu.com/a/254585
    release="$(uname -r)"
    packages="$(dpkg --list)"
    kernels=$(echo "$packages" | awk '/linux-image/{print $2}'   | sort -V | sed -n '/'"$release"'/q;p')
    headers=$(echo "$packages" | awk '/linux-headers/{print $2}' | sort -V | sed -n '/'"$(uname -r | sed 's/\([0-9.-]*\)-\([^0-9]\+\)/\1/')"'/q;p')
    echo "$kernels" "$headers" | xargs sudo apt-get -y purge
}
