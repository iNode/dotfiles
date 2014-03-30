#!/bin/sh

startdir=`pwd`
dir=`dirname $0`
cd $dir
dir=`pwd`

my_pattern="(^\.git$|.swp|\.\/$|\.$|makeln.sh|scripts)"

# use directory specific install scripts when available
for d in $(find $dir -type d | grep -v -e .git -e scripts -e .$); do
    if [ -x $d/install ]; then
        # self install
        $d/install
    else
        # just symlink
        ln -sf $d $HOME
    fi
done

# symliks for files
for f in `find $dir -maxdepth 1 -type f | egrep -v $my_pattern`; do
    ln -sf $f $HOME
done

# special care about scripts dir
mkdir -p $HOME/bin
for f in `ls -1a ./scripts | egrep -v "(^\.git$|.swp|\.\/$|\.$|makeln.sh|scripts)"`; do
    ln -sf $dir/scripts/$f $HOME/bin
done


cd $startdir
