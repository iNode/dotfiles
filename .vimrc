syntax enable
colorscheme elflord
set nohlsearch

" spaces on tabs
"set list listchars=tab:\..,trail:.
set softtabstop=4
set shiftwidth=4
set autoindent
set showmatch " check braces
set encoding=utf-8
set termencoding=utf-8

if &term == "xterm-color"
    let &term = "xterm-256color"
endif

" highlight lines longer than 80chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

set expandtab
au FileType haskell setlocal tabstop=2 shiftwidth=2
au FileType c setlocal tabstop=4 shiftwidth=4
au FileType python setlocal tabstop=4 shiftwidth=4

"  view' mode settings
if &readonly == 1
    set nonumber
    set nofoldenable
    set foldcolumn=10
    nmap <F10> :qa<cr>
    nmap q :qa<cr>
    nmap <Space> <PageDown>
endif


let c_space_errors=1
" Fold options
" set foldmethod=indent
set foldmethod=syntax
set nofoldenable
"  set foldclose=all

"
" russian keymap
set keymap=russian-jcukenwin
" latin by default 
set iminsert=0
" and also for search
set imsearch=0

"-----------------------------------------------------------------------
" completion
"-----------------------------------------------------------------------
set dictionary=/usr/share/dict/words

set nobackup
set ruler
set hidden
set statusline=%F%<\ %y%h%m%r%=%b\ 0x%B\ %{&encoding}\ \ %l,%c%V\ %P

""""
" Key bindings
"""""

" keep selection after shift
vnoremap < <gv
vnoremap > >gv

" taglist options
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
set tags=./tags*,tags

" smart comletion by Control+Space
imap <C-Space> <C-N>
"
" 'smart' Home
nmap <Home> ^
imap <Home> <Esc>I

" space work as page down in normal mode
nmap <Space> <PageDown>
" Omni Completion
imap <C-F> <C-X><C-O>

map \c :set ic<CR>
map \C :set noic<CR>

" Bindings
" F11 - toggle paste mode
" F12 - toggle string numbering
"       common bindings:
"       F2      -       comment
"       F3      -       uncomment
"       F4      -       :Explore
"       F5      -       check syntax, compile
"       F8      -       delete spaces at end of string
"       F9      -       run
" buffers:
" ;[    -       prev buffer
" ;]    -       next buffer
" :silent source! ~/.vim/plugin/taglist.vim<CR>:Tlist<CR>:map <F6>

function! MyExec()
    let fn="./" . bufname("%")
    if !executable(fn)
	silent! execute "!chmod a+x " . fn
    endif
    execute "!".fn
endfunction
function! MyTlist()
	if !exists('loaded_taglist')
		source ~/.vim/plugin/taglist.vim
		Tlist
	else
		Tlist
	endif
endfunction

" by default comment/uncomment for shell/perl/python/whatever
map <F2> :s+^\(.*\)+#\1+<CR>
map <F3> :s+^#\(.*\)+\1+<CR>

map <F4> :Explore<CR>
map <F6> :silent! call MyTlist()<CR>
map <F7> :BufExplorer<CR>
map <F8> :s/\s*$//<CR>
imap <F8> <ESC>:s/\s*$//<CR><i>
map <F9> :call MyExec()<CR>
map <F10> :mksession! ~/.vim/lastSession.vim<CR>
map <C-F10> :source! ~/.vim/lastSession.vim<CR>
" noremap <silent> <F11> :cal VimCommanderToggle()<CR>

" adios stupid mc-like insert
set pastetoggle=<F11>

" toggle nu/nonu
imap  <silent> <F12>   :let &number=1-&number<CR>
map   <silent> <F12>   :let &number=1-&number<CR>

" command WSudo :set buftype=nowrite | silent :%w !sudo tee % | :set buftype=


" Delete All Spaces
map DS  :%s/[ <Tab>]//g<C-M>
" Delete Empty Lines
map DR  :g/^$/d<C-M>
" Delete Empty Lines + Lines w/whitespace only
map DE  :g/^[<C-I> ]*$/d<C-M>
" Change Lines w/WhiteSpace only to \n
map DW  :%s/^[<C-I> ]*$//g<C-M>
" Insert current time
map DT  o<C-R>=strftime("%a %b %d %T %Z %Y")<C-M><C-M>


" --------------------------------------------------
" change directory on change buffer
function! Safe_cd ()
    let path=expand('%:h')
    let path=substitute(path,"^.\\{-1,}:","","")
    if isdirectory(path)
        execute "cd " . path
    endif
endfunction

au BufEnter * call Safe_cd()
map ;[ :bprev<CR>
map ;] :bnext<CR>



" Save and load session by default
" autocmd VimLeavePre * :silent mksession! ~/.vim/lastSession.vim
" autocmd VimEnter * :silent source! ~/.vim/lastSession.vim
autocmd BufReadPre  *.doc set ro
autocmd BufReadPost *.doc %!catdoc %

" --------------------------------------------------
" Charsets
" old Plain DOS charset				=p
" kOi8-r charset				=o
" cp1251 charset				=i
" utf-8 charset					=u
map =p	:e ++enc=866<CR>
map =l	:e ++enc=cp1251<CR>
map =o	:e ++enc=koi8-r<CR>
map =u  :e ++enc=utf-8<CR>

" --------------------------------------------------
" [PLUGINS]
" --------------------------------------------------
" minibufexpl
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1
" source ~/.vim/minibufexpl.vim

" Key to go into dvorak mode:
" map ,d :source ~/.vim/dvorak
"" Key to get out of dvorak mode:
" map ,q :source ~/.vim/qwerty

" man
runtime ftplugin/man.vim
map <c-F1> :Man
map <c-q>  :Man

filetype plugin on
filetype indent on

" --------------------------------------------------
" [GUI]
" --------------------------------------------------

" autoshrink.vim: makes defocused vim window smaller
"   Author:		Rafal M. Sulejman
"   Date:		 3 Jun 2005
"   Version:	1
" ---------------------------------------------------------------------
if has("gui_running")
	set guifont=Liberation\ Mono\ 10
	set guioptions=aegimMrLtp
else
	finish
endif


" turn off any existing search
au VimEnter * nohls

" ------------------Spelling
" set spellfile=~/.vim/spell/ru.utf-8.add
"
" set wildmenu
" set wcm=<Tab>
" menu VVspell.enable_ru          :setlocal spell spelllang=ru<CR>
" menu VVspell.enable_en          :setlocal spell spelllang=en<CR>
" menu VVspell.enable_enru        :setlocal spell spelllang=en,ru<CR>
" menu Encoding.koi8-r            :e ++enc=koi8-r<CR>
" menu Encoding.windows-1251      :e ++enc=cp1251<CR>
" menu Encoding.ibm-866           :e ++enc=ibm866<CR>
" menu Encoding.utf-8             :e ++enc=utf-8<CR>
" menu Encoding.SpellMenu         :emenu VVspell.<TAB>
" map <F8> :emenu Encoding.<TAB>
