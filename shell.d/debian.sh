# Ubuntu/Debian aliases
if [ -f /etc/debian_version ];
then
    alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
    if apttiude -h 2>/dev/null 1>/dev/null ; then
        # apt not available yet
        alias eis='nocorrect aptitude search '	# only in program names
        alias aps='nocorrect  aptitude show  '	# show info about a package
        alias sai='nocorrect sudo aptitude install '
        function eisi () { aptitude search \~i$* ; }
        function eisd () { aptitude search \~d$* ; }
    else
        if apt -h 2>/dev/null 1>/dev/null ; then
            # alias eis='nocorrect apt list '	# only in program names
            alias aps='nocorrect apt show  '	# show info about a package
            alias sai='nocorrect sudo apt install '
            alias eisi='nocorrect noglob apt list --installed '
            alias eisu='nocorrect noglob apt list --upgradeable '
            alias eis='nocorrect noglob apt search' # only in program names
            #eisd () { aptitude search \~d$* }
        fi
    fi

    alias acs='nocorrect apt-cache search '	# also in descriptions
    alias dq='noglob dpkg-query '
fi

apt-file-remote()
{
    pattern="$1"
    release="$2"
    if [ -z "$release" ]; then
        release="$(lsb_release -c -s)"
    fi

    wget "http://packages.ubuntu.com/search?searchon=contents&keywords=$pattern&mode=exactfilename&suite=$release" -qO- | \
        html2text -width 999 | grep --color=never '^/'
}
