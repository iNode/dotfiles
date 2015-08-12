
if command -v ccze  >/dev/null 2>&1;
then
    export colorizer=ccze
else
    export colorizer=less
fi

alias slog='S tail -f /var/log/syslog | $colorizer'
alias mlog='S tail -f /var/log/maillog | $colorizer'
alias dlog='S tail -f /var/log/daemon.log | $colorizer'

# critical dmesg
alias cdmesg="dmesg -xT -l err,crit,emerg"
