set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

execute pathogen#infect()

syntax on
set number
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
" Search before enter
set incsearch
" Hide, don't close, buffers
set hidden
" Who needs swaps, we have :w + git
set nobackup
set noswapfile
" No cascading indents on paste:
set pastetoggle=<F2>

if &t_Co >= 256 || has("gui_running")
  colorscheme peachpuff
endif

