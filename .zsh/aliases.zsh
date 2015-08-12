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
# compctl -g *(/) -- cd_ls

alias signfile="gpg -u iNode --clearsign -b -v "
alias encrypt="gpg -c -v "

# zsh specific aliases
# migrated to shell.d

# extensions
alias -s ps=evince
alias -s pdf=evince
alias -s doc=libreoffice
alias -s docx=libreoffice
alias -s xls=libreoffice
alias -s xlsx=libreoffice
alias -s html=sensible-browser
alias -s htm=sensible-browser
alias -s avi=vlc
alias -s mp4=vlc

# vim: set noet ts=4 tw=80 syntax=zsh
