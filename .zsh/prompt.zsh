#setopt extended_glob

prompt_inode_help () {
    cat <<'EOF'

    prompt inode [<color1> [<color2> [<color3> [<color4> [<color5>]]]]]

    defaults are red, cyan, green, yellow, and white, respectively.
EOF
}

function precmd {
    gb="$(parse_git_branch)"
    if [ ! -z "${gb}" ]
    then
        export RPROMPT="$(echo ${gb}|sed 's#refs/heads/##')"
    else
        unset RPROMPT
    fi
}

autoload -U colors && colors

prompt_inode_setup () {
    local -a pcc

    pcc[1]=${1:-'red'}
    pcc[2]=${2:-'cyan'}
    pcc[3]=${3:-'green'}
    pcc[4]=${4:-'yellow'}
    pcc[5]=${5:-'white'}
    pcc[6]=${6:-'blue'}

    prompt_gentoo_prompt=${1:-'blue'}
    prompt_gentoo_user=${2:-'green'}
    prompt_gentoo_root=${3:-'red'}
    cred="%{$fg_bold[$pcc[1]]%}"
    ccyan="%{$fg_bold[$pcc[2]]%}"
    cgreen="%{$fg_bold[$pcc[3]]%}"
    cyellow="%{$fg_bold[$pcc[4]]%}"
    cwhite="%{$fg_bold[$pcc[5]]%}"
    cblue="%{$fg_bold[$pcc[6]]%}"
    post_prompt="%{$reset_color%}"

    if [ "$USER" = 'root' ]
    then
	base_prompt="$ccyan%B%n@%m%b$cred%U-%B(%b%u$ccyan%~$cred%U%)%u %# $post_prompt"
    else
	base_prompt="$cgreen%B%n@%m%b$cwhite-%B(%b$ccyan%~$cwhite%B%)%b %# $post_prompt"
    fi
    # PROMPT
    # user@host-(pwd)[hh:mm:ss] - %n@%m %D %*
    # smile signal last command result
    # export PS1="%(?.$cgreen✓ :%) .$cred✗ :( )$base_prompt"
    local ret_status="%(?:%{$fg_bold[green]%}v:%{$fg_bold[red]%}x%s)"
    export PS1="$ret_status $base_prompt"

}

# use starship as a shell prompt if available
if command -v starship 2>/dev/null 1>/dev/null; then
    eval $(starship init zsh);
else
    prompt_inode_setup "$@"
fi
# vim: set noet ts=4 tw=80 syntax=zsh:
# Local Variables:
# mode: sh
# End:
