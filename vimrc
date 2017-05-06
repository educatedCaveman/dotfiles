"vundle:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"comments:
Plugin 'scrooloose/nerdcommenter'
    let mapleader=","
    set timeout timeoutlen=1500

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

"non-Plugin stuff here:
syntax enable
:color peachpuff
set nocp
set wildmenu
set relativenumber
set ignorecase
set smartcase
set incsearch
set nowrap
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set showcmd
set clipboard=unnamed
set laststatus=2
set clipboard+=unnamedplus
set directory=~/.vim/tmp

"sudo after opening:
cmap w!! w !sudo tee >/dev/null %

"formatting brackets and such:
inoremap {<Tab> {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko<Tab>
inoremap (<Tab> ()<Esc>i
inoremap (<CR> (<CR>)<Esc>ko<Tab>
inoremap [<Tab> []<Esc>i
inoremap [<CR> [<CR>]<Esc>ko<Tab>

