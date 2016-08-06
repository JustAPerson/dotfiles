"
" Free keys:
" gs
" entire t prefix

call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'tomasr/molokai'
Plug 'Pychimp/vim-sol'
Plug 'Pychimp/vim-luna'
Plug 'john2x/flatui.vim'
Plug 'NLKNguyen/papercolor-theme'

" languages
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'

" " " tools
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim'
Plug 'racer-rust/vim-racer'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'shougo/vimproc.vim' ", {'do': 'tools\\update-dll-mingw'}
Plug 'shougo/vimshell.vim'
Plug 'osyo-manga/vim-over' " preview substitutes in q: window
Plug 'moll/vim-bbye'
" Plug 'p0deje/vim-dispatch-vimshell'
" Plug 'bronson/vim-trailing-whitespace'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sjl/gundo.vim'

Plug 'kshenoy/vim-signature'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
" Plug 'xolox/vim-session'

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'szw/vim-ctrlspace'
Plug 'junegunn/vim-easy-align'
" Plug 'Shougo/neocomplete.vim'


" Plug 'ervandew/supertab'

" Neovim
Plug 'critiqjo/lldb.nvim'
" Plug 'benekastah/neomake'

call plug#end()
" " Use deoplete.
let g:deoplete#enable_at_startup = 1
" " Use smartcase.
let g:deoplete#enable_smart_case = 1

inoremap <expr><C-y> deoplete#mappings#close_popup()
inoremap <expr><C-e> deoplete#mappings#cancel_popup()

" <C-h>, <BS>: close popup and delete backword char.
"imap <expr><C-h> deoplete#mappings#smart_close_popup()
"imap <expr><BS> deoplete#mappings#smart_close_popup()


set t_Co=256
colorscheme PaperColor

" Pluginy things
let g:molokai_original = 1
let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_exclude_preview = 1
let g:racer_cmd = "/home/jason/.cargo/bin/racer"

let g:ctrlp_root_markers = ['Cargo.toml']
let g:ctrlspace_project_root_markers = ["Cargo.toml"]
let g:ctrlspace_unicode_font=0
let g:ctrlspace_use_tabline=1
"let g:notes_directories = ['H:/Documents/Notes', '~/Google\ Drive/Notes']
let g:gist_post_private = 1

if has("gui_running")
    " Remove most of gVim GUI.
    set guioptions = "c"

    if has("gui_win32")
        " note:
        " :set fontgui=* to bring up dialog
        " :put =&fontgui to paste the proper string
        set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cDEFAULT
        set linespace=0
    endif
endif

filetype plugin indent on
syntax on " colors are nice

" set encoding=utf-8
set fileformats=unix,dos,mac

set hidden " background buffers
set number " line numbers
set cursorline
set ruler
set noautochdir

set incsearch
set hlsearch
set ignorecase

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set spell

nmap ZX :qa<CR>
nmap ZC :qa!<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

noremap j gj
noremap k gk

noremap - 0
noremap 0 ^

nmap <F1> <nop>
imap <F1> <nop>
nmap Q <nop> " potential prefix

nmap <m-q> <c-w>c

" noremap <C-O> mpO<C-c>0D`p
" noremap <C-o> mpo<C-c>0D`p

nmap f  <plug>(easymotion-prefix)
nmap fd <plug>(easymotion-repeat)
nmap fa <plug>(easymotion-jumptoanywhere)
vmap f  <plug>(easymotion-prefix)
vmap fd <plug>(easymotion-repeat)
vmap fa <plug>(easymotion-jumptoanywhere)

map fu :GundoToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gs <Plug>(EasyAlign)

nmap ; :
let mapleader = ","
noremap <leader>w :w<CR>
noremap <leader>re :tabe $MYVIMRC<CR>
noremap <leader>rr :source $MYVIMRC<CR>
noremap <leader>e :NERDTreeFocus<CR>
noremap <leader>l :silent! Copen<CR>
noremap <leader>L :silent! Copen<CR> <C-w>L
" nmap <leader>m :Make<CR>
noremap <leader><space> :noh<CR>

nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>Q :Bdelete!<CR>
nnoremap <C-q> :Bdelete<CR>
nnoremap <C-Q> :Bdelete!<CR>

nnoremap <leader>dg :CtrlPBookmarkDir<CR>
nnoremap <leader>da :CtrlPBookmarkDirAdd<CR>

"nmap <leader>vs :VimShell<CR>
" Nvim term
tmap <esc> <C-\><C-n>
tmap <C-h> <C-\><C-n><C-w>h
tmap <C-j> <C-\><C-n><C-w>j
tmap <C-k> <C-\><C-n><C-w>k
tmap <C-l> <C-\><C-n><C-w>l
nmap <leader>ts <C-w>s:term<CR>
nmap <leader>tv <C-w>v:term<CR>
nmap <leader>te :term<CR>


" tabby things
nmap tq :Bdelete<CR>
nmap tQ :Bdelete!<CR>
nmap te :tabe<CR>
nmap tt :tabe<CR>:term<CR>

" tasky list
nmap <leader>tl :noautocmd vimgrep /TODO/j **/*<CR>

" Filey things
autocmd FileType rust compiler cargo
autocmd FileType rust set makeprg="cargo build"
autocmd FileType rust set expandtab
autocmd FileType rust nmap <buffer> <leader>m :Dispatch cargo build<CR>
autocmd FileType rust nmap <buffer> <leader>n :Dispatch cargo run<CR>
" autocmd BufNewFile,BufRead *.rs set filetype=rust

autocmd BufNewFile,BufRead *.s  set filetype=nasm

autocmd FileType nasm set commentstring=;\ %s

autocmd FileType vimshell nmap <buffer> <C-h> <C-w>h
autocmd FileType vimshell nmap <buffer> <C-j> <C-w>j
autocmd FileType vimshell nmap <buffer> <C-k> <C-w>k
autocmd FileType vimshell nmap <buffer> <C-l> <C-w>l
autocmd FileType vimshell imap <buffer> <C-h> <esc><C-w>h
autocmd FileType vimshell imap <buffer> <C-j> <esc><C-w>j
autocmd FileType vimshell imap <buffer> <C-k> <esc><C-w>k
autocmd FileType vimshell imap <buffer> <C-l> <esc><C-w>l

autocmd FileType mkd setlocal spell
autocmd FileType gitcommit set spell

autocmd FileType python nmap <buffer> <leader>m :Dispatch python %<CR>
autocmd FileType qf nmap <buffer> <leader><Enter> <C-w>L
" autocmd FileType qf wincmd L
