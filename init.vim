syntax enable
:color peachpuff
set nocp
set wildmenu
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set nowrap
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set showcmd
set clipboard=unnamed
set laststatus=2
set clipboard+=unnamedplus
set ru

"sudo after opening:
cmap w!! w !sudo tee >/dev/null %

"formatting brackets and such:
inoremap {<Tab> {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko<Tab>
inoremap (<Tab> ()<Esc>i
inoremap (<CR> (<CR>)<Esc>ko<Tab>
inoremap [<Tab> []<Esc>i
inoremap [<CR> [<CR>]<Esc>ko<Tab>
