# vim specific
if [ `which vim` ];
then
   alias mutt="EDITOR=vim mutt"
   alias vi=vim
   alias revim="vim -S ~/.vim/lastSession.vim"
   alias v='vim'
   alias gv='gvim'
else
    alias v=$EDITOR
fi
