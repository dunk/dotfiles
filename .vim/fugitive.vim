Plug 'tpope/vim-fugitive'

augroup colors
    autocmd!
    " Make diffs look like they do in the terminal with my git config
    autocmd ColorScheme * hi diffAdded guifg=#72B836
    autocmd ColorScheme * hi diffRemoved guifg=#AA4627

    autocmd ColorScheme * hi DiffAdd guifg=#72B836 guibg=#1A1A1A
    autocmd ColorScheme * hi DiffDelete guifg=#AA4627 guibg=#1A1A1A
    " Make searches show up in yellow for better visibility
    autocmd ColorScheme * hi Search guibg=Yellow
augroup END

nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gs :Gstatus<CR>

" function GdiffInTab()
"     tabedit %
"     Gdiff
" endfunction
" command GdiffInTab tabedit %|Gdiff
" nnoremap -- :tabedit %<CR>:Gdiff<CR>
"

function! TabDiffGStatus()
    if has('multi_byte_encoding')
        let colon = '\%(:\|\%uff1a\)'
    else
        let colon = ':'
    endif
    let filename = matchstr(matchstr(getline(line('.')),'^#\t\zs.\{-\}\ze\%( ([^()[:digit:]]\+)\)\=$'), colon.' *\zs.*')
    tabedit %
    execute ':Gedit ' . filename
    Gvdiff
endfunction
command! TabDiffGStatus call TabDiffGStatus()
autocmd FileType gitcommit nnoremap <buffer> dt :TabDiffGStatus<CR>

"nnoremap <leader>tc :tabclose<CR>
"" cmap gs GStatus


