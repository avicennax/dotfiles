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
" quoting made easy
Plugin 'tpope/vim-surround'
" easy commenting
Plugin 'scrooloose/nerdcommenter'
" show git changes in side column
Plugin 'airblade/vim-gitgutter'
" sensible defaults; maybe some redundancy between
" vim-sensible and set statements below.
Plugin 'tpope/vim-sensible'
" tag browser
Plugin 'majutsushi/tagbar'
" autocompletion
Plugin 'Shougo/deoplete.nvim'
" deoplete dependencies
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
" python autocompletion
Plugin 'zchee/deoplete-jedi'

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

" Visually show TABs and trailing whitespace
set listchars=tab:»\ ,trail:·

" Allows for magic like /* vim: tw=60 ts=2: */, but is a potential security vulnerability
set modeline

" Replace tabs with spaces
set expandtab
set tabstop=4

" Allows deletion past an append and similar
set backspace=indent,eol,start

" Use syntax highlighting/indentation based on filetype
syntax on
filetype indent plugin on

" Show line numbers in left column
set number
highlight LineNr ctermfg=grey

" Always use UTF-8 encoding
set encoding=utf-8

" Don't generate swp files
set noswapfile

" highlight matches
set hlsearch

" use autocomplete
"let g:deoplete#enable_at_startup = 1

"" Mappings

let mapleader=","
nnoremap :SC :SyntasticCheck
nnoremap :SR :SyntasticReset
"" New tags mapping
nnoremap <leader>l <c-]>
"" Break out of tag window (hack)
nnoremap <leader>t <c-t>
"" Remove trailing whitespaces
nnoremap <leader>rw :%s/\s\+$//e<cr>


"" ctags
function LoadRepoTags()
    let l:repo_tags = systemlist("git rev-parse --git-dir")[0] . "/tags"
    let &l:tags = l:repo_tags
endfunction

nnoremap <leader>lr :call LoadRepoTags()<cr>


"" Python bindings

nnoremap :pyi :Pyimport
" Set python tags
if !empty($CONDA_DEFAULT_ENV)
    au FileType python setlocal tags=~/tags/py-$CONDA_DEFAULT_ENV.tags
    let g:pytags = "~/tags/py-$CONDA_DEFAULT_ENV.tags"
else
    au FileType python setlocal tags=~/tags/py-root.tags
    let g:pytags = "~/tags/py-root.tags"
endif
"" Insert pdb.set_trace() at cursor
autocmd FileType python :iabbrev <buffer> ipdb> import ipdb; ipdb.set_trace()
"" Load python tags file
autocmd Filetype python nnoremap <leader>ll :let &l:tags=g:pytags<cr>
autocmd Filetype python nnoremap :pyi :Pyimport


"" Hy bindings
au FileType hy set tabstop=2


"" deoplete auto-completion
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {'python': ['jedi']})
let g:deoplete#sources#jedi#show_docstring = 1
highlight Pmenu ctermbg=244 ctermfg=15
highlight PmenuSel ctermbg=35 ctermfg=15

"" air-line
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_powerline_fonts=1
endif

let g:airline_section_warning = ''
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#stl_format_warn = '%E{[%e]}'

"" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_check_on_open = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 2
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\u26A0"
