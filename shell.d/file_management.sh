###### ex:	tmv -s /mnt/disk/5k
# ex:	make a playlist
# ex:	tmv eye-of-the-tiger.mp3 #  <-> mv eye-of-the-tiger.mp3 /mnt/disk/5k
function tmv() {
        if [ "$1" = "-s" -o "$1" = "--set-target" ]; then
                MOVE_TARGET="$(realpath $2)";
        elif [ "$1" = "-h" -o "$1" = "--help" ]; then
                echo "usage: tmv [-s|--set-target <dir>] | <mv args> <files>";
        else
                mv --target-directory "$MOVE_TARGET" "$@";
        fi
}

alias pcp="ionice -c 3 rsync -aP"
alias pmv='ionice -c 3 rsync -aP --remove-source-files'