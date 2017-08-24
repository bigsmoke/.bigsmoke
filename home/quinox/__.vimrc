" conf-sync managed

" conf-sync begin-section=custom
set number
set showmatch
set autoindent
set tabstop=4
set shiftwidth=4
set hlsearch
set fileencoding=utf-8
set spelllang=en_us

filetype indent on

autocmd FileType python set expandtab
autocmd Bufenter *.shpaml set syntax=aml

highlight tabs ctermbg=darkblue
match tabs /	\+/

inoremap <silent> <F6> <c -O>:call SpellToggle()<cr>
map <silent> <F6> :call SpellToggle()<cr>
function SpellToggle()
    if &spell == 1
        set nospell
        echo "nospell"
    else
        set spell
        echo "spell"
    endif
endfunction

inoremap <silent> <F7> <c -O>:call PasteToggle()<cr>
map <silent> <F7> ::call PasteToggle()<cr>
function PasteToggle()
    if &paste == 1
        set nopaste
        echo "nopaste"
    else
        set paste
        echo "paste"
    endif
endfunction
" conf-sync end-section
