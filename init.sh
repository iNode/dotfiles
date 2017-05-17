#!/bin/sh -e
#
# File: init.sh
#
# Created: Tue, July 12 2016 by Stan. S. Krupoderov
#
# install all packages apps from corresponding repos
#

cd packages
for $fn in *; do
    [ -x $fn ] && ./$fn
done

