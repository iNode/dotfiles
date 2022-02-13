#!/bin/sh
# 077 would be more secure, but 022 is generally quite realistic
umask 022

# Locale specific
export LANG="en_US.UTF-8"
export LANGUAGE="en:ru"
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

[ -d "$HOME/bin" ] && PATH="$PATH:$HOME/bin"
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"
export PATH
# set path for gems installation, and corresponding binary path
export GEM_HOME=$HOME/.gem/gems
[ -d "$HOME/.gem/gems/bin" ] && PATH="$PATH:$GEM_HOME/bin"
# include cargo binaries into PATH
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"
# shellcheck disable=SC1090
[ -e "$HOME/.profile.local" ] && . "$HOME/.profile.local"
hn="$(hostname)"
# shellcheck disable=SC1090
[ -e "$HOME/.profile.$hn" ] && . "$HOME/.profile.$hn"

# suppress PS telemetry
export POWERSHELL_TELEMETRY_OPTOUT=true
# suppress update checks
export POWERSHELL_UPDATECHECK=Off
# disable for .NET
export DOTNET_CLI_TELEMETRY_OPTOUT=true

export SXHKD_SHELL=/bin/sh

# Local Variables:
# mode: sh
# End:
