## shaxby's .bash_profile
#------------------------

# prompt
export PS1="\[\e[1;92m\]\u@\e[0m\h::\W-\e[0;36m\t\e[0m$ "

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# added by Anaconda3 4.4.0 installer
export PATH="$HOME/anaconda/bin:$PATH"
export PYTHONPATH=$py:$PYTHONPATH

## ENVIRONMENT VARIABLES
#-----------------------

# EDITOR
export EDITOR='vim'

## PYTHONPATH
export PYTHONPATH="$HOME/projects/"

## PATH
export PATH="$HOME/code/mongodb/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/code/mjpro150/bin:$PATH"

## path shortcuts
py="$HOME/code/Python"
bp="$HOME/.bash_profile"
pjs="$HOME/projects"

# opens URL parameters in Chrome tabs
function google()
{
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" "$@" &
}

# opens github cheatsheets
function cheatsheets()
{
	if [ "$#" -gt "0" ]; then
		topic=$1
		google "https://github.com/avicennax/cheatsheets/blob/master/${topic}.md"
	else
		google "https://github.com/avicennax/cheatsheets"
	fi
}

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

## helper functions

# moves file/dir to OSX trash directory
function trash(){
    mv $1 ~/.Trash
}

## s-search aliases
alias s-so="s -p stackoverflow"
alias explainshell="s -p explainshell"
alias github="s -p github"
alias gdocs="s -p googledocs"

