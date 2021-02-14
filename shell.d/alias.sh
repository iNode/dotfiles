#!/bin/sh

# find shortcuts
alias ff='find . -name '
alias ffi='find . -iname '
alias unx='find . -type f -perm /a+x -exec chmod a-x {} \;'
alias fblobs='nice find . -type f -ignore_readdir_race -size 2>/dev/null'

# common lazy commands
alias ping='ping -c 5'
alias path='echo -e $PATH|tr ":" "\n"|sed "/^\$/d"'

# encryption related aliases
alias signfile="gpg -u iNode --clearsign -b -v "

if command -v ack >/dev/null; then
    alias ack='ack --nogroup '
fi

alias df='df -h'
alias du='du -h'
alias dum='du -h --max-depth=1'

dumk() {
    # alias dumk='rm dum; du -smc * > dum'

    filename=$(mktemp "$(pwd)/dum.XXX")
    trap 'rm -f $filename' TERM
    du -smc ./* > "$filename"
    mv "$filename" dum
}

alias dums='cat dum | sort -n'
alias ps='ps -e'
alias cal='cal -m'

# ls tricks
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias li='ls -ial'
alias lst='ls -lhtr --color=auto'
alias l='lst'
## show only dot-files
alias lsa='ls -ld .*'


# tmux specific
###############
# set tmux window name to current directory name
td() { tmux rename-window "$(basename "$(pwd)")"; }

## show only dirs
lsd() { find "$1" -maxdepth 1 -type d -ls; }
# alias lsd="ls -ldG *(-/DN)"


# ps tricks
alias psfg="\\ps -ylf"
alias psg="\\ps aux| grep -v grep | grep"

alias cfh='./configure --help | less'
alias cfg='./configure --prefix=/usr --sysconfdir=/etc'
alias clean="rm *~"
alias clr='find . -regex .*~ -delete'
alias hmakej="hilite make -j"
alias mkinst='sudo make install'


alias x='chmod +x'
alias xX='chmod -x'
alias h='history'
alias su="su - "

# SUDO aliases
alias S='sudo'
alias mnt='S mount'
alias mntl='S mount -o loop'
alias umnt='S umount'
alias cmount='mount |column -t'

alias grab='S chown "${USER}" --recursive'
alias rgrab="S chown root --recursive"

# allow to see disconnection time
myssh () {
    if [ "x$TMUX" != "x" ] && [ "x$NORENAME" = "x" ]; then
        echo try to rename window
        tmux rename-window "$1"
    else
	: # do nothing for now
    fi

    \ssh "$@"; date
}
alias ssh="myssh"

# temporary ssh connection without any addtional checks or logs
alias ssht="sshrc -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oLogLevel=quiet "
# force ssh to work without checking host key at all
alias sshf='sshrc -oUserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

alias pst='pstree -Ap | less'

alias dirs='dirs -v'
# CD
alias c="cd -"
alias ..='cd ..'
alias ...='cd ../../'
cdd() { cd "$(dirname "$1")" || return 0; }

# vim based color less
if [ -x /usr/share/vim/vimcurrent/macros/less.sh ]; then
    alias less='/usr/share/vim/vimcurrent/macros/less.sh'
fi

# alias HEAD for automatic smart output
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 25`} - 2))'

# the same for tail
alias tail='tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 25`} - 2))'

# rsync
alias ssync="rsync --rsh=ssh"
alias ssyncr="rsync --rsh=ssh --recursive --verbose --progress"

# Tool related aliases
# text highlighters
if which pygmentize > /dev/null; then
    alias catc="pygmentize -f terminal256 -O style=native -g"
else
    if which highligt > /dev/null; then
        alias catc="highlight -O ansi"
    fi
fi

# alias home-up="rsync -Cavz -e ssh ~/ remoteserver:~/"
# alias home-down="rsync -Cavz -e ssh --delete --exclude downloads/ --exclude ogg/ --exclude music/ remoteserver:~/ ~/"
# alias dev-up="rsync -Cavz -e ssh --delete ~/dev/ remoteserver:~/dev/"
# alias dev-down="rsync -Cavz -e ssh --delete remoteserver:~/dev/ ~/dev/"
