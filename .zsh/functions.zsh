#!/bin/zsh

svndiff () { svn diff "${@}" | colordiff | less -R -E }
hgdiff () { hg diff "${@}" | colordiff | less -R -E }
eisi () { aptitude search \~i$* }
eisd () { aptitude search \~d$* }

translate() {
    wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=${2:-en}|${3:-ru}" | sed -E -n 's/[[:alnum:]": {}]+"translatedText":"([^"]+)".*/\1/p';
    echo ''
    return 0;
}

wanip() {
  wget -q -O - checkip.dyndns.com/ | awk '{print $6}'| sed 's/<.*>//'
}

cd_ls() {
    pushd "$1"
    if [ "x$AUTOLS" = "xtrue" ];
    then
        ls
    fi
}

# mkdir & cd to it
function mcd() {
  mkdir -p "$1" && cd "$1";
}

ssh-reagent () {
    for agent in /tmp/ssh-*/agent.*; do
        export SSH_AUTH_SOCK=$agent
        if ssh-add -l 2>&1 > /dev/null; then
            echo Found working SSH Agent:
            ssh-add -l
            return
        fi
    done
    echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

# zip directory exclude temporarily files
zipdir() { zip "$@".zip -r "$@" -x "*/.DS_Store" "*/.svn/*" }

# zip directory exclude temporarily files
comtop () { history -1000 | awk '{print $2}' | sort | uniq -c | sort -rn | head }
pkgtop () { dpkg-query -W -f='${Installed-Size} ${Package} \n' | sort -n }

# view pdf with elinks
vp () {
    (echo Please wait...; FN=`basename $1`;
    cp $1 /tmp/$FN && cd /tmp &&
	pdftohtml $FN $FN.html >/dev/null && elinks $FN.html ; rm /tmp/$FN*
    )
}

# allow to see disconnection time
myssh () {
    \ssh $*; date
}

# allow do ssc ssh stop
ssc() {
    sudo /etc/init.d/$*
}

lss () {
    du -sb ./*(.) | sort -n
}

parse_git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref}")"
#    echo "("${ref#refs/heads/}")"
}


bookmark() {
    x=$1
    curd="`pwd`"
    [ -z $x ] && echo "usage: bookmark TAGNAME and cd \$TAGNAME" && return
    grep -q "^$x=" ~/.bookmarks && echo "TAG $x already exist, remove it manually" && return
    grep -q "='$curd'\$" ~/.bookmarks && echo "bookmark for PATH $curd already exist, remove it manually" && return
    echo "export $x='$curd'" >> ~/.bookmarks
}

zle -N fag
fag () {
    # fast go
    perl -ne 'print if s/export (.*)=.*/$1/;' < ~/.bookmarks | dmenu | read t; eval cd \$$t
}

oggme() {
    if [ "$1" = "-h" ];
    then
        echo "oggme <indir:./> <outdir:ogg>"
    fi
    indir=${1:-"./"}
    outdir=${2:-"ogg"}
    test -e $outdir || mkdir $outdir
    pacpl --to ogg $indir --outdir $outdir
}

doogg() {
    fifofile=___fifo
    wavout=out.wav
    oggfile=out.ogg
    nice mplayer "$1" -ao pcm:file=$wavout fast 2>&1 1>/dev/null
    nice oggenc - -b 256 >! $oggfile < $wavout
}

lssr () {
    x=$1
    [ -z $x ] && x="."
    find $x -type f -print0 | xargs -0 -L1 du -sb | sort -n
}

lssd()
{
    du -sb ./*/ | sort -n
}

# view pdf with w3m
vpi () {
    (echo Please wait...;
    FN=`basename $1`;
    cp $1 /tmp/$FN && cd /tmp && \
	pdftohtml $FN $FN.html >/dev/null && w3m ${FN}s.html ;
	rm /tmp/$FN* )
}

# Search file, containing string in name
function ff_() { find . -type f -iname '*'$*'*' -ls ; }

# quick umount
function qum() {
    point2umount=$(mount | awk '!/none|proc|fuse/{print $1,"|",$3}' | dmenu)
    if [ ! -z $point2umount ]
    then
        um=$(echo $point2umount| awk '{print $1}')
#        echo $um
        sudo umount $um
    fi
}

# usage: awkc 1,2 instead of awk '{print $1,$2}'
function awkc() {
    p=\$$( echo $1 | sed 's/,/,\$/g' )
    shift
    eval "awk '{ print $p }'" $*
}

# Sum first column, example: awkc 1 file | awks
function awks() {
    awk 'BEGIN{sum=0} {sum+=$1} END{print sum}' $*
}

## file manager options
## set TO path
#sto() {
#    test -z "$1" || test -d "$1" && export _to="$1"
#}
## select files
#sel() {
#    test -z "@*" || export _sel=$_sel
#}

# vim: ts=4 tw=80 syntax=zsh :
