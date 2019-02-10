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

"core plugins
Plugin 'scrooloose/nerdcommenter'   "comments
Plugin 'scrooloose/nerdtree'        "file manager

"colorschemes:
"Plugin 'flazz/vim-colorschemes'
Plugin 'romainl/Apprentice'
"Plugin 'xero/blaquemagick.vim'
"Plugin 'xero/sourcerer.vim'
"Plugin 'encody/vim-colors'
"Plugin 'Konstruktionist/vim'
"Plugin 'marcopaganini/termschool-vim-theme'
"Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'w0ng/vim-hybrid'
"Plugin 'tyrannicaltoucan/vim-deep-space'
"Plugin 'rakr/vim-two-firewatch'
"Plugin 'kamwitsta/nordisk'
Plugin 'zakj/vim-mourning'
Plugin 'sickill/vim-monokai'

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
colorscheme apprentice
"colorscheme mourning 
"colorscheme monokai
"set background=dark
"colorscheme hybrid

"line numbering:
set relativenumber
set number
autocmd InsertEnter * :set norelativenumber "dont want relative number in insert mode
autocmd InsertLeave * :set relativenumber   "DO want relative number in command mode

"status line
set showcmd
set laststatus=2
set ru  "ruler

"searching:
set wildmenu
set ignorecase
set smartcase
set incsearch

"indentation:
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

"tabs:
set showtabline=1
nmap <Tab> :tabn<CR>
nmap <S-Tab> :tabp<CR>
"open a new tab and open NERDTree:
nmap nt :tabe<CR><F5>  

"line wrapping:
set wrap
set showbreak=\ \ \ \   "indent wrapped lines

"misc.:
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

