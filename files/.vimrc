set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim "set the runtime path to include Vundle and initialize
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Git
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'airblade/vim-gitgutter'

" General Vim
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'kien/ctrlp.vim'
map <C-p> :CtrlP<Enter>
map <C-P> :CtrlPClearAllCaches<Enter>:CtrlP<Enter>
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|dist|src|temp|development|tags)$'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags

Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plugin 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_slim_checkers = ['slimrb', 'slim_lint']

" Cosmetic
Plugin 'tomasr/molokai'                 " Slightly less nice colorscheme
Plugin 'w0ng/vim-hybrid'                " Nice colorscheme

Plugin 'junegunn/goyo.vim'              " Distraction free vim
Plugin 'junegunn/limelight.vim'         " Dim all but your current paragraph
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray28 ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray27 ctermbg=236

" Text Manipulation
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Language Specific
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake.git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'

Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1

Plugin 'kchmck/vim-coffee-script'
map <leader>c :CoffeeCompile vert<cr>
map <leader>C :CoffeeCompile watch vert<cr>

" Testing
Plugin 'tpope/vim-dispatch'

call vundle#end()            " required

set visualbell                                 " No beeping.
set history=1000                               " Store a lot of history
set number                                     " Turn on line numbers
set tabstop=2                                  " Global tab width.
set shiftwidth=2                               " And again, related.
set expandtab                                  " Use spaces instead of tabs
set smarttab                                   " sw at start of line, sts everywhere else
set autoread                                   " Reload files changed outside vim
set autoindent                                 " Indent the following line
set backspace=2                                " make backspace work like most other apps
set nobackup nowritebackup noswapfile autoread " no backup or swap
set laststatus=2                               " Show the status line all the time
set exrc                                       " enable per-directory .vimrc files
set secure                                     " disable unsafe commands in local .vimrc files
set t_ut=                                      " make the background work in tmux
set t_Co=256                                   " Wide columns
colorscheme hybrid                             " Beauty
set background=dark

syntax on                                      " Enable syntax highlighting
filetype on                                    " Enable filetype detection
filetype indent on                             " Enable filetype-specific indenting
filetype plugin on                             " Enable filetype-specific plugins
compiler ruby                                  " Enable compiler support for ruby

:let mapleader = " "                           " Crazy leader

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

autocmd BufWritePre * :%s/\s\+$//e     " auto remove trailing whitespace


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default

:nnoremap <CR> :nohlsearch<cr>  " Clear the search buffer when hitting return

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTests(filename)
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

    if a:filename =~# '_test\.rb'
      exec ":Dispatch testrb " .  a:filename
    elseif a:filename =~# '_spec\.rb'
      exec ":Dispatch bundle exec rspec " .  a:filename
    elseif a:filename =~# '\.feature'
      exec ":Dispatch bundle exec cucumber " . a:filename
    else
      exec ":Dispatch bundle exec rspec " .  a:filename
    endif

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

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '_test\.rb|\.feature\|_spec\.rb') != -1
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
map <leader>w :Dispatch cucumber --profile wip<cr>

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd bufread *.pxi setlocal filetype=clojure
