# GLOBAL
if [ "$SHELL" = "/bin/zsh" ];
then
    # common lazy commands
    alias ping='ping -c 5'
    alias path='echo -e ${PATH//:/\\n}'

    # Disable correction.
    alias ack='nocorrect ack'
    alias cd='nocorrect cd'
    alias cp='nocorrect cp -v'
    alias find='noglob find'
    alias gcc='nocorrect gcc'
    # alias gist='nocorrect gist'
    alias git='nocorrect git'
    alias grep='nocorrect grep'
    alias ln='nocorrect ln'
    alias man='nocorrect man'
    alias mcd='nocorrect mcd'
    alias mkdir='nocorrect mkdir'
    alias mv='nocorrect mv -v'
    alias mysql='nocorrect mysql'
    alias rm='nocorrect rm -v'


    # Disable globbing.
    alias fc='noglob fc'
    alias find='noglob find'
    alias ftp='noglob ftp'
    alias history='noglob history'
    alias locate='noglob locate'
    alias rsync='noglob rsync'
    alias scp='noglob scp'
    alias sftp='noglob sftp'

    # pipe aliases
    alias -g M='|more'
    alias -g L='|less -R'
    alias -g H='|head'
    alias -g T='|tail'
    alias -g EN='2>/dev/null'
    alias -g ES='2>&1'
    alias -g SN='1>/dev/null'
    alias -g SEN="2>&1 1>/dev/null"
    alias -g C="|ccze -A"
    alias -g D="|colordiff"
    alias -g G="|grep -n"
    alias -g GV="|grep -v"
    alias -g V="|vim -"
    alias -g ND='*(/om[1])' # newest directory
    alias -g NF='*(.om[1])' # newest file

    # Extenstions
    # extensions
    alias -s html=sensible-browser
    alias -s htm=sensible-browser

    alias -s avi=vlc
    alias -s flv=vlc
    alias -s mpg=vlc
    alias -s wmv=vlc
    alias -s mp4=vlc
    alias -s mkv=vlc

    alias -s murl=sshmount
    alias -s ps=evince
    alias -s pdf=evince
    alias -s xls=libreoffice
    alias -s xlsx=libreoffice
    alias -s doc=libreoffice
    alias -s docx=libreoffice
    alias -s ppt=libreoffice
    alias -s pptx=libreoffice
    alias -s odg=libreoffice

    # Tool related aliases
    if which pygmentize > /dev/null; then
	alias catc="pygmentize -f terminal256 -O style=native -g"
    fi

fi
# vim: set noet ts=4 tw=80 syntax=sh
# Local Variables:
# mode: sh
# End:
