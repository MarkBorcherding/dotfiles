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
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plugin 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jsxhint']

Plugin 'ngmy/vim-rubocop'

" Cosmetic
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-scripts/hexHighlight.vim'

" Text Manipulation
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'

" Language Specific
Plugin 'Glench/Vim-Jinja2-Syntax'

Plugin 'mxw/vim-jsx'


Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1

Plugin 'kchmck/vim-coffee-script'
map <leader>c :CoffeeCompile vert<cr>
map <leader>C :CoffeeCompile watch vert<cr>

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'

" Ruby / Rails
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'vim-ruby/vim-ruby'

" Testing
Plugin 'tpope/vim-dispatch'

call vundle#end()            " required
filetype plugin indent on    " required
