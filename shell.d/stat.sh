#!/bin/sh
# some statistical commands

# top commands from history
comtop() { history -1000 | awk '{print $2}' | sort | uniq -c | sort -rn | head; }
# top packages by size
pkgtop() { dpkg-query -W -f='${Installed-Size} ${Package} \n' | sort -n; }
