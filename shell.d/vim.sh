# vim specific
if which vim >/dev/null 2>&1;
then
   alias mutt="EDITOR=vim mutt"
   alias vi=vim
   alias revim="vim -S ~/.vim/lastSession.vim"
   # vim server mode
   alias v='vim --servername $(hostname) $@'
   alias gvim='gvim --servername $(hostname) $@'
   # foreground edit
   alias fv='vim --servername $(hostname) --remote-wait "$@"'
   # background edit in server
   alias ev='vim --servername $(hostname) --remote-silent $@'
else
    alias v='$EDITOR'
fi
