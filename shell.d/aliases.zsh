# GLOBAL
if [ "$SHELL" = "/bin/zsh" ];
then
    # common lazy commands
    alias git='nocorrect git'
    alias mv='nocorrect mv -v'
    alias cp='nocorrect cp -v'
    alias rm='nocorrect rm -v'
    alias mkdir='nocorrect mkdir'
    alias man='nocorrect man'
    alias find='noglob find'

    # pipe aliases
    alias -g M='|more'
    alias -g L='|less'
    alias -g H='|head'
    alias -g T='|tail'
    alias -g EN='2>/dev/null'
    alias -g SN='1>/dev/null'
    alias -g SEN="2>&1 1>/dev/null"
    alias -g C="|ccze -A"
    alias -g D="|colordiff"

    # Extenstions
    alias -s avi=vlc
    alias -s flv=vlc
    alias -s mpg=vlc
    alias -s wmv=vlc
    alias -s mp4=vlc
    alias -s murl=sshmount
    alias -s pdf=evince
    alias -s doc=libreoffice
    alias -s xls=libreoffice
    alias -s docx=libreoffice
    alias -s xlsx=libreoffice
fi
