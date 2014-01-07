function ffip()
{
    # find file in project
    # when call without arg returns root project path
    # root of project determined by .git/.hg/etc. folder
    pattern="-d .git -o -d .hg"
    curdir=`pwd`
    while [ "x`pwd`" = "x/" ]; do
        if [ $pattern ]
        then
            if [ "x$1" != "x" ];
            then
                find `pwd` -iname $*
                break
            fi
            echo `pwd`
            break;
        else
            cd ..
        fi
    done

    cd $curdir
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

# print stack trace of a core file without needing to enter gdb interactively
alias gdbbt='gdb -q -n -ex bt -batch'
alias gdbr='gdb --args'

alias cdr="cd `ffip`"
