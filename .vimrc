set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
set rtp+=$GOROOT/misc/vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sainnhe/sonokai'
Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'mbbill/undotree'
Plugin 'yegappan/grep'
" Plugin 'herringtondarkholme/yats.vim'
" Plugin 'quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'blueyed/vim-diminactive'
Plugin 'tpope/vim-sleuth'
Plugin 'sbdchd/neoformat'
Plugin 'gko/vim-coloresque'

execute pathogen#infect()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules'

let g:coc_global_extensions = ['coc-tsserver']

set mouse=a

autocmd BufWritePre *.ts Neoformat
let g:neoformat_javascript_prettier = {
            \ 'exe': './node_modules/.bin/prettier',
            \ 'args': ['--write', '--config .prettierrc'],
            \ 'replace': 1
            \ }
let g:neoformat_enabled_javascript = ['prettier']

" autocompletion code binding

nmap <silent> gD :only<bar>split<CR><Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

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

colorscheme sonokai

set list
set listchars=trail:·,eol:¬,tab:⍿·

set autowrite
set cursorline

"“ Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" 
"“ Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let mapleader=","

" Overrides
"" This one opens definitions in a split
" nnoremap gd :only<bar>split<CR>gd
"" This one opens definitions in preview
" nnoremap gp :<C-u>pedit %<Bar>wincmd P<Bar>norm! gd<Bar><CR>


"" Easymotion configuration
map <Leader>f <Plug>(easymotion-bd-f)_
nmap <Leader>f <Plug>(easymotion-overwin-f)

" \s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
nmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Undo Tree
nnoremap <Leader>u :UndotreeToggle<CR>

" TagBar
nmap <Leader>v :TagbarToggle<CR>
nnoremap <F8> :TagbarToggle<CR>

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
