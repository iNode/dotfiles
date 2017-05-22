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
export PATH=$PATH:~/bin
export AUTOLS=true

# prevent global package installation
export PIP_REQUIRE_VIRTUALENV=true
# set path for gems installation
export GEM_HOME=$HOME/.gem/gems
export PATH=$PATH:$GEM_HOME/bin

if [ -e ~/.profile.local ]
then
    source ~/.profile.local
fi

hn=$(hostname)
if [ -e ~/.profile.$hn ]
then
    source ~/.profile.$hn
fi

# Local Variables:
# mode: sh
# End:
