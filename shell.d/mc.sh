#### <mc specific>

# jm equivalent for mc
alias jmc='eval cd $(cat ~/.config/mc/cwd)'

# for testing mc
alias nmc=~/opt/mc/bin/mc

# test for mc and libtrash
alias tmc='LIBTRASH=/usr/lib/libtrash/libtrash.so.2.4; LD_PRELOAD="$LIBTRASH"; export LD_PRELOAD; mc'

alias mc='~/opt/mc/bin/mc -S ~/opt/mc/share/mc/skins/darkfar.ini'
#alias buildmc="./autogen.sh && ./configure -q --prefix=~/opt/mc/ --without-subshell --enable-charset --enable-extcharset --enable-background  --with-vfs --with-mcfs && nice make --silent CFLAGS=-ggdb3 V=0 -j 4 && make install && notify-send \"buiild complete\" \"for branch \$(git branch | grep '*')\""
alias buildmc="./autogen.sh && ./configure -q --prefix=~/opt/mc/ --without-subshell --enable-charset --enable-extcharset --enable-background  --with-vfs --with-mcfs --enable-maintainer-mode --enable-vfs-sftp&& nice make --silent CFLAGS=-ggdb3 V=0 -j 4 && notify-send \"buiild complete\" \"for branch \$(git branch | grep '*')\""
#### </mc specific>

