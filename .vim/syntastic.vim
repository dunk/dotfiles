Plug 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_warning_symbol = "½"
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "S½"
let g:syntastic_style_error_symbol = "S✗"

nnoremap <leader>st :SyntasticToggleMode<cr>

" Show file outline
nnoremap <c-c> :TagbarToggle<CR>

" let g:syntastic_python_checkers=["python", "flake8"]
let g:syntastic_python_checkers=["pylint"]
" let g:syntastic_python_checkers=["flake8"]
" let g:syntastic_python_checkers=["python"]
" let g:syntastic_python_checkers=["python", "flake8", "pylint"]
