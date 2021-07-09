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
Plugin 'herringtondarkholme/yats.vim'
Plugin 'quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'blueyed/vim-diminactive'
Plugin 'tpope/vim-sleuth'

execute pathogen#infect()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules'

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

"“ Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let mapleader=","

" Overrides
"" This one opens definitions in a split
nnoremap gd :only<bar>vsplit<CR>gd
"" This one opens definitions in preview
nnoremap gd :<C-u>pedit %<Bar>wincmd P<Bar>norm! gd<Bar><CR>


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


" tags
set tags=~/.cache/tags/.tags;,.tags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_modules = ['ctags']

let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
let g:gutentags_ctags_extra_args += ['--map-TypeScript=+.tsx']
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

let g:tagbar_type_typescript = {
    \ 'ctagstype': 'typescript',
    \ 'kinds': [
      \ 'c:class',
      \ 'n:namespace',
      \ 'f:function',
      \ 'G:generator',
      \ 'v:variable',
      \ 'm:method',
      \ 'p:property',
      \ 'i:interface',
      \ 'g:enum',
      \ 't:type',
      \ 'a:alias',
    \ ],
    \'sro': '.',
      \ 'kind2scope' : {
      \ 'c' : 'class',
      \ 'n' : 'namespace',
      \ 'i' : 'interface',
      \ 'f' : 'function',
      \ 'G' : 'generator',
      \ 'm' : 'method',
      \ 'p' : 'property',
      \},
  \ }

 let g:tagbar_type_typescriptreact = {
\ 'ctagstype': 'typescript',
\ 'kinds': [
  \ 'c:class',
  \ 'n:namespace',
  \ 'f:function',
  \ 'G:generator',
  \ 'v:variable',
  \ 'm:method',
  \ 'p:property',
  \ 'i:interface',
  \ 'g:enum',
  \ 't:type',
  \ 'a:alias',
\ ],
\'sro': '.',
  \ 'kind2scope' : {
  \ 'c' : 'class',
  \ 'n' : 'namespace',
  \ 'i' : 'interface',
  \ 'f' : 'function',
  \ 'G' : 'generator',
  \ 'm' : 'method',
  \ 'p' : 'property',
  \},
\ }
