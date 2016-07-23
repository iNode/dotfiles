# emacs alias section here
# =========================

if [ "$(which emacs)" ]; then
    #alias ee="emacsclient -n -a gvim "
    alias em='emacsclient -c -a ""'
    # emacs client execute/evaluate
    alias ece='emacsclient -e '
    #
    # alias es='ece "(emms-show)"'
    # DirEd Here
    alias deh='ece "(dired \"`pwd`\")"'
    # jump to current emacs path
    alias jm='eval cd $(ece "(with-current-buffer (window-buffer (frame-selected-window)) default-directory)")'
    # dir emms add
    alias dea='ece "(emms-add-directory-tree \"`pwd`\")"'
    # emacs scratch
    es () {
        emacsclient -e '(switch-to-buffer "*scratch*" t t)'
        if [ ! -z "$TMUX" ]; then
            tmux select-window -t emacs
        fi
        if [ ! -z "$DISPLAY" ]; then
            if [ "$(which emacs-snapshot)" ]; then
                ~/bin/wmctrl-switch-to emacs-snapshot emacs-snapshot.Emacs
            else
                ~/bin/wmctrl-switch-to emacs emacs.Emacs
            fi
        fi
    }
    ediff() {
      if [ $# -lt 2 ]
      then
          echo "USAGE: ediff <FILE 1> <FILE 2>"
      else
          # The --eval flag takes lisp code and evaluates it with EMACS
          emacsclient -c --eval "(ediff-files \"$1\" \"$2\")"
      fi
    }
    # edit file with root privs
    alias E="SUDO_EDITOR=\"emacsclient -c -a emacs\" sudoedit"
    eer() {
        # TODO: add this to ee
        # example: eer long/relative/path/file.c:350
        # results: ee `ffip file.c`:350:
      fn=$(echo "$1" | perl -pe 's/(.*\/)//; s/([^:]+):.*/$1/;')
      line=$(echo "$1"| perl -pe 's/.*:(\d+):?/$1/')
      ee "$(ffip "$fn"):$line:"
    }

    # auto fix typos
    alias emasc=emacs
    alias emcas=emacs

fi

#emacs section end
