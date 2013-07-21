# emacs alias section here
# =========================

if [ `which emacs` ]; then
    #alias ee="emacsclient -n -a gvim "
    alias em='emacsclient -c -a ""'
    alias es='emacsclient -e "(emms-show)"'
    # jump to current emacs path
    alias jm='eval cd $(emacsclient -e "(with-current-buffer (window-buffer (frame-selected-window)) default-directory)")'
    # DirEd Here
    alias deh='emacsclient -e "(dired \"`pwd`\")"'
    # dir emms add
    alias dea='emacsclient -e "(emms-add-directory-tree \"`pwd`\")"'
    # edit file with root privs
    alias E="SUDO_EDITOR=\"emacsclient -c -a emacs\" sudoedit"
    eer() {
        # TODO: add this to ee
        # example: eer long/relative/path/file.c:350
        # results: ee `ffip file.c`:350:
      fn=`echo $1 | perl -pe 's/(.*\/)//; s/([^:]+):.*/$1/;'`
      line=`echo $1| perl -pe 's/.*:(\d+):?/$1/'`
      echo $fn __:$line
      ee `ffip $fn`:$line:
    }

fi

#emacs section end
