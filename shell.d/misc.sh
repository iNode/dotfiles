# Aliases for applications
alias diff="colordiff"
alias miso='mkisofs -joliet-long -jcharset utf8 -r '
alias wxchm="LANG=ru_RU.CP1251 xchm"

#encode
alias icwn='iconv -f cp1251 -t koi8-r'
alias icnw='iconv -f koi8-r -t cp1251'
alias icwu='iconv -f cp1251 -t utf-8'
alias icuw='iconv -f utf-8 -t cp1251'
alias icku='iconv -f koi8-r -t utf-8'
# line endings
alias u2d='perl -pi -e "s/\\n/\\r\\n/;"'
alias d2u='perl -pi -e "s/\\r\\n/\\n/;"'
alias dEl="perl -ni -e 'print unless /^\s*$/;'"
