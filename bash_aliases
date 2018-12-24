# bash_aliases
# vim: filetype=sh
# DESCRIPTION: user defined aliases; machine specific.

## generic shell aliases
alias ls='ls -FG'
alias mkdir='mkdir -p'
alias ll="ls -lv"
alias la="ll -a"
alias lm="ll | less"
alias reload="source $bp"
alias home="cd ${HOME}"
alias qf="find . -name "

## grep aliases
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias gr="grep . -rnE -e "

## history aliases
alias h="history"
alias hg="history | grep "
alias ht="history | tail -n "

## tmux aliases
alias tls="tmux ls"
alias tas="tmux attach -t "
alias tss="tmux switch -t "
alias tks="tmux kill-session -t "

# go up black magic
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
