# find shortcuts
alias ff='find . -name '
alias ffi='find . -iname '
alias unx='find . -type f -perm /a+x -exec chmod a-x {} \;'
alias fblobs='nice find . -type f -ignore_readdir_race -size 2>/dev/null'

if command -v ack >/dev/null;
then
    alias ack='ack --nogroup '
fi

alias df='df -h'
alias du='du -h'
alias dum='du -h --max-depth=1'
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

## show only dirs
function lsd() { ls -l $1 | grep \^d; }
# alias lsd="ls -ldG *(-/DN)"


# ps tricks
alias psc="\ps -C"
alias psfg="\ps -ylfC"
alias psg="\ps aux| grep -v grep | grep"

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

alias grab="S chown ${USER} --recursive"
alias rgrab="S chown root --recursive"
alias ssh="myssh"

alias pst='pstree -Ap | less'

alias d='dirs -v'
# CD
alias c="cd -"
alias ..='cd ..'
alias ...='cd ../../'

# vim based color less
alias less='/usr/share/vim/vimcurrent/macros/less.sh'

# alias HEAD for automatic smart output
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'

# rsync
alias ssync="rsync --rsh=ssh"
alias ssyncr="rsync --rsh=ssh --recursive --verbose --progress"

# alias home-up="rsync -Cavz -e ssh ~/ remoteserver:~/"
# alias home-down="rsync -Cavz -e ssh --delete --exclude downloads/ --exclude ogg/ --exclude music/ remoteserver:~/ ~/"
# alias dev-up="rsync -Cavz -e ssh --delete ~/dev/ remoteserver:~/dev/"
# alias dev-down="rsync -Cavz -e ssh --delete remoteserver:~/dev/ ~/dev/"
