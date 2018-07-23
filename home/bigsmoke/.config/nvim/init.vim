set tags=./._tags;

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

Plug 'freeo/vim-kalisi'
Plug 'tomasr/molokai'
Plug 'mhartington/oceanic-next'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

Plug 'ldx/vim-indentfinder'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
set termguicolors
set background=dark
colorscheme solarized

let mapleader="\<Space>"
nnoremap <Leader><Tab> :tabnext<CR>
nnoremap <Leader><S-Tab> :tabprev<CR>

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

"nnoremap <C-N> :bnext<CR>
"nnoremap <C-P> :bprev<CR>

set sessionoptions+=tabpages,globals

syntax enable

set mouse=a
set mousefocus

set clipboard=unnamedplus

map <silent> <F7> :call UpdateTags()<cr>
map <silent> <F8> :call UpdateAllTags()<cr>

function UpdateTags()
    let tagfile = system('update-tags')
    echo "Updated tags"
endfunction

function UpdateAllTags()
    let tagfile = system('update-tags --all')
    echo "Updated all tags"
endfunction

" Terminal settings
au TermOpen * setlocal scrollback=10000
tnoremap <Esc> <C-\><C-n>

autocmd BufEnter *.shpaml :set filetype=haml
autocmd BufEnter *.shpaml :set syntax=shpaml
autocmd BufEnter *.shpaml :syntax sync fromstart
autocmd BufEnter *.shpaml :syntax sync fromstart
autocmd FileType shpaml :set shiftwidth=4 tabstop=4

function TmuxUpdateEnvironment()
    let $DISPLAY = system('tmux show-environment|grep "^DISPLAY"')
    let $SSH_AUTH_SOCK = system('tmux show-environment|grep -E "^SSH_AUTH_SOCK"')
    let $SSH_CONNECTION = system('tmux show-environment|grep -E "^SSH_CONNECTION"')
    let $BS_UPDATE_ENV_TEST = system('tmux show-environment|grep -E "^BS_UPDATE_ENV_TEST"')
    echo "Propegated tmux environment into VIM session."
endfunction

command TmuxUpdateEnvironment :call TmuxUpdateEnvironment()

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhiteSpace ctermbg=red guibg=red
" Show trailing whitespace:
match ExtraWhiteSpace /\s\+$/
" Show tabs:
match ExtraWhiteSpace /\t/

function! AmIRunningOnBatteryPower()
    return filereadable('/sys/class/power_supply/AC/online') && readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

if AmIRunningOnBatteryPower()
    call neomake#configure#automake('w')
else
    call neomake#configure#automake('nw', 1000)
endif
