cscope_add ()
{
    curdir=$(pwd)
    adddir="$1"
    cd "$adddir"
    cscope-indexer -r -l -i "${curdir}/cscope.add"
    cd "${curdir}"
    perl -pe 's#^#'"$adddir"'/#' < cscope.add >> cscope.files
    cscope -b
}

vgrep ()
{ # multiple pattern inVert match grep
    cmd="egrep -v "
    for arg in "$@"; do
        cmd="$cmd -e $arg"
    done
    eval "$cmd"
}

mgrep ()
{ # multiple pattern grep
  cmd="egrep "
  for arg in "$@"; do
      cmd="$cmd -e $arg"
  done
  eval "$cmd";
}

cdr ()
{
    cd "$(ffip "$@")";
}

# ag + less function
agl () { ag --color "$@" | less -R; }

# sift + less function
siftl () { sift --color "$@" | less -R; }

# cat to file and make it executable
scat () { cat > "$1"; chmod +x "$1"; }

# script append
sapp () { cat >> "$1"; }


# print stack trace of a core file without needing to enter gdb interactively
alias gdbbt='gdb -q -n -ex bt -batch'
alias gdbr='gdb --args'

alias gn="grep -rnH"
alias xmlfmt="tr -d '\n' | xmllint --format - |pygmentize -l xml"

# go specific
alias gb='go install -v'

wait_success() {
    cmd="$*"
    $cmd;
    while [ "x$?" != "x0" ]; do
        sleep 1;
        $cmd;
    done;
}

wait_host() {
    wait_success ping -q -w 1 "$1"
}

if which colordiff 1>/dev/null; then
    alias diff=colordiff
else
    alias colordiff=cat
fi


svndiff () { svn diff "${@}" | colordiff | less -R -E; }
hgdiff () { hg diff "${@}" | colordiff | less -R -E; }

httpshare() {
    # share current directory via http on fixed port
    busybox httpd -f -p 56000
}

# rust/cargo specific
if cargo -h 1>/dev/null 2>&1; then
    Cr() {
        cargo run "$@"
    }

    Cn() {
        cargo new --vcs git "$@"
    }

    Cc() {
        cargo clean "$@"
    }

    Cb() {
        cargo build --verbose "$@"
    }


    Rd() {
        # rust compile with dynamic link to stdlib
        # static linking is default
        rustc -C prefer-dynamic "$@"
    }
fi

# perforce specific
p4log () {
    # provide ... argument for whole curren directory
    p4 changes "$1" | awk '{print $2}' | xargs -i p4 describe -du {} | less -F
}

gitd () { # run git commands for dotfiles dir
    git -C ~/dotfiles "$@"
}

p4co () {
    # provide ... argument for whole current directory
    for f in "@$"; do
        p4 open "$f"
        p4 revert "$f"
    done
}

p4shelve() { p4 shelve "$@"; p4 revert "$@"; }


grep_nascii() {
    # grep files with non ascii characters
    # ag "[\x80-\xFF]" "$@"
    # grep --color='auto' -R -P -n '[^\x00-\x7F]' ../../
    grep --color='auto' -P -n '[^\x00-\xFF]' "$@" ;
}
