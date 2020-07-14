set nocompatible encoding=utf-8 directory=~/.vim/tmp backup backupdir=~/.vim/backup undofile undodir=~/.vim/undo hlsearch ignorecase smartcase expandtab tabstop=4 shiftwidth=4 incsearch number relativenumber noerrorbells ruler hidden showcmd background=dark cursorline wildchar=<Tab> wildmenu wildmode=full wildcharm=<c-z> wildignore+=*.pyc background=dark backspace=indent,eol,start

syntax on
colorscheme dunk
hi CursorLine guibg=#303030

let mapleader=" "
" let maplocalleader=","

" We don't use the maplocalleader binding above much, and "," is a very useful
" key, so instead map it to repeat-macro
:map , @@

" Remap capital W, because I typo this **all the time**
command! W w
" And the rest
command! WQ wq
command! Wq wq
command! Q q

" Use jk instead of esc to return to normal mode
inoremap jk <esc>
inoremap <esc> <nop>

" Clear the current search (useful because hlsearch is on)
nnoremap <c-l> :let @/ = ""<CR>

" Flashback last buffer
nnoremap <c-h> :e#<CR>

" Make window fullscreen
nnoremap <c-o> :only<CR>

" Scroll the viewport
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

" When jumping forward and backwards, align with the middle of the screen
nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz
" However, in python files jump by function instead
" autocmd Filetype python nmap <c-b> [pfzt
" autocmd Filetype python nmap <c-f> ]pfzt

" Quickly jump back to last edited location
nnoremap <BS> `.

" Easier access to command mode
nnoremap ; :

" Make Y behave like C and D
nnoremap Y y$

" Show syntax errors locations window
nnoremap <c-e> :lopen<CR>

" Quickly edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quickly edit bash config
nnoremap <leader>eb :vsplit ~/.bash_profile<cr>

" Install plugins
" Disabled in favour of 'paste inside' shortcut
" nnoremap <leader>pi :PlugInstall<cr>

"" Show syntax errors locations window
" nnoremap <c-e> :lopen<CR>

" show which syntactic group the object under the cursor belongs to
nnoremap <leader>wit :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                         \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                         \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Split the window in various directions with shift key combos
nnoremap <leader>kk :split<CR>
nnoremap <leader>jj :below split<CR>
nnoremap <leader>hh :vsplit<CR>
nnoremap <leader>ll :rightbelow vsplit<CR>

" Tab to cycle through windows
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" " Tab to cycle through windows
" nnoremap <Tab> [pf
" nnoremap <S-Tab> ]pf

" Fix that typo that I do all the time
" cmap W w

" Make paste work on OSX
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
end


autocmd FileType gitcommit,markdown,mkd,rst setlocal spell nonumber norelativenumber
" autocmd FileType vim setlocal shiftwidth=4

" Show a colored column for python files, to help conforming to PEP8
" autocmd Filetype python set colorcolumn=120
" autocmd Filetype python set colorcolumn=88
" autocmd Filetype python highlight ColorColumn ctermbg=5

" Trying to make Ruby files not choke because syntax highlighting interfeares
" with relative number (https://github.com/vim/vim/issues/282)
autocmd Filetype ruby set norelativenumber

" Nuke numbers (for better copy-paste)
" TODO: also turn off git markers
nnoremap <leader>nn :set number! relativenumber!<CR>

" Duplicate and preserve original line
nmap <leader>dd yypkgccj

" Paste n-1, taking a text object
nnoremap <leader>p :set opfunc=TastyPasty<cr>g@

" vnoremap <silent> s :<c-u>call TastyPasty(visualmode(), 1)<cr>
function! TastyPasty(vt)
    execute "normal! `[v`]d\"0P"
endfunction

" Close a buffer without messing with the windows.
nnoremap <silent> <leader>q :bp\|bd #<CR>

" augroup fmt
"   autocmd!
"   autocmd BufWritePre *.sql undojoin | Neoformat
" augroup END

call plug#begin('~/.vim/plugged')
    """""""" General
    Plug 'tpope/vim-dispatch'
    source ~/.vim/airline.vim
    source ~/.vim/bufexplorer.vim
    source ~/.vim/nerdtree.vim
    source ~/.vim/fzf.vim
    Plug 'terryma/vim-expand-region'
    Plug 'rhysd/clever-f.vim'
    Plug 'tpope/vim-repeat'
    source ~/.vim/togglelist.vim
    Plug 'christoomey/vim-sort-motion'

    """""""" Code
    Plug 'gorkunov/smartpairs.vim'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-commentary'
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
    source ~/.vim/ack.vim
    " source ~/.vim/autoformat.vim
    source ~/.vim/jedi.vim
    Plug 'triglav/vim-visual-increment'
    Plug 'tpope/vim-surround'
    Plug 'kburdett/vim-nuuid'
    Plug 'sbdchd/neoformat'

    """""""" Python
    Plug 'kana/vim-textobj-user'
    Plug 'bps/vim-textobj-python'
    Plug 'fisadev/vim-isort'
    " Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'psf/black'

    """""""" JS
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    """""""" Git
    source ~/.vim/gitgutter.vim
    source ~/.vim/fugitive.vim
    Plug 'tpope/vim-rhubarb'

    """""""" Docker
    Plug 'ekalinin/Dockerfile.vim'

    """""""" Markdown
    Plug 'plasticboy/vim-markdown'

    """""""" Jenkins
    Plug 'martinda/Jenkinsfile-vim-syntax'

    """""""" Database
    Plug 'tpope/vim-dotenv'
    source ~/.vim/dadbod.vim

    """""""" Future plugins to explore / get working
    Plug 'mbbill/undotree'
    " Plug 'junegunn/gv.vim'
    " Plug 'honza/vim-snippets'
    " Plug 'Shougo/neocomplete.vim'
    " Plug 'alfredodeza/pytest.vim'
call plug#end()

" function! s:extract_mark(line)
"     " Marks show up in the second character from the left, so extract this
"     return a:line[1]
" endfunction

" function! s:marks_list()
"     " Return the uppercase (multi-file) marks currently defined, as a list
"     redir => cout
"     silent marks ABCDEFGHIJKLMNOPQRSTUVWXYZ
"     redir END

"     let marks_list_text = split(cout, "\n")
"     " The first line is a header, so we skip that
"     let marks_list = map(marks_list_text[1:], 's:extract_mark(v:val)')
"     return marks_list
" endfunction

" function! s:get_last_defined_mark()
"     " What is the last mark sequentially defined by the user?
"     let marks_list = s:marks_list()
"     return char2nr(marks_list[-1])
" endfunction

" function! AppendMark()
"     " Append a mark to the end of the marks list at the current position in the current file
"     let last_defined_mark = s:get_last_defined_mark()
"     let next_mark = last_defined_mark + 1
"     execute "normal! m" . nr2char(next_mark)
" endfunction
" command! AppendMark call AppendMark()
" nnoremap <leader>ma :call AppendMark()<CR>

" function! CycleMarks()
"     " Cycle through the defined marks, looping around 

"     " Init the first time through. 65 = the letter "A"
"     if !exists("g:last_mark")
"         let g:last_mark = 65
"     endif

"     let last_defined_mark = s:get_last_defined_mark()

"     let next_mark = g:last_mark + 1

"     " cycle around at the end of the last defined mark
"     " cycle around at the end of the alphabet
"     " TODO: next_mark > 90 is redundant? because the last_defined_mark can't
"     " ever be anything greater than Z.
"     if next_mark > last_defined_mark || next_mark > 90
"         let next_mark = 65
"     endif

"     " Jump to the next mark
"     execute "normal! '" . nr2char(next_mark)

"     let g:last_mark = next_mark

" endfunction
" command! CycleMarks call CycleMarks()
" nnoremap <c-m> :call CycleMarks()<CR>








" function! VarExampleFunction()
" python << endPython

" import vim

" def working_with_vars():
"     # Check if a variable exists
"     eval_value = int(vim.eval('exists("g:example_global_var")'))
"     if eval_value:
"         print("The variable is defined => {}".format(eval_value))
"     else:
"         print("The variable is not defined => {}".format(eval_value))

" working_with_vars()

" endPython
" endfunction

" command! VarExample call VarExampleFunction()

" source ~/.vim/dunkpytest.vim
