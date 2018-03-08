Plug 'scrooloose/nerdtree'

nnoremap <leader>d :NERDTreeToggle<CR>

" Exit if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let NERDTreeIgnore=['\.pyc$', '.DS_Store']
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeShowHidden=1

let NERDTreeMapOpenSplit='ss'
let NERDTreeMapPreviewSplit='S'
let NERDTreeMapOpenVSplit='vv'
let NERDTreeMapPreviewVSplit='V'
