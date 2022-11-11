set nocompatible              " be iMproved, required
filetype off                  " required
set mouse=a

syntax on
set number
filetype plugin indent on
" show existing tab with 2 spaces width
" set tabstop=2
" when indenting with '>', use 2 spaces width
" set shiftwidth=2
" On pressing tab, insert 2 spaces
" set expandtab
" Search before enter
set incsearch
" Highlight searches
set hlsearch
" Hide, don't close, buffers
" set hidden
" No cascading indents on paste:
set pastetoggle=<F2>

set t_Co=256
set background=dark

set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backups//

set list
set listchars=trail:·,eol:¬,tab:⍿·

set autowrite
set cursorline

set autoindent
" Auto-add closing braces
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''
