#!/bin/sh
# vlang specific
if which v >/dev/null 2>&1; then
    alias vr="v run "
    alias xclean="rm -vi \$(find . -type f -executable)"
    :
fi
