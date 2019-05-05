#!/bin/sh

# Ubuntu/Debian aliases
if [ -f /etc/debian_version ]; then
    alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
    if command -v aptitude 2>/dev/null 1>/dev/null ; then
        # apt not available yet
        alias eis='nocorrect aptitude search '  # only in program names
        alias aps='nocorrect  aptitude show  '  # show info about a package
        alias sai='nocorrect sudo aptitude install '
        eisi () { aptitude search "~i$1" ; }
        eisd () { aptitude search "~d$1" ; }
    else
        if command -v apt 1>/dev/null ; then
            # alias eis='nocorrect apt list '   # only in program names
            alias aps='nocorrect apt show  '    # show info about a package
            alias sai='nocorrect sudo apt install '
            alias eisi='nocorrect noglob apt list --installed '
            alias eisu='nocorrect noglob apt list --upgradeable '
            alias eis='nocorrect noglob apt search' # only in program names
            #eisd () { aptitude search \~d$* }
        fi
    fi

    alias acs='nocorrect apt-cache search ' # also in descriptions
    alias acw='nocorrect apt-cache rdepends --installed ' # show what dependencies require this package, apt-cache-why
    alias dq='noglob dpkg-query '
fi

apt_file_remote() {
    pattern="$1"
    release="$2"
    if [ -z "$release" ]; then
        release="$(lsb_release -c -s)"
    fi

    wget "http://packages.ubuntu.com/search?searchon=contents&keywords=$pattern&mode=exactfilename&suite=$release" -qO- | \
        html2text -width 999 | grep --color=never '^/'
}

apt_history () {
  case "$1" in
    install)
      zgrep --no-filename 'install ' "$(ls -rt /var/log/dpkg*)"
      ;;
    upgrade|remove)
      zgrep --no-filename "$1" "$(ls -rt /var/log/dpkg*)"
      ;;
    rollback)
      zgrep --no-filename upgrade "$(ls -rt /var/log/dpkg*)" | \
        grep "$2" -A10000000 | \
        grep "$3" -B10000000 | \
        awk '{print $4"="$5}'
      ;;
    list)
      zgrep --no-filename '' "$(ls -rt /var/log/dpkg*)"
      ;;
    *)
    cat<<EOF
NAME:
    apt-history - Prints apt history

USAGE:
    apt-history install
    apt-history upgrade
    apt-history remove
    apt-history rollback
    apt-history list

PARAMETERS:
    install - Lists all packages that have been installed.
    upgrade - Lists all packages that have been upgraded.
    remove - Lists all packages that have been removed.
    rollback - Lists rollback information.
    list - Lists all contains of dpkg logs.
EOF
    return 1
      ;;
  esac
}
