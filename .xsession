#!/bin/sh
#
# path to local settings
    
userclients=$HOME/.Xclients
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
# user modmap
#
xmodmap -e "keysym 0xff9c = F31"
xmodmap -e "keysym 0xff99 = F32"
xmodmap -e "keysym 0xff9b = F33"
#xmodmap -e "remove mod4 = Hyper_L"

if [ -f $userresources ]; then xrdb -merge $userresources; fi
if [ -f $usermodmap ];    then xmodmap $usermodmap; fi

xsetroot -solid LightSlateGrey
# set keymap
setxkbmap -layout "us,ru(typewriter)" -option "grp:caps_toggle,grp_led:caps"
setxkbmap -option terminate:ctrl_alt_bksp

eval `ssh-agent` 
eval `dbus-launch`


# exec fluxbox
xset -b
xset r rate 200 10
xbindkeys &
#$HOME/.fluxbox/startup
#exec ion3 -searchdir ~/.ion3/main/
#xmonad
uxterm -g 120x120x0x0 &
while true; do
    sh -c ./mywm
    sleep 5
done 
#$HOME/opt/stumpwm/bin/stumpwm
#exec icewm-session
#exec xfce4-session
