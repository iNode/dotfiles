help()
{ # help for builtins commands
    man zshbuiltins | sed -ne "/^       $1 /,/^\$/{s/       //; p}"
}
