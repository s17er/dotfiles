"----------------------------------------
" �V�X�e���ݒ�
"----------------------------------------
scriptencoding cp932
"����炳�Ȃ�����ʍX�V�̗}��
set noerrorbells
set novisualbell
set visualbell t_vb=

if has('multi_byte_ime') || has('xim')
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIM�̓��͊J�n�L�[
    "set imactivatekey=C-space
  endif
endif

"----------------------------------------
" �\���ݒ�
"----------------------------------------
" �p�ꃁ�j���[
"set langmenu=en
" �c�[���o�[���\��
"set guioptions-=T
" �R�}���h���C���̍���
set cmdheight=2

" �J���[�ݒ�:
"colorscheme mycolor

" �t�H���g�ݒ�
set linespace=1
if has('win32')
  set guifont=MeiryoKe_Gothic:h8:cSHIFTJIS
  set guifontwide=MeiryoKe_Gothic:h8:cSHIFTJIS
  set linespace=0
elseif has('mac')
  set guifont=Osaka�|����:h14
elseif has('xfontset')
  set guifontset=a14,r14,k14
  set linespace=0
else
endif

"���b�Z�[�W�̓��{�ꉻ
let $LANG='ja'

""""""""""""""""""""""""""""""
" Window�ʒu�̕ۑ��ƕ��A
""""""""""""""""""""""""""""""
if 1 && has('gui_running')
  if has('unix')
    let s:infofile = '~/.vim/.vimpos'
  else
    let s:infofile = '~/_vimpos'
  endif

  function! s:WinPosSizeSave(filename)
    let saved_reg = @a
    redir @a
    winpos
    redir END
    let px = substitute(@a, '.*X \(\d\+\).*', '\1', '') + 0
    let py = substitute(@a, '.*Y \(\d\+\).*', '\1', '') + 0
    execute 'redir! >'.a:filename
    if px > 0 && py > 0
      echo 'winpos '.px.' '.py
    endif
    echo 'set lines='.&lines.' columns='.&columns
    redir END
    let @a = saved_reg
  endfunction

  augroup WinPosSizeSaver
  autocmd!
  augroup END
  execute 'autocmd WinPosSizeSaver VimLeave * call s:WinPosSizeSave("'.s:infofile.'")'
  if filereadable(expand(s:infofile))
    execute 'source '.s:infofile
  endif
  unlet s:infofile
endif

"----------------------------------------
" ���j���[�A�C�e���쐬
"----------------------------------------
silent! aunmenu &File.Save
silent! aunmenu &File.�ۑ�(&S)
silent! aunmenu &File.�����\��(&D)\.\.\.

let message_revert="�ēǍ����܂���?"
amenu <silent> 10.330 &File.�ēǍ�(&U)<Tab>:e!  :if confirm(message_revert, "&Yes\n&No")==1<Bar> e! <Bar> endif<CR>
amenu <silent> 10.331 &File.�o�b�t�@�폜(&K)<Tab>:bd  :confirm bd<CR>
amenu <silent> 10.340 &File.�ۑ�(&W)<Tab>:w  :if expand('%') == ''<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>
amenu <silent> 10.341 &File.�X�V���ۑ�(&S)<Tab>:update  :if expand('%') == ''<Bar>browse confirm w<Bar>else<Bar>confirm update<Bar>endif<CR>
amenu <silent> 10.400 &File.���o�b�t�@�����\��(&D)<Tab>:DiffOrig  :DiffOrig<CR>
amenu <silent> 10.401 &File.���o�b�t�@�ƍ����\��(&D)<Tab>:Diff\ #  :Diff #<CR>
amenu <silent> 10.402 &File.�����\��(&D)<Tab>:Diff  :browse vertical diffsplit<CR>
