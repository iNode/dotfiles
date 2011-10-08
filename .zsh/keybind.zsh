# Key bindings
#
    bindkey -e 
case $TERM in
    linux|screen)
    bindkey "^[[2~" yank
    bindkey "^[[3~" delete-char
    bindkey "^[[5~" up-line-or-history
    bindkey "^[[6~" down-line-or-history
    bindkey "^[[1~" beginning-of-line
    bindkey "^[[4~" end-of-line
    bindkey "^[e" expand-cmd-path
    bindkey "^[[A" up-line-or-search
    bindkey "^[[B" down-line-or-search
    bindkey " " magic-space
    ;;
    xterm*|*rxvt*)
    bindkey "^[[2~" yank
    bindkey "^[[3~" delete-char
    bindkey "^[[5~" up-line-or-history
    bindkey "^[[6~" down-line-or-history
    bindkey "^[[7~" beginning-of-line
    bindkey "^[[8~" end-of-line
    bindkey "^[e" expand-cmd-path
    bindkey "^[[A" up-line-or-search
    bindkey "^[[B" down-line-or-search
    bindkey " " magic-space
    ;;
esac

bindkey "^Xi" incremental-complete-word ## C-x-i
bindkey -s "^Xe" '^[[1~emacs \n'		## C-x-e
bindkey -s "^Xm" 'alsamixer\n'			## C-x-m
bindkey -s "^Xl" 'export AUTOLS=true\n'			## C-x-l
bindkey -s "^XL" 'unset AUTOLS\n'			## C-x-L

#zle -N run-command
#function run-command {
#    zle trash-zle
#    eval "$STACK"
#    zle -s
#}
bindkey -s "^[c" "fag"
#bindkey -s "^E" 'eject\n'
