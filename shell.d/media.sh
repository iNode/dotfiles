
# mocp status
alias mocs='mocp -Q "%state %title"'
# manage usb headphone
alias usbmixer="alsamixer -D hw:1"

# open vlc with stream from camera
function cam-open {
  cvlc -f v4l2:///dev/video0
}

# encode sound track from source file to ogg format
do-ogg() {
    wavout=out.wav
    oggfile=out.ogg
    nice mplayer "$1" -ao pcm:file="$wavout" fast 1>/dev/null 2>&1
    nice oggenc - -b 256 >! "$oggfile" < "$wavout"
}
