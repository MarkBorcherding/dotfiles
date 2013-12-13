""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTests(filename)

    if a:filename == ''
      let bg = '!'
    else
      let bg = ''
    end


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
    if match(a:filename, '\.feature$') != -1
        exec ":Dispatch script/features " . a:filename
    elseif match(a:filename, 'Test\.php$') != -1
        exec ":!phpunit --colors " . a:filename
    elseif filereadable("script/test")
        exec ":!script/test " . a:filename
    elseif filereadable("test/mocha.opts")
        exec ":!mocha " . a:filename
    elseif filereadable("Gruntfile.js")
        exec ":!yeoman test"
    elseif filereadable("gemfile")
        exec ":Dispatch"  . bg . " bundle exec rspec --color " . a:filename
    else
        exec ":Dispatch" . bg . " rspec --color " . a:filename
    end

endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    "If were in Elgg throw it all out and just launch the web page
    if filereadable("start.php")
      exec ":!open http://evoke.dev/engine/tests/suite.php"
      return
    end

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '(.feature\|_spec.\(rb\|coffee\)\|tests.\(coffee\|js\)\|Test.php)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        echo "no test to run"
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

map <leader>r :call RunTestFile()<cr>
map <leader>R :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>w :w\|:!script/features --profile wip<cr>
map <leader>D :silent !rake db:test:prepare<cr>
