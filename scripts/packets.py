#!/usr/bin/env python
# base system configuration
# start from:
# sudo aptitude install pip
# sudo pip install cuisine
# then run this script

import cuisine
from cuisine import *

cuisine.mode_local()
# env.host = ["localhost"]

pkgs = "dmenu dzen2 sdcv xclip zsh tmux emacs git mercurial git-core ack-grep exuberant-ctags cscope cscope-el vim ipython xbindkeys vlc silversearcher-ag ranger"
desktop_pkgs=" vlc google-chrome-stable keepassx mc xbindkeys"

def setup():
    packages = pkgs.split(" ")
    with sudo():
        package_ensure(packages, update=True)
    run("git clone https://github.com/iNode/dotfiles _dotfiles")
    run("_dotfiles/makeln.sh")
    # TODO: install dropbox and setup emacs

setup()

