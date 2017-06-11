
cmdfu () {
    # Search commandlinefu.com from the command line using the API
    curl "http://www.commandlinefu.com/commandmatching/%$(echo "$@" | sed ' /-/g')/$(echo -n "$@" | base64)/plaintext" --silent \
        | vim -R -
}

cmdfu_download ()
{
    curl "http://www.commandlinefu.com/commands/browse/sort-by-vote/plaintext" | grep -vE "_curl_|\.com by David" > clf-ALL.txt
# /[0-9000:25]
}

zen () {
    # github zen
    echo "\n$(curl https://api.github.com/zen 2>/dev/null)\n"
}

cheat () {
    curl http://cheat.sh/$1
}

alias excuses='echo `telnet bofh.jeffballard.us 666 2>/dev/null` |grep --color -o "Your excuse is:.*$"'
alias funfacts='wget http://www.randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'

wanip() {
  wget -q -O - checkip.dyndns.com/ | awk '{print $6}'| sed 's/<.*>//'
}
