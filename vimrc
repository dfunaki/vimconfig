"execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
set tags=./tags;/

set hidden
set lines:100
set columns:200
set background=dark

set wildmenu
set wildmode=list:longest
set nocompatible


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


set nocompatible

" This is for the Syntastic plugin, we need to set it before it loads
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1

" configure CtrlP
let g:ctrlp_map = ''
let g:ctrlp_max_height = 45
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 2
let g:ctrlp_mruf_include = '\.py$\|\.rb$|\.coffee|\.haml'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.rvm$'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git/', 'cd %s && git ls-files'],
      \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

" configure IndentGuides plugin
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size  = 1
autocmd! VimEnter,Colorscheme * hi IndentGuidesOdd ctermbg=236 guibg=#303030 | hi IndentGuidesEven ctermbg=239 guibg=#505050
autocmd BufRead * IndentGuidesEnable
"autocmd! VimEnter,Colorscheme * hi IndentGuidesEven ctermbg=123 guibg=#880055

" initialize pathogen and load all the plugins in .vim/bundle
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()

let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1


let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized


" Disable balloon popup since theres a plugin that makes it really annoying
if has("balloon_eval")
  set noballooneval
end

" Syntax hilight based on filetype, which is autmatically determined.
" The filetype plugin needs to be reinitialized
syntax on
filetype off
filetype on
filetype plugin on
filetype indent on

let g:SuperTabDefaultCompletionType = "context"

" Enable syntax folding for blocks and comments.
set foldmethod=syntax
set foldminlines=3
set foldlevel=100

" indentation configuration
set cindent
set smartindent
set autoindent

" Convert tabs to spaces, use 2 spaces in place of tabs.
set expandtab
set tabstop=2
set shiftwidth=2

" text search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" hide buffers instead of closing them when you :q, keeping their undo history
set hidden

" Open new windows on the bottom and right instead of the top and left.
set splitbelow
set splitright

" increase the default command line history
set history=1000

" File name tab completion functions like bash, it gives you a list of
" options instead of automatically filling in the first possible match.
set wildmenu
" It will however, with this option, complete up to the first character of
" ambiguity.
set wildmode=list:longest

" Show line numbers
set number

" Make clipbord work on OS X. This makes copy/paste operations trivial between
" vim and other applications since they all use the same clipboard now.
set clipboard=unnamed
" visual select automatically copies to X11's selection ("middle click") buffer
set go+=a

" scrolls the buffer before you reach the last line of the window
set scrolloff=3

" Always show status line
set ls=2

" default encoding
set encoding=utf-8

" sets backspace key functions, allows it to backspace over end of line
" characters, start of line, and indentation
set backspace=indent,eol,start
" movement keys will take you to the next or previous line
set whichwrap+=<,>,h,l

" enable mouse in console
set mousemodel=extend
set mouse=a

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" set the spellcheck language
setlocal spell spelllang=en_us
" disable spellcheck by default
set nospell

" for exuberant CTags support
set tags=./tags;/

" use a user-local vim-specific directory for backups rather than the global
" tmp directory by default
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" treat question marks as part of a word in ruby
autocmd BufRead *.rb,*.rake,*.rhtml,*.ctl,*.ebf,<ruby> set isk=?,@,48-57,_,192-255

" disable wordwrap when looking at CSVs
autocmd BufRead *.csv,*.csv*,<csv> set nowrap

" remove whistespace at end of line before write
func! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  normal `Z
endfunc
au BufWrite * if ! &bin | call StripTrailingWhitespace() | endif

" display the file name of the current file in the Terminal (xterm/item/&c) title
if has('title')
  set title
  autocmd BufEnter * let &titlestring = "vim: " . expand("%:p:~")
endif

" shortcuts
" for rails.vim alternate between test and tested
map <leader>t  :A<CR>
map <leader>ts :AS<CR>
map <leader>tv :AV<CR>
" for rails.vim swap to model/control/etc from associated file
map <leader>rm :Rmodel<CR>
map <leader>rc :Rcontroller<CR>
map <leader>rh :Rhelper<CR>
map <leader>ru :Runittest<CR>
map <leader>rf :Rfunctionaltest<CR>
map <leader>ro :Robserver<CR>
map <leader>rv :Rview<CR>
map <leader>rl :Rlocale<CR>
" for CtrlP
map <leader>ff :CtrlP<CR>
map <leader>fb :CtrlPBuffer<CR>
map <leader>ft :CtrlPTag<CR>
map <leader>fq :CtrlPQuickfix<CR>
map <leader>fd :CtrlPDir<CR>
map <leader>fr :CtrlPRTS<CR>
map <leader>fm :CtrlPMRU<CR>
" for gundo
"map <leader>g :GundoToggle<CR>
" runs diff against the current buffer and the file on disk
map <leader>d :w !diff % -<CR>
" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>
" search hilighting control, enables and disable intelligently and toggles
nnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>?
nnoremap n :set hlsearch<CR>n
nnoremap N :set hlsearch<CR>N
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>/ :set hlsearch!<CR>

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <ESC>:tabprevious<CR>i
imap <C-tab> <ESC>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <ESC>:tabnew<CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Easy way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make mouse scrolling work in vim!!!
map <M-Esc>[62~ <ScrollWheelUp>
map <M-Esc>[63~ <ScrollWheelDown>
map <M-Esc>[64~ <S-ScrollWheelUp>
map <M-Esc>[65~ <S-ScrollWheelDown>
map! <M-Esc>[62~ <ScrollWheelUp>
map! <M-Esc>[63~ <ScrollWheelDown>
map! <M-Esc>[64~ <S-ScrollWheelUp>
map! <M-Esc>[65~ <S-ScrollWheelDown>

" make keypad work in vim with iTerm on OS X!
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <kPlus> +
map <Esc>OS -
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <kPlus> +
map! <Esc>OS -

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
