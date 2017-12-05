source ~/.profile

expand_aliases=1

lsdirs()
{
    cls -l $@ | grep '^d'
}

#077 would be more secure, but 022 is generally quite realistic
umask 022

#
# Add PATH variable
#
if [[ "$USER" == root ]]; then
    export PATH="/bin:/sbin:/usr/bin:/usr/sbin:${ROOTPATH}"
else
    export PATH="/bin:/usr/bin:/usr/local/bin:${PATH}"
fi
unset ROOTPATH

export UNAME_S=$(uname -s 2>&1 || echo "Linux" )
# Use hard limits, except for a smaller stack and no core dumps
#unlimit
#limit stack 8192
#limit core 0
#limit -s

###
# Options.  See zshoptions(1)
SAVEHIST=5000
HISTSIZE=5000
DIRSTACKSIZE=20
HISTFILE=~/.zsh_history

# Load options
source ~/.zsh/options.zsh

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# Load local host settings if it exists
# defile distrib specified settings (systype)
if [ -e ~/.host.zsh ];
then
    source ~/.host.zsh
fi

if [ -e ~/.bookmarks ];
then
    . ~/.bookmarks
fi

if [ -z $SYSTYPE ];
then
    export SYSTYPE="debian"
fi

# support for emacs' tramp
if [ "x$TERM" = "xdumb" -o "x$winid" != "x" ]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd 2>/dev/null
  unfunction preexec 2>/dev/null
  unalias ls 2>/dev/null
  PS1='$ '
  return
fi

## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Load aliases
#source ~/.bash/aliases
source ~/.zsh/aliases.zsh

# Load completion
source ~/.zsh/completion.zsh

# Load binds
source ~/.zsh/keybind.zsh

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS # don't record dupes in history
setopt HIST_REDUCE_BLANKS
autoload -U select-word-style
select-word-style bash

# Load Functions
source ~/.zsh/functions.zsh

# load shell.d definitions (sh and zsh compatible)
for f in ~/shell.d/*.sh ~/shell.d/*.zsh; do
    # echo "load $f"
    [ -s $f ] && source $f
done

# -------------------------------------
# Base Functions

src ()
{
    autoload -U zrecompile
    [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc ~/.zsh/*
    [ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old
    [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
    source ~/.zshrc
    command -v fix_path &>/dev/null && fix_path
}

command -v fix_path &>/dev/null && fix_path

preexec()
{
    [[ -t 1 ]] || return
    case $TERM in
	*xterm*|rxvt|(dt|k|E)term*) print -Pn "\e]0;($1) [%~] %m\a" ;;
#	screen) print -Pn "\ek<$1> [%~]\e\\" && print -Pn "\e]0;<$1> [%~] %m (screen)\a" ;;
	*) ;;
    esac
}


ve=/usr/share/virtualenvwrapper/virtualenvwrapper.sh
test -r $ve && source $ve

# init fasd
if which fasd &>/dev/null; then
	eval "$(fasd --init auto)"
fi

if [ -r "/etc/zsh_command_not_found" ]; then
    source /etc/zsh_command_not_found
fi

if which direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# vim: set noet ts=4 tw=80 syntax=zsh :
# Local Variables:
# mode: sh
# End:
