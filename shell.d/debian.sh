# Ubuntu/Debian aliases
if [ -f /etc/debian_version ];
then
    alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
    if apt -h 2>/dev/null 1>/dev/null ; then
        alias eis='nocorrect apt list '	# only in program names
        alias aps='nocorrect apt show  '	# show info about a package
        alias sai='nocorrect sudo apt install '
        alias eisi='nocorrect apt list --installed '
        alias eisu='nocorrect apt list --upgradeable '
        eisd () { aptitude search \~d$* }
    else # apt not available yet
        alias eis='nocorrect aptitude search '	# only in program names
        alias aps='nocorrect  aptitude show  '	# show info about a package
        alias sai='nocorrect sudo aptitude install '
        eisi () { aptitude search \~i$* }
        eisd () { aptitude search \~d$* }
    fi

    alias acs='nocorrect apt-cache search '	# also in descriptions
    alias dq='noglob dpkg-query '
fi
