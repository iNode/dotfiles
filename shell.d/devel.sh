ffip()
{
    # find file in project
    # when call without arg returns root project path
    # root of project determined by .git/.hg/etc. folder
    pattern="-d .git -o -d .hg -o -d .projectroot"
    curdir=$(pwd)
    while [ "x$(pwd)" != "x/" ]; do
        if [ "$pattern" ]
        then
            if [ "x$1" != "x" ];
            then
                find "$(pwd)" -iname "$@"
                break
            fi
            pwd
            break;
        else
            cd ..
        fi
    done
    cd "$curdir"
}

cscope_add ()
{
    curdir=$(pwd)
    adddir="$1"
    cd "$adddir"
    cscope-indexer -r -l -i "${curdir}/cscope.add"
    cd "${curdir}"
    perl -pe 's#^#'"$adddir"'/#' < cscope.add >> cscope.files
    cscope -b
}

vgrep ()
{ # multiple pattern inVert match grep
  cmd="egrep -v "
  for arg in "$@"; do
      cmd="$cmd -e $arg"
  done
  eval "$cmd"
}

mgrep ()
{ # multiple pattern grep
  cmd="egrep "
  for arg in "$@"; do
      cmd="$cmd -e $arg"
  done
  eval "$cmd";
}

cdr ()
{
    cd "$(ffip "$@")";
}

# cat to file and make it executable
scat () { cat > "$1"; chmod +x "$1"; }

# print stack trace of a core file without needing to enter gdb interactively
alias gdbbt='gdb -q -n -ex bt -batch'
alias gdbr='gdb --args'

alias gn="grep -rnH"
alias xmlfmt="tr -d '\n' | xmllint --format - |pygmentize -l xml"

# go specific
alias gb='go install -v'
