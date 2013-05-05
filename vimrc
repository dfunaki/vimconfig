execute pathogen#infect()
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()
let g:SuperTabDefaultCompletionType = "context" 
set hidden 
set lines:100
set columns:200
set background=dark

set wildmenu
set wildmode=list:longest
set nocompatible

let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1


let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

syntax on
filetype off
filetype on
filetype plugin on
filetype indent on

set expandtab
set tabstop=2
set shiftwidth=2

set hlsearch
set incsearch
set ignorecase
set smartcase

set foldmethod=syntax
set foldminlines=3
set foldlevel=100

set hidden
set number

set encoding=utf-8

set guifont=Menlo\ Regular:h17
