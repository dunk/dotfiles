" Allow non-vi stuff
set nocompatible

call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/syntastic'
    Plug 'nvie/vim-flake8'
    Plug 'tpope/vim-fugitive'
    Plug 'mileszs/ack.vim'
    Plug 'gorkunov/smartpairs.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-commentary'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'tpope/vim-dispatch'
    Plug 'alfredodeza/pytest.vim'
    Plug 'fisadev/vim-isort'
    Plug 'kana/vim-textobj-user'
    Plug 'bps/vim-textobj-python'
    Plug 'plasticboy/vim-markdown'
call plug#end()

set encoding=utf-8

set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo

" Syntax highlighting on
syntax on

" Highlight searches by default
set hlsearch

" Ignore case when searching with a lowercase string
set ignorecase smartcase

" Expand tabs into spaces
set expandtab

" Number of spaces a <tab> counts for
set tabstop=4

" Reindent (<<, >>) and automatic c-style indentation columns
set shiftwidth=4

" Search as you type
set incsearch

" Line numbers on
set number

" Number lines relatively to cursor line
set relativenumber

" Turn error bells off
set noerrorbells

" Show line and column number of cursor position
set ruler

" Allow hidden buffers with unsaved changes
set hidden

" Show (partial) command in the last line of the screen.
set showcmd

set clipboard=unnamed

" Set leader key
let mapleader=" "
let maplocalleader=","

" Use jk instead of esc to return to normal mode
inoremap jk <esc>
inoremap <esc> <nop>

" Nuke the current search, so that the display is clear again
nnoremap <c-l> :let @/ = ""<CR>

" Scroll the viewport using keys analogous to movement in normal mode
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

" Flashback last buffer
nnoremap <c-h> :e#<CR>

" Discard other windows
nnoremap <c-o> :only<CR>

" Jump to next and previous whitespace
nnoremap <leader>j }
nnoremap <leader>k {

nmap <c-p> [pf
nmap <c-n> ]pf

" When jumping forward and backwards, align with the middle of the screen
nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz

" Edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Turn on spelling for gitcommit messages, markdown and rst
autocmd FileType gitcommit setlocal spell nonumber norelativenumber
autocmd FileType markdown setlocal spell nonumber norelativenumber
autocmd FileType mkd setlocal spell nonumber norelativenumber
autocmd FileType rst setlocal spell nonumber norelativenumber
autocmd FileType vim setlocal shiftwidth=4

" Jump to definition
nnoremap <c-g> <c-]>

" Dark color scheme
set background=dark

colorscheme dunk

" Show the line that the cursor is on
set cursorline

" Colour of the line that the cursor is on
hi CursorLine guibg=#303030

set wildchar=<Tab> wildmenu wildmode=full wildcharm=<c-z>

" Ignore these files when completing
set wildignore+=*.pyc

" Show a colored column for python files, to help conforming to PEP8
autocmd Filetype python set colorcolumn=120
autocmd Filetype python highlight ColorColumn ctermbg=5

" Trying to make Ruby files not choke because syntax highlighting interfeares
" with relative number (https://github.com/vim/vim/issues/282)
autocmd Filetype ruby set norelativenumber


"" For syntastic so that the error list is always populated (might cause
"" conflicts)
let g:syntastic_always_populate_loc_list = 1
"" Show syntax errors locations window
nnoremap <c-e> :lopen<CR>

" show which syntactic group the thing under the cursor belongs to - useful
" for creating syntax files, but not in general use
 map <leader>wit :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                         \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                         \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"" Use ag with ack.vim
if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" autocmd InsertEnter * :setlocal nohlsearch
" autocmd InsertLeave * :setlocal hlsearch


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

nnoremap <c-d> :NERDTree<CR>
nnoremap <c-s> :BufExplorerHorizontalSplit<CR>

let g:bufExplorerSplitBelow=1
let g:bufExplorerSplitHorzSize=10
let g:bufExplorerSplitOutPathName=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDisableDefaultKeyMapping=1

" Make backspace work outside of the current insert mode addition
set backspace=indent,eol,start


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

" FZF and tags
let g:fzf_tags_command = 'ctags -R --python-kinds=-i'
nnoremap <leader>t :Tags<CR>
nnoremap <leader>f :GFiles<CR>
" imap <c-x><c-o> <plug>(fzf-complete-line)

" nnoremap <c-t> :OpenPytestError<CR>

" " Split the window in various directions with shift key combos
" nnoremap <S-k> :split above<CR>
" nnoremap <S-j> :split below<CR>
" nnoremap <S-l> :vsplit left<CR>
" nnoremap <S-h> :vsplit right<CR>

" Mirror the jump-to-tag forwards keystroke with the other square bracket
" nnoremap <c-[> <c-t>


" TODO: Why is this overriding the enter key on its own?
" This really does not seem to work...
" nnoremap <c-m> :res +1<CR>
" nnoremap <c-n> :res -1<CR>


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

nnoremap <leader>tc :tabclose<CR>
" cmap gs GStatus

nnoremap <silent><Leader>tst <Esc>:Pytest project<CR>
nnoremap <silent><Leader>tt <Esc>:Pytest project verbose<CR>
nnoremap <silent><Leader>nn <Esc>:Pytest next<CR>
nnoremap <silent><Leader>pp <Esc>:Pytest previous<CR>

function! s:PytestSyntax() abort
	let b:current_syntax = 'pytest'                                                                                                         
	syn match PytestPlatform              '\v^(platform(.*))'
	syn match PytestTitleDecoration       "\v\={2,}"
	syn match PytestTitle                 "\v\s+(test session starts)\s+"
	syn match PytestCollecting            "\v(collecting\s+(.*))"
	syn match PytestPythonFile            "\v((.*.py\s+))"
	syn match PytestFooterFail            "\v\s+((.*)(failed|error) in(.*))\s+"
	syn match PytestFooter                "\v\s+((.*)passed in(.*))\s+"
	syn match PytestFailures              "\v\s+(FAILURES|ERRORS)\s+"
	syn match PytestErrors                "\v^E\s+(.*)"
	syn match PytestDelimiter             "\v_{3,}"
	syn match PytestFailedTest            "\v_{3,}\s+(.*)\s+_{3,}"

	hi def link PytestPythonFile          String
	hi def link PytestPlatform            String
	hi def link PytestCollecting          String
	hi def link PytestTitleDecoration     Comment
	hi def link PytestTitle               String
	hi def link PytestFooterFail          String
	hi def link PytestFooter              String
	hi def link PytestFailures            Number
	hi def link PytestErrors              Number
	hi def link PytestDelimiter           Comment
	hi def link PytestFailedTest          Comment
endfunction


function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

function! OpenPytestError()

    " botright new PytestRun
    " Go to, or open a new, PytestRun window and buffer
    let winnr = bufwinnr('PytestRun')
    silent! execute  winnr < 0 ? 'botright new ' . 'PytestRun' : winnr . 'wincmd w'

    " Make this buffer ephemeral
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number filetype=pytest

    " Run pytest; the output will go into the buffer. Resize to fit.
    silent! execute 'silent %!'. "py.test -x -q"
    silent! execute 'resize ' . line('$')

    " Apply syntax highlighting to the buffer
    call s:PytestSyntax()

    " Switch to the other pane
    execute 'wincmd p'

    " Run pytest again (TODO: just run it once), output a json report, parse
    " it with some python to extraxt the file and line
    let command_output = ChompedSystem("py.test -x -q --json=/tmp/report.json 2>&1 >/dev/null; cat /tmp/report.json | jq -c -M '.' | python -c \"import json; import sys; input = json.loads(sys.stdin.read()); failed_tests = [test for test in input['report']['tests'] if test['outcome'] == 'failed']; print failed_tests[0]['call']['longrepr'].splitlines()[-1].split(' ')[0][0:-1] if failed_tests else 'pass:0';\"")

    " Get the filename and line number, open the file, jump to the line
    echom command_output
    let parts = split(command_output, ":")
    let [filename, line_number] = parts

    if filename != "pass"
        silent! execute 'edit' filename
        execute line_number
        " Recenter on the line
        execute 'normal! zz'
    endif

endfunction
command! OpenPytestError call OpenPytestError()
" nnoremap <c-t> :OpenPytestError<CR>

let g:vim_markdown_folding_disabled = 1
