# bash/zsh commaon compatiable aliases
alias signfile="gpg -u iNode --clearsign -b -v "
alias encrypt="gpg -c -v "

if which gtts_import 1>/dev/null; then
    # echo "create say function"
    say() {
	. ~/pyenv3/bin/activate
	gtts_import "$@" || gtts_import "$@"
	deactivate
    }
fi

# Local Variables:
# mode: sh
# End:
