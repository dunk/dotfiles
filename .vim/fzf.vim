" Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

let g:fzf_tags_command = 'ctags -R --python-kinds=-i'
nnoremap <leader>t :Tags<CR>
nnoremap <leader>f :GFiles<CR>
" imap <c-x><c-o> <plug>(fzf-complete-buffer-line)
