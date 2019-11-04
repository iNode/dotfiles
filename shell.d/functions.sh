#!/bin/sh
# mkdir & cd to it
mcd() { [ ! -z "$1" ] && mkdir -p -v "$1" && cd "$1"; }

# Create temporary directory and to it
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
    if [ $# -eq 0 ]; then
        coeff=1
    else
        coeff="$1"
    fi
    # Use zsh/bash's arithmetic substitution to do the math
    # then cast to an integer to round it off
    integer l=$(((LINES - 2) * coeff))
    tail -n"$l" "$2"
}

shead () {
    # screen size head
    if [ $# -eq 0 ]; then
        coeff=1
    else
        coeff="$1"
    fi
    # Use zsh/bash's arithmetic substitution to do the math
    # then cast to an integer to round it off
    integer l=$(((LINES - 2) * coeff))
    head -n"$l" "$2"
}

alisten() {
    if [ $# -lt 1 ]; then
        echo "Usage: $0 user@host"
        exit 1
    fi
    arecord -f dat | ssh -C user@host aplay -f dat
}

genpasswd() {
    local len=${1:-20}
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${len} | xargs
}

purgeoldkernels() {
    # Purges old Ubuntu kernels
    # http://askubuntu.com/a/254585
    echo $(dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p') $(dpkg --list | grep linux-headers | awk '{ print $2 }' | sort -V | sed -n '/'"$(uname -r | sed "s/\([0-9.-]*\)-\([^0-9]\+\)/\1/")"'/q;p') | xargs sudo apt-get -y purge
}
