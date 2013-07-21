# no touchpad
notp () {
    tp=$(xinput list | perl -ne 'if (/Touchpad/i) { s/.*id=(\d+).*/$1/; print;}')
    xinput set-prop $tp "Device Enabled" 0
}

touchpad () {
    tp=$(xinput list | perl -ne 'if (/Touchpad/i) { s/.*id=(\d+).*/$1/; print;}')
    xinput set-prop $tp "Device Enabled" 1
}
