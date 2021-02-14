
###### example:	tmv -s /mnt/disk/5k
# example:	make a playlist
# example:	tmv eye-of-the-tiger.mp3 #  <-> mv eye-of-the-tiger.mp3 /mnt/disk/5k
tmv() {
        if [ "$1" = "-s" -o "$1" = "--set-target" ]; then
                MOVE_TARGET="$(realpath "$2")";
        elif [ "$1" = "-h" -o "$1" = "--help" ]; then
                echo "usage: tmv [-s|--set-target <dir>] | <mv args> <files>";
        else
                mv --target-directory "$MOVE_TARGET" "$@";
        fi
}


# creat backup for the file with .bak extension
backup() {
    cp "$1"{,.bak};
}


# show progress for cp/mv operations
alias pcp="ionice -c 3 rsync -aP"
alias pmv='ionice -c 3 rsync -aP --remove-source-files'

fix_path() {
    PATH="$(printf "%s" "${PATH}" | /usr/bin/awk -v RS=: -v ORS=: '!/^$/ && !($0 in a) {a[$0]; print $0;}')"
    export PATH
}

atree()
{
    # awk based tree implementation
    # usage: find . -type d | atree
    awk -F "/" '{for (i=1; i<=NF-2; i++){printf "| "} print "|____ "$NF}'
}

if fzf -h 1>/dev/null 2>&1; then
    alias fm=fzf  # set fuzzy matcher alias
    cpdf() {
        location=${1-~/books/}
        fn=$(find "$location" -type f -name "*.pdf" | fm);
        [ ! -z "$fn" ] && evince "$fn" 2>/dev/null
    }

    ckill () {
        sig=${1-TERM}
        pid=$(ps aux | fm | awk '{ print $2 }')
        [ ! -z "$pid" ] && kill "$sig" "$pid"
    }
fi

# vim: set noet ts=4 tw=80 syntax=sh :
