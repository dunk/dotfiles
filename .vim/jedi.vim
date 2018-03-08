Plug 'davidhalter/jedi-vim'

" let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0

let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = "<c-g>"
let g:jedi#goto_definitions_command = "<c-d>"
let g:jedi#usages_command = "<leader>sa"
let g:jedi#usages_no_imports_command = "<leader>si"
autocmd FileType python setlocal completeopt-=preview

" Jump through the locations list - i.e. after a show all usages call
nnoremap <c-p> :cprevious<cr>
nnoremap <c-n> :cnext<cr>
