#!/bin/zsh

help()
{ # help for builtins commands
    man zshbuiltins | sed -ne "/^       $1 /,/^\$/{s/       //; p}"
}

cd_ls() {
    pushd "$1"; [ "x$AUTOLS" = "xtrue" ] &&  ls -lthr
}

make_dir_complete() {
    local aliasname=$1
    local dirname=$(readlink -f $2)
    FUNC="$aliasname () { cd $dirname/\$@ }"
    eval $FUNC
    compctl -/ -W $dirname $aliasname
}
# fast jump to projects dir
make_dir_complete p ~/devel/proj/

# zip directory exclude temporarily files
zipdir() { zip "$@".zip -r "$@" -x "*/.DS_Store" "*/.svn/*" }


# view pdf with elinks
vp () {
    (echo Please wait...; FN=`basename $1`;
    cp $1 /tmp/$FN && cd /tmp &&
	pdftohtml $FN $FN.html >/dev/null && elinks $FN.html ; rm /tmp/$FN*
    )
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
    . ~/.bookmarks
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
