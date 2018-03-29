## personal aliases
alias ls='ls -FG'
alias rm='rm -i'
alias rmpyc='find . -name "*.pyc" -type f -delete'
alias cp='cp -i'
alias mv='mv -i'
# -> prevents accidentally clobbering files.
alias mkdir='mkdir -p'
alias ll="ls -lv"
alias la="ll -a"
alias lm="ll | less"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias cookiecutter-ds="cookiecutter https://github.com/avicennax/cookiecutter-data-science"
alias sublime="subl"
alias reload="source $bp"

## s-search aliases
alias s-so="s -p stackoverflow"
alias explainshell="s -p explainshell"
alias github="s -p github"
alias gdocs="s -p googledocs"
