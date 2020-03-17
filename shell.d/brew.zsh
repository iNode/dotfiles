# linuxbrew specific init for zsh

if [ ! -d ~/.linuxbrew ]; then
    return 0
fi

eval $($HOME/.linuxbrew/bin/brew shellenv)

if ! command -v brew &>/dev/null; then
    return 0
fi

FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
if [ ! -f ~/.linuxbrew/first ]; then
    # do it once after installation
    # regenerate comlition
    rm -f ~/.zcompdump; compinit
    touch ~/.linuxbrew/first
fi
