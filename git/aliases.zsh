#!/bin/sh
alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gcb='git-copy-branch-name'
alias gup='git stash && git pull --rebase origin master && git stash pop'
alias xpath='xmlstarlet sel -t -v'
alias merge-all="merge eSign && merge Portal && merge EgisUI && merge BulkCapture && merge PaperTrailWeb"
alias clean-all="clean eSign && clean Portal && clean EgisUI && clean BulkCapture && clean PaperTrailWeb"


merge() {
	github-pullrequests-merge-helper git@github.com:egis/$1.git --pattern="Update\s.+\sto\sversion"
}

clean() {
	echo "Cleaning $1"
	cd /workspace/misc/$1
	cleanup-merges
}


cleanup-merges() {
	git fetch --all
	git branch -r | grep autoupdate | sed s%origin/%% | xargs -L 1 git push origin --delete 
}

gpr() {
  gp && open-pr "$*"
}

gi() {
  curl -s "https://www.gitignore.io/api/$*";
}
