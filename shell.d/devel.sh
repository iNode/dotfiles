function ffip()
{
    # find file in project
    # when call without arg returns root project path
    # root of project determined by .git/.hg/etc. folder
    pattern="-d .git -o -d .hg -o -d .projectroot"
    curdir=`pwd`
    while [ "x`pwd`" != "x/" ]; do
        if [ `echo $pattern` ]
        then
            if [ "x$1" != "x" ];
            then
                find `pwd` -iname $*
                break
            fi
            echo `pwd`
            break;
        else
            \cd ..
        fi
    done
    \cd $curdir
}

function cscope-add ()
{
    curdir=`pwd`
    adddir=$1
    cd $adddir
    cscope-indexer -r -l -i ${curdir}/cscope.add
    cd ${curdir}
    cat cscope.add | perl -pe 's#^#'$adddir'/#' >> cscope.files
    cscope -b
}

function vgrep ()
{
  cmd="egrep -v "
  for arg in $*; do
      cmd="$cmd -e $arg"
  done
  eval $cmd
}

function mgrep ()
{
  cmd="egrep "
  for arg in $*; do
      cmd="$cmd -e $arg"
  done
  eval $cmd
}

function cdr ()
{
    cd $(ffip)
}

# print stack trace of a core file without needing to enter gdb interactively
alias gdbbt='gdb -q -n -ex bt -batch'
alias gdbr='gdb --args'

alias gn="grep -rnH"

alias xmlfmt="tr '\n' ' ' | xmllint --format - |pygmentize -l xml"
