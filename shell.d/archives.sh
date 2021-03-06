###### usage: roll <foo.tar.gz> ./foo ./bar
roll()
{
  FILE="$1"
  case $FILE in
    *.tar.bz2) shift && tar cjf "$FILE" "$@" ;;
    *.tar.gz) shift && tar czf "$FILE" "$@" ;;
    *.tgz) shift && tar czf "$FILE" "$@" ;;
    *.zip) shift && zip "$FILE" "$@" ;;
    *.rar) shift && rar "$FILE" "$@" ;;
      *) echo "unknown format!" ;;
  esac
}

##################################################
# Extract - extract most common compression	 #
# types						 #
##################################################

extract() {
  local e=0 i c
  for i; do
    if [ -f $i -a -r $i ]; then
        c=''
        case $i in
          # *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
          #        c='bsdtar xvf' ;;
          *.7z)  c='7z x'       ;;
          *.Z)   c='uncompress' ;;
          *.bz2) c='bunzip2'    ;;
          *.exe) c='cabextract' ;;
          *.gz)  c='gunzip'     ;;
          *.rar) c='unrar x'    ;;
          *.xz)  c='unxz'       ;;
          *.zip) c='unzip'      ;;
          *)     echo "$0: cannot extract \`$i': Unrecognized file extension" >&2; e=1 ;;
        esac
        [ "x"$c != "x" ] && command $c "$i"
    else
        echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
    fi
  done
  return $e
}
