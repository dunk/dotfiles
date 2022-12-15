Plug 'scrooloose/nerdtree'

" Exit if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let NERDTreeIgnore=['\.pyc$', '.DS_Store']
let NERDTreeIgnore=['^__pycache__$', '^.git$', '^.mypy_cache$', '^venv$', '^.pytest_cache$', '^venv-for-vim$']
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1

let NERDTreeMapOpenSplit='ss'
let NERDTreeMapPreviewSplit='S'
let NERDTreeMapOpenVSplit='vv'
let NERDTreeMapPreviewVSplit='V'

" Open NERDTree in the directory of the current file (or /home if no file is open)
" nmap <silent> <C-i> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

" nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>do :call NERDTreeToggleInCurDir()<CR>
" nmap <silent> <C-i> :call NERDTreeToggleInCurDir()<cr>
