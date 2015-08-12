## aliases for rcs
alias hgl="hg log --template '{date|shortdate} {author|user}: {rev} {node|short} {desc|firstline}\n'"
alias gst='git status '
# CVS
alias cvu="cvs update"
alias cvc="cvs commit"
alias svu="svn update"
alias svs="svn status"
alias svc="svn commit"

git_action() {
	if [ -d .git ]; then
		if [ -f .git/dotest/rebasing ]; then
			ACTION="rebase"
		elif [ -f .git/dotest/applying ]; then
			ACTION="apply"
		elif [ -f .git/dotest-merge/interactive ]; then
			ACTION="rebase -i"
		elif [ -d .git/dotest-merge ]; then
			ACTION="rebase -m"
		elif [ -f .git/MERGE_HEAD ]; then
			ACTION="merge"
		elif [ -f .git/index.lock ]; then
			ACTION="locked"
		elif [ -f .git/BISECT_LOG ]; then
			ACTION="bisect"
		else	ACTION="nothing"
		fi
		echo $ACTION
	else	echo --
	fi
}

git_xz() {
	git archive master | xz -9 > "$PWD".tar.xz
}
