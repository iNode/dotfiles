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

bindkey "^Xi" incremental-complete-word             ## C-x-i
bindkey -s "^Xm" 'alsamixer\n'                      ## C-x-m

bindkey -s "^Xh" 'unset HISTFILE\n'                 ## C-x-h
bindkey -s "^XH" 'export HISTFILE=~/.zsh_history\n' ## C-x-H

bindkey -s "^[c" "fag"
bindkey -s "^[r" "far"

# bash alike edit-command-line
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey -s "^X^o" "ranger^M"
bindkey -s "^X^G" "git status .^m"

bindkey -s "\C-o" "ee -n .^m"

## file rename magick, M-m
bindkey "^[m" copy-prev-shell-word

# M-C-m runs last command
function runprev() { zle up-line-or-history ; zle accept-line } ; zle -N runprev ; bindkey '^[^M' runprev

# Key bindings notes:
# C-x C-e - edit command line in EDITOR
# C-x C-o - open current directory in ranger
# C-o - run emacs dired here
# C-] - popd
# C-[ - ..
# M-m - copy-prev-shell-word, usefull for rename

# vim: set noet ts=4 tw=80 syntax=sh
# Local Variables:
# mode: sh
# End:
