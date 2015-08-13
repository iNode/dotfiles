set bg=dark

" --- Keybindings ---
:imap <special> en <Esc>
set pastetoggle=<F11>

" comment/uncomment for shell alike
map <F2> :s+^\(.*\)+#\1+<CR>
map <F3> :s+^#\(.*\)+\1+<CR>
" switch buffers
map ;[ :bprev<CR>
map ;] :bnext<CR>
map ;! :bdel<CR>

" ---

set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set showmatch     " check braces
set encoding=utf-8
set termencoding=utf-8

" auto delete trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

au BufEnter * call Safe_cd()

au FileType haskell setlocal tabstop=2 shiftwidth=2
au FileType c setlocal tabstop=4 shiftwidth=4
au FileType sh setlocal tabstop=4 shiftwidth=4
au FileType sh map <buffer> <F9> :call MyExec()<CR>
au FileType python setlocal tabstop=3 shiftwidth=3
" match pairs of < and >
au FileType cpp set mps+=<:>

" --------- FUNCTIONS ------------------------------
" change directory on change buffer
function! Safe_cd ()
    let path=expand('%:h')
    let path=substitute(path,"^.\\{-1,}:","","")
    if isdirectory(path)
        execute "cd " . path
    endif
endfunction

function! MyExec()
    let fn="./" . bufname("%")
    if !executable(fn)
	silent! execute "!chmod a+x " . fn
    endif
    execute "!".fn
endfunction
