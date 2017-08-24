call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/syntastic'

Plug 'itchyny/lightline.vim'

Plug 'ap/vim-buftabline'
Plug 'tpope/vim-vinegar'

Plug 'freeo/vim-kalisi'
Plug 'tomasr/molokai'
Plug 'mhartington/oceanic-next'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

call plug#end()

let g:lightline = { 'colorscheme': 'solarized' }
set termguicolors
set background=dark
colorscheme solarized

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

syntax enable

set mouse=a
set mousefocus
