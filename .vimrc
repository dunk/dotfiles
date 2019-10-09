set nocompatible encoding=utf-8 directory=~/.vim/tmp backup backupdir=~/.vim/backup undofile undodir=~/.vim/undo hlsearch ignorecase smartcase expandtab tabstop=4 shiftwidth=4 incsearch number relativenumber noerrorbells ruler hidden showcmd background=dark cursorline wildchar=<Tab> wildmenu wildmode=full wildcharm=<c-z> wildignore+=*.pyc background=dark backspace=indent,eol,start

syntax on
colorscheme dunk
hi CursorLine guibg=#303030

let mapleader=" "
" let maplocalleader=","

" We don't use the maplocalleader binding above much, and "," is a very useful
" key, so instead map it to repeat-macro
:map , @@

" Use jk instead of esc to return to normal mode
inoremap jk <esc>
inoremap <esc> <nop>

" Clear the current search (useful because hlsearch is on)
nnoremap <c-l> :let @/ = ""<CR>

" Flashback last buffer
nnoremap <c-h> :e#<CR>

" Scroll the viewport
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

" When jumping forward and backwards, align with the middle of the screen
nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz
" However, in python files jump by function instead
" autocmd Filetype python nmap <c-b> [pfzt
" autocmd Filetype python nmap <c-f> ]pfzt

"" Show syntax errors locations window
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
nnoremap <c-e> :lopen<CR>

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
autocmd Filetype python set colorcolumn=120
autocmd Filetype python highlight ColorColumn ctermbg=5

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


call plug#begin('~/.vim/plugged')
    """""""" General
    Plug 'tpope/vim-dispatch'
    Plug 'vim-airline/vim-airline'
    source ~/.vim/bufexplorer.vim
    source ~/.vim/nerdtree.vim
    source ~/.vim/fzf.vim
    Plug 'terryma/vim-expand-region'
    Plug 'rhysd/clever-f.vim'
    Plug 'martinda/Jenkinsfile-vim-syntax'

    """""""" Code
    Plug 'gorkunov/smartpairs.vim'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-commentary'
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
    source ~/.vim/ack.vim
    source ~/.vim/autoformat.vim
    source ~/.vim/jedi.vim
    Plug 'triglav/vim-visual-increment'
    Plug 'tpope/vim-surround'

    """""""" Python
    Plug 'kana/vim-textobj-user'
    Plug 'bps/vim-textobj-python'
    Plug 'fisadev/vim-isort'
    " Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }

    """""""" JS
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    """""""" Git
    Plug 'airblade/vim-gitgutter'
    source ~/.vim/fugitive.vim
    Plug 'tpope/vim-rhubarb'

    """""""" Docker
    Plug 'ekalinin/Dockerfile.vim'

    """""""" Markdown
    Plug 'plasticboy/vim-markdown'

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

" source ~/.vim/dunkpytest.vim
