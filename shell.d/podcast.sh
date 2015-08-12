
prec() {
    title="stub"
    if [ ! -z "$1" ]; then
        title="$1"
    fi
    # echo $title
    cd ~/podcasts/
    # find last record
    # find . -name "${title}_???\.*" | wc -l
    last=$(find . -name "${title}_???\.*" | \
        perl -pe 's/.*'"$title"'_(\d+)\..*/$1/' | \
        sort -n | tail -n 1 )
    # echo $last
    [ -z "$last" ] && last=0
    echo $(( last = last + 1 ))
    filename=$(printf "%s_%04d.wav" "$title" "$last")
    # echo $filename
    arecord -vv -c 1 -f S16_LE -r24000 "$filename"
}

pplay() {
    title="stub"
    if [ ! -z "$1" ]; then
        title="$1"
    fi
    # echo $title
    cd ~/podcasts/
    # find last record
    # find . -name "${title}_???\.*" | wc -l
    last=$(find . -name "${title}_???\.*" | \
        perl -pe 's/.*'"$title"'_(\d+)\..*/$1/' | \
        sort -n | tail -n 1 )
    # echo $last
    [ -z "$last" ] && last=1
    filename=$(printf "%s_%04d.wav" "$title" "$last")
    # echo $filename
    aplay "$filename"
}
