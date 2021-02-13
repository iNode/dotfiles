#!/usr/bin/env zsh
#
# GLOBAL
if [ "$SHELL" = "/bin/zsh" ]; then
    # Disable correction.
    for cmd (ack ag cp find gcc git grep ln man mkdir mv mysql rm nmcli
	     ip ag man w3m docker) alias $cmd="nocorrect $cmd"

    # Disable globbing.
    for cmd (fc find history rsync locate scp sftp) alias $cmd="noglob $cmd"

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
    alias -g Y='|yank-cli'      # yank "word" from output of the command
    alias -g YL='|yank-cli -l'  # yank "line" from output of the command
    alias -g P='$(xsel)'        # paste from clipboard, example "cd P"

    # Extenstions
    # extensions
    alias -s html=sensible-browser
    alias -s htm=sensible-browser

    alias -s murl=sshmount

    for ext (avi flv mpg wmv mp4 mkv) alias -s $ext=vlc
    for ext (ps pdf djvu cbr cbz) alias -s $ext=zathura
    for ext (epub) alias -s $ext=mupdf
    for ext (jpg jpeg png) alias -s $ext=sxiv
    for ext (xls xlsx doc docx ppt pptx odg) alias -s $ext=libreoffice

fi
# vim: set noet ts=4 tw=80 syntax=sh
# Local Variables:
# mode: sh
# End:
