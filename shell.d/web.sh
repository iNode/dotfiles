
cmdfu () {
    # Search commandlinefu.com from the command line using the API
    curl "http://www.commandlinefu.com/commandmatching/%$(echo "$@" | sed ' /-/g')/$(echo -n $@ | base64)/plaintext" --silent \
        | vim -R -
}

cmdfu_download ()
{
    curl "http://www.commandlinefu.com/commands/browse/sort-by-vote/plaintext" | grep -vE "_curl_|\.com by David" > clf-ALL.txt
# /[0-9000:25]
}
