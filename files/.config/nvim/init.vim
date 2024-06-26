
 " map a fe things first so we can setup correct mappings to them when the
 " plugins get setup
:let mapleader      = " "                      " Crazy leader
:let maplocalleader = "\\"                     " Normal leader

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
let g:NERDTreeQuitOnOpen = 1
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

"Plug 'Valloric/YouCompleteMe'

Plug 'ctrlpvim/ctrlp.vim'
map <C-p> :CtrlP<Enter>
map <C--> :CtrlPBuffer<Enter>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0 " ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|dist|src|temp|development|tags)$'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
set grepprg=ag\ --nogroup\ --nocolor

Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_slim_checkers = ['slimrb', 'slim_lint']
let g:syntastic_scala_checkers = ['scalac']
let g:syntastic_scala_scalastyle_jar = '/usr/local/Cellar/scalastyle/0.8.0/libexec/scalastyle_2.11-0.8.0-batch.jar'
let g:syntastic_scala_scalastyle_config_file = 'scalastyle-config.xml'

" Cosmetic
"Plug 'w0ng/vim-hybrid'                " Nice colorscheme
"Plug 'morhetz/gruvbox'                " old favorite
"Plug 'arcticicestudio/nord-vim'       " Baby it's cold outside
Plug 'drewtempelmeyer/palenight.vim'  " Let's try something _darker_
Plug 'kien/rainbow_parentheses.vim'
nnoremap <leader>p :RainbowParenthesesToggle<CR>

"Plug 'junegunn/goyo.vim'              " Distraction free vim

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray28 ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray27 ctermbg=236

" Text Manipulation
"Plug 'junegunn/vim-easy-align'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Language Specific
"Plug 'derekwyatt/vim-scala'
"Plug 'kchmck/vim-coffee-script'
"Plug 'keith/tmux.vim'

"Plug 'ensime/ensime-vim'
"autocmd FileType scala nnoremap <localleader>df :EnDeclaration<CR>
"autocmd FileType scala nnoremap <localleader>ds :EnDeclarationSplit<CR>
"autocmd FileType scala nnoremap <localleader>t :EnType<CR>
"autocmd FileType scala nnoremap <localleader>T :EnTypeCheck<CR>
"autocmd FileType scala nnoremap <localleader>i :EnInspectType<CR>
"autocmd FileType scala nnoremap <localleader>I :EnSuggestImport<CR>
"autocmd FileType scala nnoremap <localleader>oi :EnOrganizeImport<CR>

" Ruby
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-rake'
"Plug 'vim-ruby/vim-ruby'

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1

" Testing
Plug 'tpope/vim-dispatch'

call plug#end()

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
colorscheme palenight                             " Beauty
set background=dark
set incsearch                                  " Find the next match as we type the search
set hlsearch                                   " Hilight searches by default

syntax on                                      " Enable syntax highlighting
filetype on                                    " Enable filetype detection
filetype indent on                             " Enable filetype-specific indenting
filetype plugin on                             " Enable filetype-specific plugins
compiler ruby                                  " Enable compiler support for ruby


" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

autocmd BufWritePre * :%s/\s\+$//e                     " auto remove trailing whitespace
autocmd Filetype gitcommit setlocal spell textwidth=72 " Spellcheck git commit messages

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



if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
 " map a fe things first so we can setup correct mappings to them when the
