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

# go up
alias up='cd ../'                           
alias upp='cd ../../'                       
alias uppp='cd ../../../'                   
alias upppp='cd ../../../../'               
alias uppppp='cd ../../../../../'           
alias upppppp='cd ../../../../../../'       

# --

## user aliases
alias cookiecutter-ds="cookiecutter https://github.com/avicennax/cookiecutter-data-science"
alias sublime="subl"
alias rmpyc='find . -name "*.pyc" -type f -delete'
alias gc="git current"

## s-search aliases
alias so="s -p stackoverflow"
alias explainshell="s -p explainshell"
alias github="s -p github"
alias gdocs="s -p googledocs"

# finder
alias findershow='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderhide='defaults write com.apple.finder ShowAllFiles FALSE'
