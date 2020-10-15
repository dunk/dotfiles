set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

let g:python_host_prog='./venv/bin/python'

" let g:black_virtualenv='./venv/'
autocmd BufWritePre *.py execute ':Black'
