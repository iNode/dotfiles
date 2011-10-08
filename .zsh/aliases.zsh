# Aliaces
#
#
## aliases for rcs
alias hgl="hg log --template '{date|shortdate} {author|user}: {rev} {node|short} {desc|firstline}\n'"

# test for mc and libtrash
alias tmc='LIBTRASH=/usr/lib/libtrash/libtrash.so.2.4; LD_PRELOAD="$LIBTRASH"; export LD_PRELOAD; mc'

# mocp status
alias mocs='mocp -Q "%state %title"'


# python easy-install shorcut
alias e-i='easy_install -d ~/.python/lib -s ~/.python/bin'

alias mutt="export EDITOR=vim; mutt"

# cross compilation section here
# ==============================
if [ -d /usr/i586-mingw32msvc/bin ]
then
    alias ccpath='export PATH=/usr/i586-mingw32msvc/bin:$PATH'
fi
#emacs section here
#==================
if [ -x `whence emacs` ]; then
    #alias ee="emacsclient -n -a gvim "
    alias em='emacsclient -c -a ""'
    alias es='emacsclient -e "(emms-show)"'
    # jump to current emacs path
    alias jm='eval cd $(emacsclient -e "(with-current-buffer (window-buffer (frame-selected-window)) default-directory)")'
    # DirEd Here
    alias deh='emacsclient -e "(dired \"`pwd`\")"'
    # dir emms add
    alias dea='emacsclient -e "(emms-add-directory-tree \"`pwd`\")"'
fi
#emacs section end

# jm equivalent for mc
alias jmc='eval cd $(cat ~/.config/mc/cwd)'

# Aliases for applications
alias revim="vim -S ~/.vim/lastSession.vim"
alias diff="colordiff"
alias miso='mkisofs -joliet-long -jcharset utf8 -r '
alias wxchm="LANG=ru_RU.CP1251 xchm"
alias mc='~/opt/mc/bin/mc'

# repos
#======
alias repu='cd ~/repos/maint/; nice ./update all 2>&1 | tee last_update.log | ccze'
alias repul='cd ~/repos/maint/; cat last_update.log - | ccze'
# end repos

#alias buildmc="./autogen.sh && ./configure -q --prefix=~/opt/mc/ --without-subshell --enable-charset --enable-extcharset --enable-background  --with-vfs --with-mcfs && nice make --silent CFLAGS=-ggdb3 V=0 -j 4 && make install && notify-send \"buiild complete\" \"for branch \$(git branch | grep '*')\""
alias buildmc="./autogen.sh && ./configure -q --prefix=~/opt/mc/ --without-subshell --enable-charset --enable-extcharset --enable-background  --with-vfs --with-mcfs --enable-maintainer-mode --enable-vfs-sftp&& nice make --silent CFLAGS=-ggdb3 V=0 -j 4 && notify-send \"buiild complete\" \"for branch \$(git branch | grep '*')\""


#encode
alias icwn='iconv -f cp1251 -t koi8-r'
alias icnw='iconv -f koi8-r -t cp1251'
alias icwu='iconv -f cp1251 -t utf-8'
alias icuw='iconv -f utf-8 -t cp1251'
alias icku='iconv -f koi8-r -t utf-8'
# line endings
alias u2d='perl -pi -e "s/\\n/\\r\\n/;"'
alias d2u='perl -pi -e "s/\\r\\n/\\n/;"'
alias dEl="perl -ni -e 'print unless /^\s*$/;'"

# shortcuts
alias ff='find . -name '
alias ffi='find . -iname '
alias unx='find . -type f -perm /a+x -exec chmod a-x {} \;'
alias fblobs='nice find . -type f -ignore_readdir_race -size 2>/dev/null'
alias ack='ack-grep'
alias gst='git status '

# Ubuntu/Debian aliases
if [ -f /etc/debian_version ];
then
    alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
    alias sai='nocorrect sudo aptitude install '
    alias eis='nocorrect aptitude search '	# only in program names
    alias acs='apt-cache search '	# also in descriptions
    alias aps='aptitude show  '	# show info about a package
    alias dq='noglob dpkg-query '
    alias service='update-rc.d'
else
    # the same for gentoo
    alias sai='nocorrect sudo emerge'
    alias se="nocorrect sudo emerge"
    #alias acs='eix  '	# also in descriptions
    alias eis='nocorrect eix '	# only in program names
    alias dq='noglob equery '
    alias e="emerge"
fi

# common lazy commands
alias git='nocorrect git'
alias mv='nocorrect mv -v'
alias cp='nocorrect cp -v'
alias rm='nocorrect rm -v'
alias mkdir='nocorrect mkdir'
alias man='nocorrect man'
alias find='noglob find'
alias df='df -h'
alias du='du -h'
alias dum='du -h --max-depth=1'
alias ps='ps -e'
alias cal='cal -m'
alias ispell='ispell -d russian'

alias sws2disk='echo platform >! /sys/power/disk; echo disk >! /sys/power/state'
alias sws2mem='echo platform >! /sys/power/disk; echo mem >! /sys/power/state'

# ls tricks
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias li='ls -ial'
alias l='ls'
## show only dirs
alias lsd="ls -ldG *(-/DN)"
## show only dot-files
alias lsa='ls -ld .*'

# ps tricks
alias psc="\ps -C"
alias psfg="\ps -ylfC"
alias psg="\ps aux| grep -v grep | grep"

# CD
alias cd='pushd'
alias cdl='cd_ls'
alias ..='cd ..'
alias ...='cd ../../'

alias cfg='./configure --prefix=/usr --sysconfdir=/etc'
alias clean="rm *~"
alias clr='find . -regex .*~ | xargs rm -f'
alias hmakej="hilite make -j"
alias mkinst='sudo make install'


alias x='startx'
alias h='history'
alias mkdir="nocorrect mkdir"
alias su="su - "

# SUDO aliases
alias S='sudo'
alias mnt='S mount'
alias mntl='S mount -o loop'
alias umnt='S umount'
alias slog='S tail -f /var/log/messages | ccze -A -p syslog'
alias mlog='S tail -f /var/log/maillog | ccze -A -p syslog'
alias dlog='S tail -f /var/log/daemon.log | ccze -A -p syslog'
alias grab="S chown ${USER} --recursive"
alias rgrab="S chown root --recursive"

alias ssh="myssh"

#alias pst='pstree -G | less'

# ZSH
alias rezsh="source ~/.zshrc"

# GLOBAL
alias -g M='|more'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g EN='2>/dev/null'
alias -g SN='1>/dev/null'
alias -g SEN="2>&1 1>/dev/null"
alias -g C="|ccze -A"

alias v='vim'
alias gv='gvim'
alias d='dirs -v'

# CVS
alias cvu="cvs update"
alias cvc="cvs commit"
alias svu="svn update"
alias svs="svn status"
alias svc="svn commit"

# rsync
alias ssync="rsync --rsh=ssh"
alias ssyncr="rsync --rsh=ssh --recursive --verbose --progress"

# alias edeps="equery -C g $@ | grep -E '^ ?\`--' | awk '{print \"=\"\$2}'"

# Extenstions
alias -s avi=vlc
alias -s flv=vlc
alias -s mpg=vlc
alias -s wmv=vlc
alias -s murl=sshmount
alias -s pdf=evince

# alias home-up="rsync -Cavz -e ssh ~/ remoteserver:~/"
# alias home-down="rsync -Cavz -e ssh --delete --exclude downloads/ --exclude ogg/ --exclude music/ remoteserver:~/ ~/"
# alias dev-up="rsync -Cavz -e ssh --delete ~/dev/ remoteserver:~/dev/"
# alias dev-down="rsync -Cavz -e ssh --delete remoteserver:~/dev/ ~/dev/"

# for testing mc
alias nmc=~/opt/mc/bin/mc

alias usbmixer="alsamixer -D hw:1"
alias signfile="gpg -u iNode --clearsign -b -v "

# vim: set noet ts=4 tw=80 syntax=zsh
