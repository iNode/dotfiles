# vim specific
if which vim >/dev/null 2>&1; then
    alias mutt="EDITOR=vim mutt"
    alias vi=vim
    alias revim="vim -S ~/.vim/lastSession.vim"
    # vim server mode
    alias vv='vim --servername $(hostname)'
    alias gvim='gvim --servername $(hostname)'
    # foreground edit
    alias fv='vim --servername $(hostname) --remote-wait'
    # background edit in server
    alias ev='vim --servername $(hostname) --remote-silent'
    # review current maps
    alias vmap='vim -c ":map" -c ":q" | less -R'
else
    alias vv='$EDITOR'
fi
