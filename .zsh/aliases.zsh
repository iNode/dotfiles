# ZSH Aliases
#

# configuration
alias viz="$EDITOR ~/.zshrc; . ~/.zshrc"
alias via="$EDITOR ~/.zsh/aliases.zsh; . ~/.zsh/aliases.zsh"
alias vif="$EDITOR ~/.zsh/functions.zsh; . ~/.zsh/functions.zsh"
alias vib="$EDITOR ~/.bashrc; # ~/.bashrc"
# ZSH
alias rezsh="source ~/.zshrc"

alias cd='cd_ls'
setopt COMPLETE_ALIASES
compctl -g *(/) -- cd_ls

alias signfile="gpg -u iNode --clearsign -b -v "
alias encrypt="gpg -c -v "

# vim: set noet ts=4 tw=80 syntax=zsh
