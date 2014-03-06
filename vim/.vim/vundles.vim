set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Git
Bundle 'gregsexton/gitv'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'airblade/vim-gitgutter'


" General Vim
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-unimpaired'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'

" Cosmetic
Bundle 'vim-scripts/hexHighlight.vim'
Bundle 'bling/vim-airline'
Bundle "nathanaelkane/vim-indent-guides"

" Text Manipulation
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-abolish'

" Language Specific
Bundle "kchmck/vim-coffee-script"
map <leader>c :CoffeeCompile vert<cr>
map <leader>C :CoffeeCompile watch vert<cr>

" Ruby / Rails
Bundle "tpope/vim-rails.git"
Bundle "tpope/vim-rake.git"
Bundle "tpope/vim-rvm.git"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-endwise"
Bundle 'ck3g/vim-change-hash-syntax'
Bundle 'vim-ruby/vim-ruby'
Bundle 'astashov/vim-ruby-debugger'



" Testing
Bundle "tpope/vim-dispatch"
