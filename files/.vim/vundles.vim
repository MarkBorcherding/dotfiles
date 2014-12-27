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
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

Plugin 'ngmy/vim-rubocop'

" Cosmetic
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-scripts/hexHighlight.vim'
"Plugin 'bling/vim-airline'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Text Manipulation
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'terryma/vim-multiple-cursors'

" Language Specific
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'slim-template/vim-slim'
Plugin 'guns/vim-clojure-static'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter=1
let g:vim_markdown_initial_foldlevel=10

Plugin 'kchmck/vim-coffee-script'
map <leader>c :CoffeeCompile vert<cr>
map <leader>C :CoffeeCompile watch vert<cr>

" Ruby / Rails
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-rvm.git'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'astashov/vim-ruby-debugger'

" Testing
Plugin 'tpope/vim-dispatch'

call vundle#end()            " required
filetype plugin indent on    " required
