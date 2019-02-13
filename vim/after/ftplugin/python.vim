" Language: Python
" Author: Simon Haxby

" Set python tags
if !empty($CONDA_DEFAULT_ENV)
    setlocal tags=~/tags/py-$CONDA_DEFAULT_ENV.tags
    let g:pytags = "~/tags/py-$CONDA_DEFAULT_ENV.tags"
else
    setlocal tags=~/tags/py-root.tags
    let g:pytags = "~/tags/py-root.tags"
endif

"" Insert pdb.set_trace() at cursor
iabbrev <buffer> ipdb> import ipdb; ipdb.set_trace()
iabbrev <buffer> main> if __name__ == "__main__":\n\tpass

"" Load python tags file
nnoremap <leader>ll :let &l:tags=g:pytags<cr>

"" Set formatprg to autopep8
if executable("autopep8")
    setlocal formatprg=autopep8\ -
endif
