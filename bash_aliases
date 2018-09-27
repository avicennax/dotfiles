# bash_aliases
# vim: filetype=sh
# DESCRIPTION: user defined aliases; machine specific.

## generic shell aliases
alias ls='ls -FG'
alias mkdir='mkdir -p'
alias ll="ls -lv"
alias la="ll -a"
alias lm="ll | less"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias reload="source $bp"
alias home="cd ${HOME}"
alias qf="find . -name "
alias gr="grep . -rnE -e "

# go up
while [ ${cur_dep=0} -lt ${rec_dep=9} ]
do
    up="${up="cd "}../"
    eval alias ${last="up"}="'${up}'"
    last="${last}p"
    ((cur_dep++)) 
done

## user aliases
alias rmpyc='find . -name "*.pyc" -type f -delete'
alias gc="git current"
