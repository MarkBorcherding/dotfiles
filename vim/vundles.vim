set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'


" Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'airblade/vim-gitgutter'


" General Vim
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

" Cosmetic
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1

" Text Manipulation
Bundle 'tpope/vim-surround'

" Ruby / Rails
Bundle "tpope/vim-rails.git"
Bundle "tpope/vim-rake.git"
Bundle "tpope/vim-rvm.git"
Bundle 'ck3g/vim-change-hash-syntax'



