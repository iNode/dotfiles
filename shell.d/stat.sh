# some statistical commands

# zip directory exclude temporarily files
comtop() { history -1000 | awk '{print $2}' | sort | uniq -c | sort -rn | head; }
pkgtop() { dpkg-query -W -f='${Installed-Size} ${Package} \n' | sort -n; }
