Plug 'mileszs/ack.vim'

"" Use ag with ack.vim
if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
