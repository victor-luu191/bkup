#!/bin/bash
alias c="clear"
alias mv="mv -iv"
alias cp="cp -iv"
alias ll='ls -FGlAhp'
alias less='less -FSRXc'
alias numFiles='echo $(ls -1 | wc -l)'

# functions
recentFiles(){
nday=$1
find -type f -mtime -$nday | wc -l
}

upper() {
echo "$1" | tr '[a-z]' '[A-Z]'
}
