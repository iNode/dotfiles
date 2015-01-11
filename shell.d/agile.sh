# scripts and aliases for agile results with evernote and geeknote

weekly() {
    year=`date +%Y`
    week=`date +%V`
    if [ "$1x" != "x" ]; then
        week=$(( $week + $1 ))
        week=`printf "%02d" $week`
    fi
    geeknote edit --note $year-w$week || ( \
        geeknote create --title $year-w$week --notebook 5_Weekly_Outcomes && \
            geeknote edit --note $year-w$week )
}


daily() {
    title=`date +%Y-%m-%d`
    year=`date +%Y`
    geeknote edit --note $title || ( \
        geeknote create --title $title --notebook 4_Daily_Outcomes && \
        geeknote edit --note $title )
    # geeknote edit --note $year-w$week
}


monthly() {
    title=`date +%Y-%m-monthly`
    geeknote edit --note $title || ( \
        geeknote create --title $title --notebook 6_Monthly_Outcomes && \
        geeknote edit --note $title )
    # geeknote edit --note $year-w$week
}


yearly() {
    title=`date +%Y-yearly`
    geeknote edit --note $title || ( \
        geeknote create --title $title --notebook 7_Yearly_Outcomes && \
        geeknote edit --note $title )
    # geeknote edit --note $year-w$week
}


aredit() {
    # agile results edit specific note
    if [ $# -lt 1 ]; then
        echo "Usage: aredit NOTE-TITLE"
    fi
    $title=$1
    geeknote edit --note $title
}
