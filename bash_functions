# bash_functions
# vim: filetype=sh
# DESCRIPTION: user defined functions called by .bashrc or .bash_profile

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

# moves file/dir to OSX trash directory
function trash(){
    mv $1 ~/.Trash
}

# history with tail and grep.
function htg(){
    tailn=$1
    shift 1
    history | tail -n $tailn | grep $@
}
