nnoremap <c-t> :OpenPytestError<CR>

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
