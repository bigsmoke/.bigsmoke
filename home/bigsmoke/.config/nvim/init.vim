set tags=./._tags;

call plug#begin('~/.local/share/nvim/plugged')

Plug 'dense-analysis/ale'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

"let g:black_virtualenv = "~/projects/ytec-tooling/cache/lightvirtual3_black_ltsp5240/"
let g:black_linelength = 119  " Django's Python style has 119 (Github code review max)
let g:black_skip_string_normalization = 1
Plug 'ytec-nl/black'

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
nmap <leader>s<right>  :rightbelow wnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

"nnoremap <C-N> :bnext<CR>
"nnoremap <C-P> :bprev<CR>

nmap <F8> <Plug>(ale_fix)
nmap <F9> :Black<CR>
nmap <C-]> :ALEGoToDefinition<CR>
nmap <F5> :ALESymbolSearch <cword><CR>
nmap <F6> :ALEGoToDefinition<CR>
nmap <F7> :ALEFindReferences<CR>

set sessionoptions+=tabpages,globals

syntax enable

set mouse=a
set mousefocus

set clipboard=unnamedplus

" Terminal settings
au TermOpen * setlocal scrollback=10000
tnoremap <Esc> <C-\><C-n>

autocmd BufEnter *.shpaml :set filetype=haml
autocmd BufEnter *.shpaml :set syntax=shpaml
autocmd BufEnter *.shpaml :syntax sync fromstart
autocmd BufEnter *.shpaml :syntax sync fromstart
autocmd FileType shpaml :set shiftwidth=4 tabstop=4
autocmd BufWritePre *.py execute ':Black'

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
    let g:ale_lint_on_text_changed=never
endif
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_linters = {
\   'python': ['pyls', 'pylint', 'mypy'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0  " Use deoplete instead
"set omnifunc=ale#completion#OmniFunc
"let g:ale_completion_tsserver_autoimport = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
