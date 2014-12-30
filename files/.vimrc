set nocompatible                  " Must come first because it changes other options.

if filereadable(expand("$HOME/.vim/vundles.vim"))
  source $HOME/.vim/vundles.vim
endif

set visualbell                                 " No beeping.
set history=1000                               " Store a lot of history
set number                                     " Turn on line numbers
set tabstop=2                                  " Global tab width.
set shiftwidth=2                               " And again, related.
set expandtab                                  " Use spaces instead of tabs
set smarttab                                   " sw at start of line, sts everywhere else
set autoread                                   " Reload files changed outside vim
set autoindent
set backspace=2                                " make backspace work like most other apps
set nobackup nowritebackup noswapfile autoread " no backup or swap
set laststatus=2                               " Show the status line all the time

set exrc                                       " enable per-directory .vimrc files
set secure                                     " disable unsafe commands in local .vimrc files

syntax on                                      " Enable syntax highlighting
filetype on                                    " Enable filetype detection
filetype indent on                             " Enable filetype-specific indenting
filetype plugin on                             " Enable filetype-specific plugins
compiler ruby                                  " Enable compiler support for ruby


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

if filereadable(expand("~/.vim/test_runner.vim"))
  source ~/.vim/test_runner.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CtrlP """"""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-p> :CtrlP<Enter>
map <C-P> :CtrlPClearAllCaches<Enter>:CtrlP<Enter>
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|dist|src|temp|development|tags)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags

" NERDTree """""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>d :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Vim Indent Guides """""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray28 ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray27 ctermbg=236

" Sane Vimdiff colors """""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight DiffAdd    term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText   term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

" Appearance """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_ut= "make the background work in tmux
set t_Co=256
colorscheme Tomorrow-Night
set background=dark

" Powerline """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
