#!/bin/sh

dir=`dirname $0`
cd $dir
dir=`pwd`

for f in `ls -1a ./ | egrep -v "(^\.git$|.swp|\.\/$|\.$|makeln.sh|scripts)"`; do
    ln -sf $dir/$f $HOME
done

mkdir -p $HOME/bin
for f in `ls -1a ./scripts | egrep -v "(^\.git$|.swp|\.\/$|\.$|makeln.sh|scripts)"`; do
    ln -sf $dir/scripts/$f $HOME/bin
done


