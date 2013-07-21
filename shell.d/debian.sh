# Ubuntu/Debian aliases
if [ -f /etc/debian_version ];
then
    alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'
    alias sai='nocorrect sudo aptitude install '
    alias eis='nocorrect aptitude search '	# only in program names
    alias acs='apt-cache search '	# also in descriptions
    alias aps='aptitude show  '	# show info about a package
    alias dq='noglob dpkg-query '
fi
