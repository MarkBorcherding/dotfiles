""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTests()
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    exec ":Dispatch"

endfunction

function! SetTestFile(suffix)
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
    let filename = @% . a:suffix
    if expand('%') =~# '_test\.rb$'
      exec ":Focus testrb " .  filename
    elseif expand('%') =~# '_spec\.rb$'
      exec ":Focus rspec " .  filename
    elseif expand('%') =~# '\.feature$'
      exec ":Focus cucumber " . filename
    else
      exec ":Focus ruby -wc " . filename
    endif
endfunction

function! RunTestFile(...)
    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '.feature\|_spec.rb') != -1
    if in_test_file
      if a:0 == 1
        let suffix = a:1
      else
        let suffix = ""
      endif
      call SetTestFile(suffix)
    elseif !exists("t:grb_test_file")
        echo "no test to run"
        return
    end
    call RunTests()
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

map <leader>r :call RunTestFile()<cr>
map <leader>R :call RunNearestTest()<cr>
map <leader>a :call RunTests()<cr>
map <leader>w :w\|:!script/features --profile wip<cr>
map <leader>D :silent !rake db:test:prepare<cr>
