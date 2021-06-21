Plug 'vim-test/vim-test'

let test#strategy = "vimux"
let g:VimuxOrientation = "h"
let g:VimuxHeight = "50"

function! DockerTransform(cmd) abort
  return 'docker exec -it test_runner bash -c "'.a:cmd.'"'
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'

nnoremap <leader>tt :TestNearest -s --no-cov<CR>
nnoremap <leader>tf :TestFile --no-cov<CR>
nnoremap <leader>ta :TestFile --no-cov<CR>

nnoremap <c-u> :TestNearest -s --no-cov<CR>
nnoremap <c-n> :w<CR><bar>:TestNearest -s --no-cov<CR>
nnoremap <c-i> :TestNearest -s --no-cov --pdb<bar>:call VimuxTmux('select-'.VimuxOption('VimuxRunnerType').' -t '.g:VimuxRunnerIndex)<CR>
