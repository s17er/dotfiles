" file encoding
set encoding=utf-8

" syntax
syntax enable

" indent, tab
set noexpandtab ts=4 sts=4 sw=4
set autoindent

" plugins
filetype plugin indent on

" status line
set showmode

let mapleader=','

" quick close
nnoremap <Leader>w	:w<Enter>
nnoremap <Leader>q	:q!<Enter>

" cursor
noremap j			gj
noremap k			gk
noremap gj			j
noremap gk			k

" quick mode set
noremap ;			:
noremap :			;

" .vimrc
nnoremap <Leader>e	:<C-u>edit $MYVIMRC<Enter>
nnoremap <Leader>r	:<C-u>source $MYVIMRC<Enter>

" help
nnoremap <C-h>		:<C-u>help<Space>
nnoremap <C-h><C-h>	:<C-u>help<Space><C-r><C-w><Enter>

" fixed form sentense
inoremap <expr> ,,t	strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,,d	strftime('%Y-%m-%d')

" () {} []
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>

" shell
nnoremap <Leader>s	:<C-u>!

" input support
set backspace=eol,indent,start

" search options
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch

" grep -> vimgrep
set grepprg=internal

" for gvim
set clipboard+=unnamed

"au BufNewFile,BufRead *.clog setf spec
"au FileType spec noremap <buffer> <Leader>c <Plug>SpecChangelog
"let spec_chglog_format = "%Y-%m-%d  sinner"
"let spec_chglog_prepend = 1
"let spec_chglog_mystyle = 1

au BufNewFile,BufRead *.clog setf changelog
let g:changelog_dataformat = "%Y-%m-%d"
let g:changelog_username = "sinner"
let g:changelog_new_entry_format = "\t\n\t* %c\n"
let g:changelog_new_date_format = "%d  %u\n\n\t* %c\n\n\n"
let g:changelog_date_end_entry_search = '^\n\s*$'

" others
"nnoremap gc			`[v`]
"vnoremap gc			:<C-u>normal gc<Enter>
"onoremap gc			:<C-u>normal gc<Enter>

" Pascal / Delphi
if (1==1) "change to "1==0" to use original syntax
  au BufNewFile,BufRead *.pas,*.PAS set ft=delphi
else
  au BufNewFile,BufRead *.pas,*.PAS set ft=pascal
endif
" Delphi project file
au BufNewFile,BufRead *.dpr,*.DPR set ft=delphi
" Delphi form file
au BufNewFile,BufRead *.dfm,*.DFM set ft=delphi
au BufNewFile,BufRead *.xfm,*.XFM set ft=delphi
" Delphi package file
au BufNewFile,BufRead *.dpk,*.DPK set ft=delphi
" Delphi .DOF file = INI file for MSDOS
au BufNewFile,BufRead *.dof,*.DOF set ft=dosini
au BufNewFile,BufRead *.kof,*.KOF set ft=dosini
au BufNewFile,BufRead *.dsk,*.DSK set ft=dosini
au BufNewFile,BufRead *.desk,*.DESK set ft=dosini
au BufNewFile,BufRead *.dti,*.DTI set ft=dosini
" Delphi .BPG = Makefile
au BufNewFile,BufRead *.bpg,*.BPG set ft=make|setlocal makeprg=make\ -f\ % 

