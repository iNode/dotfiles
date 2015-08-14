#!/bin/bash

startdir=`pwd`
dir=`dirname $0`
cd $dir
dir=`pwd`

my_pattern="(^\.git$|.swp|\.\/$|\.$|makeln.sh|scripts)"
if [ $# -eq 1 -a "$1" == "-d" ]; then
    dry_run=1
else
    dry_run=0
fi

run_cmd() {
    if [ "$dry_run" == "1" ]; then
        echo "$@"
    else
        $@
    fi
}

# use directory specific install scripts when available
for d in $(find $dir -type d | grep -v -e .git -e scripts -e .$); do
    if [ -x $d/install ]; then
        # self install
        run_cmd $d/install
    else
        # just symlink
        run_cmd ln -sf $d $HOME
    fi
done

# symliks for files
for f in `find $dir -maxdepth 1 -type f | egrep -v $my_pattern`; do
    run_cmd ln -sf $f $HOME
done

# special care about scripts dir
mkdir -p $HOME/bin
for f in `ls -1a ./scripts | egrep -v "(^\.git$|.swp|\.\/$|\.$|makeln.sh|scripts)"`; do
    run_cmd ln -sf $dir/scripts/$f $HOME/bin
done


cd $startdir
