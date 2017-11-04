# mkdir & cd to it
mcd() { [ ! -z "$1" ] && mkdir -p -v "$1" && cd "$1"; }

# Create temporary directory and to it
cdt() {
    cd "$(mktemp -d)"
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

# Sum first column, example: awkc 1 file | awks
function awks() {
    awk 'BEGIN{sum=0} {sum+=$1} END{print sum}' "$*"
}

# Multiply first column, example: awkc 1 file | awkm
function awkm() {
    awk 'BEGIN{mul=1} {mul*=$1} END{print mul}' "$*"
}

# Small shortcut for awk '{print $N}'. It is awp N for now. Literally.
awp() {
    awk "{print \$$1}"
}

# Prints columns 1 2 3 ... n.
slit() {
  awk "{ print ${(j:,:):-\$${^@}} }"
}

# awk to print psecified columns
# usage: awkc 1 2 instead of awk '{print $1,$2}'
function awkc() {
    slit "$@"
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
