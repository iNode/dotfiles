#!/bin/sh

dir=`dirname $0`
cd $dir
dir=`pwd`

for f in `ls -1a ./ | egrep -v "(.git|.swp|\.\/$|\.$|makeln.sh)"`; do
#    echo $f
    ln -sf $dir/$f $HOME
done


