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

# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'

# Disable globbing.
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

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

# fasd specific aliases
alias v='f -e ee' # quick opening files with editor
alias m='f -e castnow' # quick opening files with castnow
alias o='a -e xdg-open' # quick opening files with xdg-open

# vim: set noet ts=4 tw=80 syntax=zsh
