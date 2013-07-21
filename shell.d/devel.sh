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

# print stack trace of a core file without needing to enter gdb interactively
alias gdbbt='gdb -q -n -ex bt -batch'

alias cdr="cd `ffip`"
