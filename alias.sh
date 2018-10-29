#!/bin/bash
source ~/utils.sh

alias c="clear"
alias mv="mv -iv"
alias cp="cp -iv"
alias ll='ls -FGlAhp'
alias less='less -FSRXc'
alias numFiles='echo $(ls -1 | wc -l)'

# functions
recentFiles(){
	nday=$1
	echo $(find -type f -mtime -$nday)
}

numRecentFiles() {
	path=$1
	nday=$2
	find "$path" -type f -mtime -$nday | wc -l
}

oldFiles() {
	path=$1
	nday=$2
	find "$path" -mindepth 1 -mtime +$nday
}

numOld() {
	path=$1
	nday=$2
	find "$path" -mindepth 1 -mtime +$nday | wc -l
}

delOld() {
	path=$1
	nday=$2
	n_old=$(numOld $path $nday)
	if [[ $n_old > 0 ]] ; then
	    seek_confirmation "found $n_old files with at least $nday days old, proceed to delete them?"
	    if is_confirmed; then
	        find "$path" -mindepth 1 -mtime +$nday -delete
	        n_old=$(numOld $path $nday)
	        e_success "$n_old old files left after deletion"
	    else
	        e_warning "no file deleted!"
	    fi
	else 
	    e_success "found no file with at least $nday days old"
	fi
}
