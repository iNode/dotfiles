# ZSH Aliases
#

# configuration
alias viz="$EDITOR ~/.zshrc; . ~/.zshrc"
alias via="$EDITOR ~/.zsh/aliases.zsh; . ~/.zsh/aliases.zsh"
alias vif="$EDITOR ~/.zsh/functions.zsh; . ~/.zsh/functions.zsh"
alias vib="$EDITOR ~/.bashrc; # ~/.bashrc"
# ZSH
alias rezsh="source ~/.zshrc"

setopt COMPLETE_ALIASES

# zsh specific aliases
# migrated to shell.d/aliases.zsh

# fasd specific aliases
alias v='f -e ee' # quick opening files with editor
alias m='f -e castnow' # quick opening files with castnow
alias o='a -e xdg-open' # quick opening files with xdg-open

# vim: set noet ts=4 tw=80 syntax=sh
# Local Variables:
# mode: sh
# End:
