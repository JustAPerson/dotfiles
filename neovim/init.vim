" Prefixes
"   ,qz
" Weirdly useful
"   CTRL-n select word
"   zt     scroll line to top
"   zz     scroll line to center
"   zb     scroll line to bottom
" Useless
"   <C-m> <C-,> <C-.>
"   - + <CR>
"   <C-u> <C-b>
"   <C-y>

call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes' " glorious Monokai

" Languages
Plug 'rust-lang/rust.vim'   " Mozilla Rust
Plug 'racer-rust/vim-racer' " Rust completion
    let g:racer_cmd = "/home/jason/.cargo/bin/racer"

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
    let g:syntastic_python_python_exec = '/usr/bin/python3'
    let g:syntastic_asm_checkers = ["nasm"]
Plug 'terryma/vim-multiple-cursors'   " v_CTRL-n
Plug 'tpope/vim-commentary'           " commenting w/ gcc
Plug 'tpope/vim-eunuch'               " linux interop
Plug 'tpope/vim-fugitive'             " git commands
Plug 'tpope/vim-unimpaired'           " quick settings
Plug 'fidian/hexmode'
Plug 'jiangmiao/auto-pairs'

" Need exploration
Plug 'junegunn/vim-easy-align'
    vmap <Enter> <Plug>(EasyAlign)
    nmap ga      V<Plug>(EasyAlign)
Plug 'sjl/gundo.vim'
Plug 'easymotion/vim-easymotion'
    " map <leader><leader>a <Plug>(easymotion-jumptoanywhere)
    nmap f  <Plug>(easymotion-prefix)
    nmap fd <Plug>(easymotion-repeat)
    nmap fa <Plug>(easymotion-jumptoanywhere)
    vmap f  <Plug>(easymotion-prefix)
    vmap fd <Plug>(easymotion-repeat)
    vmap fa <Plug>(easymotion-jumptoanywhere)
" Plug 'szw/vim-ctrlspace'
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
set splitright
set splitbelow
set gdefault
set smartindent

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
map <C-e> $

" scrolling half-pages is more useful
noremap <C-f> <C-u>

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
map <leader>gr :GundoToggle<CR>
map <leader>tv <C-w>v:term<CR>
map <leader>ts <C-w>s:term<CR>
map <leader>m :make!<CR>
nmap <leader>e :NERDTreeFocus<CR>
nmap <leader>E :NERDTreeToggle<CR>

" Selecting linewise is way more useful
nnoremap <C-v> <S-v>
nnoremap <S-v> <C-v>
vnoremap <C-v> <S-v>
vnoremap <S-v> <C-v>

" Copying and pasting to system clipboard is vital
nnoremap <leader>y "+yy
nnoremap <leader>Y :%y+<CR>
vnoremap <leader>y "+y
noremap  <leader>p "+p
noremap  <leader>P "+P

" Select just yanked text
nnoremap     <leader>v V`]


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
tnoremap <leader><Esc> <Esc>
" tnoremap jj    <C-\><C-n>
" never forget
let g:terminal_scrollback_buffer_size=65536

command! TrimWhitespace :%s/\s\+$//
