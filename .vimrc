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

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/hbi/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/hbi/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'farseer90718/vim-taskwarrior'
NeoBundle 'neilagabriel/vim-geeknote'
NeoBundle 'mkitt/tabline.vim'
NeoBundle 'AshyIsMe/2048'
NeoBundle 'godlygeek/tabular'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'DirDiff.vim'
NeoBundle 'majutsushi/tagbar'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let g:task_rc_override = 'rc.defaultwidth=0'


hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

let g:vimwiki_list = [{
\'auto_toc':'1'
\}]

let g:vimwiki_folding="syntax"
