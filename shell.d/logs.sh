if [ `which ccze` ];
then
    colorizer=ccze
else
    colorizer=less
fi

alias slog='S tail -f /var/log/syslog | $colorizer'
alias mlog='S tail -f /var/log/maillog | $colorizer'
alias dlog='S tail -f /var/log/daemon.log | $colorizer'
