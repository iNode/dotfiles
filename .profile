#!/bin/sh
# 077 would be more secure, but 022 is generally quite realistic
umask 022
ulimit -c 10000

# Locale specific
export LANG="ru_RU.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_MESSAGES="POSIX"

# Shell specific
export HISTCONTROL="ignoreboth"
export HISTIGNORE="mc:ls:df:du:bc"
export HISTSIZE=5000
export HISTFILESIZE=$HISTSIZE
# export EDITOR="emacs"
export EDITOR="vim"
export PAGER="less"

export PATH
PATH=$PATH:~/bin:~/.local/bin

# set path for gems installation, and corresponding binary path
export GEM_HOME=$HOME/.gem/gems
[ -d "$HOME/.gem/gems/bin" ] && PATH="$PATH:$GEM_HOME/bin"

# include cargo binaries into PATH
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

if [ -e ~/.profile.local ]; then
    # shellcheck disable=SC1090
    . "$HOME/.profile.local"
fi

hn="$(hostname)"
if [ -e "$HOME/.profile.$hn" ]; then
    # shellcheck disable=SC1090
    . "$HOME/.profile.$hn"
fi
# Local Variables:
# mode: sh
# End:
