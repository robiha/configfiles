" File: nvim/init.vim
" Description: Neovim configuration file
" Host: mlixa
" Maintainer: robiha <hallin.rle@gmail.com>
" Modified: 2017-12-19

" Plugins {{{1
" Download and install vim-plug if not present.
if empty('$HOME/.config/nvim/autoload/plug.vim')
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vimwiki/vimwiki'                   " Personal wiki for vim
Plug 'chriskempson/base16-vim'           " The Base16 colorschemes
"Plug 'reedes/vim-colors-pencil'          " Inspired by Ai-writer
Plug 'editorconfig/editorconfig-vim'     " http://editorconfig.org/
"Plug 'lervag/vimtex'                     " LaTex support for vim
"Plug 'xuhdev/vim-latex-live-preview'     " Live preview of latex
Plug 'junegunn/goyo.vim'                 " Distraction free writing
Plug 'vim-pandoc/vim-pandoc'             " Pandoc markdown
Plug 'vim-pandoc/vim-pandoc-syntax'      " Pandoc markdown
"Plug 'rust-lang/rust.vim'                " Rust-lang
"Plug 'vifm/neovim-vifm'                  " Vifm support (file manager)
Plug 'tpope/vim-eunuch'                  " Helpers for UNIX
Plug 'tpope/vim-commentary'              " Comment stuff out
Plug 'tpope/vim-surround'                " Quoting/parenthesizing made simple
call plug#end()

" Settings {{{1
set termguicolors
set background=dark
"let base16colorspace=256
colorscheme base16-default-dark
set confirm
set complete+=kspell
"set cursorline
set foldenable
set foldlevelstart=0
set foldnestmax=0
augroup foldgroup
	autocmd!
	autocmd BufReadPre * setlocal foldmethod=indent
	autocmd FileType vim setlocal foldmethod=marker
	autocmd BufWinEnter * if &foldmethod == 'indent' | setlocal foldmethod=manual | endif
augroup END
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set hidden
set ignorecase
set list
set listchars=tab:►\ ,trail:◊,nbsp:◦
" ▷ ▹ ▻ ►
set modelines=1
"set nomodeline
set mouse=a
set path+=**
set number
set showmatch
set smartcase
set textwidth=79
set visualbell

" Mappings {{{1
let mapleader="\<Space>"
let maplocalleader=","
"inoremap jk <ESC>
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
tnoremap <leader><ESC> <C-\><C-n>
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Abbreviations {{{1
iab <expr> dts strftime("%F")
iab <expr> dtts strftime("%F %T")

" Pandoc {{{1
let g:pandoc#formatting#mode='hA'
let g:pandoc#spell#default_langs=['en_gb', 'sv']

" Netrw {{{1
let g:netrw_liststyle=3
let g:netrw_banner=1
let g:netrw_altv=1
