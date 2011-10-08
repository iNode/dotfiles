# 077 would be more secure, but 022 is generally quite realistic
umask 022

ulimit -c 10000

# Locale specific
export LANG="ru_RU.UTF-8"
export LC_ALL=""
export LC_MESSAGES="POSIX"

# Shell specific
export HISTCONTROL="ignoreboth"
export HISTIGNORE="mc:ls:df:du:bc"
export HISTSIZE=5000
export HISTFILESIZE=$HISTSIZE

# export EDITOR="emacs"
export EDITOR="vim"
export PAGER="less"
export PATH=$PATH:~/bin

if [ -e ~/.profile.local ]
then
    source ~/.profile.local
fi
