" Prefixes
"   ,qz
" Weirdly useful
"   CTRL-n select word
" Useless
"   <C-m> <C-,> <C-.>
"   - + <CR>
"
call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes' " glorious Monokai

" Languages
Plug 'rust-lang/rust.vim'   " Mozilla Rust
    let g:racer_cmd = "/home/jason/.cargo/bin/racer"
Plug 'racer-rust/vim-racer' " Rust completion

Plug 'cespare/vim-toml'

" Utilities
Plug 'airblade/vim-gitgutter'         " git modified line status
Plug 'ctrlpvim/ctrlp.vim'             " MRU file access
    let g:ctrlp_cmd = 'CtrlPMRU'
Plug 'gregsexton/gitv'
Plug 'kshenoy/vim-signature'          " marks
Plug 'mattn/webapi-vim'               " prereq for gist-vim
Plug 'moll/vim-bbye'                  " :Bdelete
Plug 'ntpeters/vim-better-whitespace' " highlight trailing whitespace
Plug 'scrooloose/nerdtree'            " file tree
Plug 'scrooloose/syntastic'           " syntax checking on save
Plug 'terryma/vim-multiple-cursors'   " v_CTRL-n
Plug 'tpope/vim-commentary'           " commenting w/ gcc
Plug 'tpope/vim-eunuch'               " linux interop
Plug 'tpope/vim-fugitive'             " git commands
Plug 'tpope/vim-unimpaired'           " quick settings

" Need exploration
Plug 'junegunn/vim-easy-align'
    vmap <Enter> <Plug>(EasyAlign)
    nmap ga      <Plug>(EasyAlign)
Plug 'sjl/gundo.vim'
Plug 'easymotion/vim-easymotion'
    " map <leader><leader>a <Plug>(easymotion-jumptoanywhere)
    nmap f  <Plug>(easymotion-prefix)
    nmap fd <Plug>(easymotion-repeat)
    nmap fa <Plug>(easymotion-jumptoanywhere)
    vmap f  <Plug>(easymotion-prefix)
    vmap fd <Plug>(easymotion-repeat)
    vmap fa <Plug>(easymotion-jumptoanywhere)
Plug 'szw/vim-ctrlspace'
Plug 'mattn/gist-vim'
" TODO snippets

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_smart_case = 1


call plug#end()

set hidden
set ignorecase
set smartcase
set ruler
set cursorline
set number relativenumber



set shiftwidth=4
set tabstop=4
set expandtab

set spelllang=en_us

set termguicolors
colorscheme Monokai
hi! link SpellBad Error

map ; :
imap jj <Esc>
map j gj
map k gk
map - 0
map 0 ^
map Q <nop>

let mapleader = ','
map  <leader><space> :nohlsearch<CR>
nmap <leader>w :w<CR>
nmap <leader>re :edit ~/.config/nvim/init.vim<CR>
nmap <leader>rte :tabedit ~/.config/nvim/init.vim<CR>
nmap <leader>rr :source ~/.config/nvim/init.vim<CR>
nmap <leader>tl :noautocmd vimgrep /TODO/j **/*<CR>
map <leader>gs :Gstatus<CR>
map <leader>gv :Gitv<CR>
map <leader>gV :Gitv!<CR>

" Selecting linewise is way more useful
nnoremap <C-v> <S-v>
nnoremap <S-v> <C-v>
vnoremap <C-v> <S-v>
vnoremap <S-v> <C-v>

" Lazy window movement
map  <C-h> <C-w>h
map  <C-j> <C-w>j
map  <C-k> <C-w>k
map  <C-l> <C-w>l
tmap <C-h> <C-\><C-n><C-w>h
tmap <C-j> <C-\><C-n><C-w>j
tmap <C-k> <C-\><C-n><C-w>k
tmap <C-l> <C-\><C-n><C-w>l

map <C-w>t :tabe<CR>
map <C-q> :Bdelete!<CR>
map te :term<CR>
map ZX :qa<CR>
map ZC :qa!<CR>

" Easy terminals
tmap <Esc> <C-\><C-n>
" tnoremap jj    <C-\><C-n>

command! TrimWhitespace :%s/\s\+$//
