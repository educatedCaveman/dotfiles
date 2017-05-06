"""""""""""""""""""""""""
" vundle configuration: "
"""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'   "comments
Plugin 'scrooloose/nerdtree'        "file manager
Plugin 'flazz/vim-colorschemes'

"colorschemes:
Plugin 'romainl/Apprentice'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

"""""""""""""""""""
" Plugin options: "
"""""""""""""""""""

"nerdCommenter:
let mapleader=","
set timeout timeoutlen=1500
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

"nerdTree:
nnoremap <F5> :NERDTreeToggle<CR> 
let NERDTreeShowHidden=1
"autostart if no file specified:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"quit if only nerdtree showing:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""
" non-Plugin stuff here: "
""""""""""""""""""""""""""

"appearance:
syntax enable
":color peachpuff
colorscheme apprentice
set relativenumber
set number
set nowrap

"status line
set showcmd
set laststatus=2
set ru  "ruler

"searching:
set wildmenu
set ignorecase
set smartcase
set incsearch

"indentation and tabbing:
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
"set autoindent

"misc.:
"set nocp "duplicate from Vundle config
set clipboard=unnamed
set clipboard+=unnamedplus

"sudo after opening:
cmap w!! w !sudo tee >/dev/null %

"formatting brackets and such:
inoremap {<Space> {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko<Tab>
inoremap (<Space> ()<Esc>i
inoremap (<CR> (<CR>)<Esc>ko<Tab>
inoremap [<Space> []<Esc>i
inoremap [<CR> [<CR>]<Esc>ko<Tab>

