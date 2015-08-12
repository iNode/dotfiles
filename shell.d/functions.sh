# mkdir & cd to it
mcd() { mkdir -p -v "$1"; cd "$1"; }

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
    echo Cannot find ssh agent - maybe you should reconnect and forward it?
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

