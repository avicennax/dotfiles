set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" vim status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" syntax error highlighting
Plugin 'scrooloose/syntastic'
" filesystem tree integration
Plugin 'scrooloose/nerdtree'
" python auto-completion
Plugin 'davidhalter/jedi-vim'
" quoting made easy
Plugin 'tpope/vim-surround'
" easy commenting
Plugin 'scrooloose/nerdcommenter'
" show git changes in side column
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Basic settings

colorscheme elflord

" Place backup files in an alternate directory so they don't clutter working space
" (Make sure the directory exists; it will try each until one works)
set directory=$HOME/.backup,$HOME/tmp,$HOME
set backupdir=$HOME/.backup,$HOME/tmp,$HOME

" Visually show TABs and trailing whitespace (RECOMMENDED)
set listchars=tab:»\ ,trail:·

" Allows for magic like /* vim: tw=60 ts=2: */, but is a potential security vulnerability
set modeline

" Replace tabs with spaces
set expandtab
set tabstop=4

" Allows deletion past an "a"ppend and similar (OPTIONAL)
set backspace=indent,eol,start

" Use syntax highlighting/indentation based on filetype (RECOMMENDED)
syntax on
filetype indent plugin on

" Show line numbers in left column
set number
highlight LineNr ctermfg=grey

" Don't generate swp files
set noswapfile

" Always use UTF-8 encoding
set encoding=utf-8


"" Mappings
let mapleader=","

map :SC :SyntasticCheck
map :pyi ::Pyimport


"" air-line
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_section_warning = ''
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#stl_format_warn = '%E{[%e]}'

"" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 2
