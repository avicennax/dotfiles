## shaxby's basic .bash_profile
#------------------------------

# prompt
export PS1="\[\e[1;92m\]\u\[\e[m\]@\[\e[1;33m\]\h\e[0m:\w$ "

# Set color prompt
export TERM="xterm-256color"

# Shell key bindings

# Unbinds \C-w
stty werase undef
bind '"\C-w": forward-word'
bind '"\C-b": backward-word'


## ENVIRONMENT VARIABLES
#-----------------------

# EDITOR
export EDITOR='vim'

## PATH
export PATH="$HOME/bin:$PATH"

## USER VARIABLES, FUNCTIONS AND ALIASES
#---------------------------------------

# Load user shell variables
if [ -f ~/.bash_variables ]; then
    . ~/.bash_variables
fi

# Load bash functions into session.
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Local machine definitions and settings
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

