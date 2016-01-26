execute pathogen#infect()

let mapleader = ","
set wrap
set linebreak

" Enable block cursor in normal mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Enable spellcheck
" set spell
set spelllang=de_at

" Required:
filetype plugin indent on

let g:task_rc_override = 'rc.defaultwidth=0'

let wiki_1 = {}
let wiki_1.path = '~/links/winhome/owncloud/wiki'
"let wiki_1.index = 'main'
let wiki_1.auto_toc = 1

let g:vimwiki_list = [wiki_1]

let g:vimwiki_folding="syntax"

autocmd BufNewFile,BufRead *.wiki inoremap <F5> <C-R>=strftime("*%H:%M Uhr*: ")<CR>
autocmd BufNewFile,BufRead *.wiki nnoremap <F5> "=strftime("*%H:%M Uhr*: ")<CR>P

if &diff
	colorscheme evening
endif

