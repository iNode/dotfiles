#!/bin/sh

export CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config/}"

startdir=$(pwd)
dir=$(dirname "$0")
cd "$dir" || exit 1
dir=$(pwd)

my_pattern='(^\.git$|.swp|\.\/$|\.$|makeln.sh|scripts|init.sh|packages|dotfiles/$|^config$)'
if [ $# -eq 1 ] && [ "$1" = "-d" ]; then
    dry_run=1
else
    dry_run=0
fi

run_cmd() {
    if [ "$dry_run" = "1" ]; then
        echo "$@"
    else
        "$@"
    fi
}


# use directory specific install scripts when available
for d in $(find "$dir" -maxdepth 1 -type d | grep -v -e '.git$' -e scripts -e "$dir\$" -e '\.$'); do
    if [ -x "$d/install" ]; then
        # self install
        run_cmd "$d/install"
    else
        # just symlink
        run_cmd ln -svf "$d" "$HOME"
    fi
done

# symliks for files
for f in $(find "$dir" -maxdepth 1 -type f | grep -vE "$my_pattern"); do
    run_cmd ln -svf "$f" "$HOME"
done

# handle config directory
for f in $(find "$dir/config" -maxdepth 1 -type d); do
    confdir=$(basename "$f")
    if [ ! -d "$HOME/.config/$confdir" ]; then
        run_cmd ln -svf "$f" "$HOME/.config"
    else
        echo "$HOME/.config/$confdir already exists"
    fi
done

# special care about scripts dir
mkdir -pv "$HOME/bin"
mkdir -pv "$HOME/.local/bin"
for f in $(echo scripts/* | grep -vE '(^\.git$|.swp|\.\/$|\.$|makeln.sh|^scripts$)'); do
    run_cmd ln -svf "$dir/$f" "$HOME/bin"
done

cd "$startdir" || exit 1
