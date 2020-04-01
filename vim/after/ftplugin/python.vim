" Language: Python
" Author: Simon Haxby

"" Insert pdb.set_trace() at cursor
iabbrev <buffer> ipdb> import ipdb; ipdb.set_trace()
iabbrev <buffer> main> if __name__ == "__main__":\n\tpass