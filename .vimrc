" use vim not vi
" set nocompatible                    " enabled by default when handling .vimrc
set list                            " Display unprintable characters.
set listchars=tab:▸\ ,trail:·,eol:¬ " Make tabs, trailing whitespace, and EOL characters easy to spot.

call plug#begin('~/.vim/bundle')
    Plug 'tpope/vim-sensible'       " sensible defaults for vim
    Plug 'tpope/vim-commentary'     " comment/uncomment (gcc)
    Plug 'tpope/vim-repeat'         " repeat plugin command
    Plug 'tpope/vim-unimpaired'     " Pairs of handy bracket mappings
    Plug 'tpope/vim-surround'       " surround text
    Plug 'tpope/vim-fugitive'       " git interface
    Plug 'tpope/vim-scriptease'     " plugin for doing plugins, e.g. Vedit
    Plug 'tpope/vim-dispatch'       " async task dispatch
    Plug 'airblade/vim-gitgutter'   " mark file changes in gutter for git repo
    Plug 'amiorin/vim-eval'         " C-c for eval line or selection
    Plug 'mileszs/ack.vim'          " ack/ag/etc. support
    Plug 'jlanzarotta/bufexplorer'  " buffer navigation
    Plug 'vim-scripts/taglist.vim'  " source code tag browser
    Plug 'ervandew/supertab'        " tab completion
    Plug 'jiangmiao/auto-pairs'     " insert or delete brackets, parens, quotes in pair
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }    " fuzzy finder
    Plug 'junegunn/vim-easy-align'  " easy-to-use Vim alignment
    Plug 'benmills/vimux'           " Easily interact with tmux from vim.
"   Plug 'valloric/youcompleteme'   " code completion engine, obsoletes ^
    Plug 'nfvs/vim-perforce'        " perforce client
"   Plug 'tpope/tpope-vim-abolish'  " smart replacements and abbrevs
    Plug 'kien/ctrlp.vim'           " full path fuzzy file, buffer, mru, tag, ... finder for Vim
    Plug 'vim-syntastic/syntastic'  " syntax checking plugin
    if executable('python')
        Plug 'andviro/flake8-vim', { 'for': 'python' }
    endif
    if executable('go')
        Plug 'fatih/vim-go', { 'for': 'go' }
    endif
call plug#end()

" see some defaults under vim-sensible
"
" set spell

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" use :find *file*name for fuzzy finding and in gf (goto file) and ^Wf (goto
" file next window)
" :ls show buffers list


" colorscheme elflord
colorscheme desert

" Search settings {{{
set hlsearch " use C-L to reset highlight from sensible-vim
set ignorecase
set smartcase
" }}}

" spaces on tabs
set softtabstop=4
set shiftwidth=4
set showmatch " check braces
set termencoding=utf-8

" enable per project settings
set exrc
set secure

" undo file configuration
if has("persistent_undo")
    set undofile                " Save undo's after file closes
    set undodir=~/.vim/undo     " where to save undo histories
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif



if &term == "xterm-color"
    let &term = "xterm-256color"
endif

"
" use gitignore to ignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" highlight lines longer than 80chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" No tabs, only spaces
set expandtab

"  view' mode settings
if &readonly == 1
    set nonumber
    set nofoldenable
    set foldcolumn=10
    nnoremap <F10> :qa<cr>
    nnoremap q :qa<cr>
    nnoremap <Space> <PageDown>
endif


let c_space_errors=1

" Fold options
set foldmethod=indent
" set foldmethod=syntax
" set nofoldenable
"  set foldclose=all
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"
" russian keymap
set keymap=russian-jcukenwin
" latin by default
set iminsert=0
" and also for search
set imsearch=0

" Map Leader to the Space
let mapleader        = "\<Space>"
let g:mapleader      = "\<Space>"
let maplocalleader   = "\<Space>"
let g:maplocalleader = "\<Space>"

" No arrows: hardcore mode
noremap  <up>    <nop>
noremap  <down>  <nop>
noremap  <left>  <nop>
noremap  <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

"
"-----------------------------------------------------------------------
" completion
"-----------------------------------------------------------------------
set dictionary=/usr/share/dict/words

set nobackup
set hidden
" Always show statusline
set laststatus=2
set statusline=%F%<\ %y%h%m%r%=%b\ 0x%B\ %{&encoding}\ \ %l,%c%V\ %P

""""
" Key bindings (:map, :imap, :nmap :vmap - to view bindings)
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

" default for leader is "\" key
" Grep function
nnoremap <Leader>gp :Grep<space>
" fast jump within block
nnoremap <Leader><Space> %

"close other window
nnoremap <silent> <leader>c <C-w>c
"quit without saving
nnoremap <silent> <leader>q ZQ
nnoremap <silent> <Leader>qq :q<CR>
nnoremap <silent> <Leader>qa :qa<CR>
"re-read config
nnoremap <silent> <leader>s :source ~/.vimrc<CR>
" write file
nnoremap <silent> <leader>w :w<CR>
nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>
nnoremap <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
cnoremap w!! w !sudo tee > /dev/null %
" command WSudo :set buftype=nowrite | silent :%w !sudo tee % | :set buftype=

" Omni Completion
" imap <C-F> <C-X><C-O>

" emacs like bindings {{{
" Window switch
nmap <C-x>O <C-w><C-w>
nmap <C-x>o <C-w><C-w><C-w>_
" command line bindings
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" switch buffer
nmap <C-x>b :BufExplorer<CR>
" kill buffer
nmap <C-x>k :bd<CR>

imap <M-b> <Esc>bi
imap <M-f> <Esc>wi
" }}}
" set ignorecase

" \c in search ignorecase, \C - noignorecase
set smartcase " if search word contains UpCase (noic)

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

map <F3> gcc
map <F4> :Explore<CR>
map <F5> :mksession! ~/.vim/lastSession.vim<CR>
map <C-F5> :source! ~/.vim/lastSession.vim<CR>
map <F6> :silent! call MyTlist()<CR>
map <F7> :BufExplorer<CR>
map <F8> :s/\s*$//<CR>
map <F9> :call MyExec()<CR>
map <C-F8>    :Make<CR>
map <C-F9>    :Dispatch<CR>
map <C-F10>   :Start<CR>
" noremap <silent> <F11> :cal VimCommanderToggle()<CR>

" adios stupid mc-like insert
set pastetoggle=<F11>

" toggle nu/nonu
set number
imap  <silent> <F12>   :let &number=1-&number<CR>
map   <silent> <F12>   :let &number=1-&number<CR>

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

" replace command on curren line by execution result
" overrides Ex-mode command on Q
nnoremap Q !!$SHELL<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

if has("autocmd")
    set autoindent
    filetype indent on
    filetype plugin on
    filetype plugin indent on
    set relativenumber
  augroup VIMRC " {{{
    autocmd!

    autocmd BufWritePost .vimrc source ~/.vimrc
  augroup END " }}}

  augroup FTOptions " {{{2
    autocmd!
    " Save and load session by default
    " autocmd VimLeavePre * :silent mksession! ~/.vim/lastSession.vim
    " autocmd VimEnter * :silent source! ~/.vim/lastSession.vim
    autocmd BufReadPre  *.doc set readonly
    autocmd BufReadPost *.doc %!catdoc %

    " auto delete trailing spaces
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd FileType spec setlocal commentstring=#\ %s
    autocmd FileType *commit* setlocal spell
    autocmd FileType liquid,markdown,text,txt setlocal textwidth=78 linebreak nolist
    autocmd BufNewFile,BufRead *.json set filetype=javascript
    autocmd BufNewFile,BufRead *.1.md setlocal textwidth=78 makeprg=pandoc\ -s\ -w\
        \ man\ %\ -o\ %<
    autocmd FileType make,snippet,snippets setlocal list tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
    " But for yaml keep 2 characters, pls
    autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
    autocmd FileType xml,xsd,xslt,javascript setlocal tabstop=2
    autocmd FileType text,txt,mail          setlocal autoindent comments=fb:*,fb:-,n:>
    autocmd FileType haskell setlocal tabstop=2 shiftwidth=2
    autocmd FileType help setlocal autoindent formatoptions+=2n | silent! setlocal nospell
    autocmd FileType help nnoremap <silent><buffer> q :q<CR>

    autocmd FileType c setlocal tabstop=4 shiftwidth=4
    " match pairs of < and >
    autocmd FileType cpp set matchpairs+=<:>
    autocmd FileType python,lua setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType perl let b:dispatch = 'perl -Wc %'
  augroup END "}}}2

  " Transparent editing of gpg encrypted files.
  " By Wouter Hanegraaff
  augroup encrypted
    autocmd!

    " First make sure nothing is written to ~/.viminfo while editing
    " an encrypted file.
    autocmd BufReadPre,FileReadPre *.gpg set viminfo=
    " We don't want a various options which write unencrypted data to disk
    autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

    " Switch to binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre *.gpg set bin
    autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
    " (If you use tcsh, you may need to alter this line.)
    autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost *.gpg set nobin
    autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

    " Convert all text to encrypted text before writing
    " (If you use tcsh, you may need to alter this line.)
    autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
    " Undo the encryption so we are back in the normal text, directly
    " after the file has been written.
    autocmd BufWritePost,FileWritePost *.gpg u
    autocmd BufReadPost * if getline(1) =~# '^#!' | let b:dispatch = getline(1)[2:-1] . ' %' | let b:start = b:dispatch | endif
    autocmd BufReadPost ~/.Xdefaults,~/.Xresources let b:dispatch = 'xrdb -load %'
  augroup END
  augroup FTCheck " {{{2
    autocmd!
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
  augroup END " }}}2
endif " has("autocmd")

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

" Key to go into dvorak mode:
" map ,d :source ~/.vim/dvorak
"" Key to get out of dvorak mode:
" map ,q :source ~/.vim/qwerty

" man
runtime ftplugin/man.vim
nnoremap <c-F1> :Man
nnoremap <c-q>  :Man

" Pretty-print JSON files with Python (& remove the trailing whitespace that
" Python <2.7 json module adds, sigh)
nnoremap <Leader>j :%!python -m json.tool<CR>:%s/\s\+$//g<CR>

" toggle non-printing characters
nnoremap <Leader>h :set list!<CR>

" --------------------------------------------------
" [GUI]
if has("gui_running")
    set guioptions-=T  " hide toolbar
    set guioptions-=r  " hide right scrollbar
    set guioptions-=L  " hide left scrollbar
    set guioptions-=m  " hide menu bar
    set guifont=Liberation\ Mono\ 10
    set guioptions=aegimMrLtp

    " Make copy/cut/paste work with GUI as expected
    nnoremap <silent> y "+y
    vnoremap <silent> y "+y
    nnoremap <silent><Leader>p "+gP
else
    " finish
endif

" turn off any existing search
" autocmd VimEnter * nohls

" The following maps the Control-F8 key to toggle between hex and binary (while also setting the
" noeol and binary flags, so if you :write your file, vim doesn't perform unwanted conversions.

" vim -b : edit binary using xxd-format!
augroup Binary
  autocmd!
  autocmd BufReadPre  *.bin let &bin=1
  autocmd BufReadPost *.bin if &bin | %!xxd
  autocmd BufReadPost *.bin set ft=xxd | endif
  autocmd BufWritePre *.bin if &bin | %!xxd -r
  autocmd BufWritePre *.bin endif
  autocmd BufWritePost *.bin if &bin | %!xxd
  autocmd BufWritePost *.bin set nomod | endif
augroup END

" use vim -b to do the same out of box
noremap <C-F8> :call HexMe()<CR>

let $in_hex=0
function! HexMe()
  set binary
  set noeol
  if $in_hex>0
    :%!xxd -r
    let $in_hex=0
  else
    :%!xxd
    let $in_hex=1
  endif
endfunction

" Tab for windchange
" FIXME: find better key
" map <s-Tab> <C-W>w<C-W>_
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

if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif

" netrw {{{
    " configure netrw like a nerdtree
    let g:netrw_liststyle = 3
    let g:netrw_banner = 0  " Use I for enabling banner
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4
    let g:netrw_altv = 1
    let g:netrw_winsize = 25
    augroup ProjectDrawer
        autocmd!
        autocmd VimEnter * :Vexplore
    augroup END
" }}} netrw

" # Plugin settings =============================================== {{{
" VimGo {{{

let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods   = 1
let g:go_highlight_structs   = 1

augroup Go
  autocmd!
  autocmd BufWritePre *.go :GoImports
  autocmd FileType    go   nmap K         <Plug>(go-doc)
  autocmd FileType    go   nmap <leader>g <Plug>(go-def-tab)
  autocmd FileType    go   nmap <leader>n <Plug>(go-callers)
  autocmd FileType    go   nmap <leader>r <Plug>(go-rename)
  autocmd FileType    go   nmap <leader>l <Plug>(go-lint)
  autocmd FileType    go   nmap <leader>R <Plug>(go-run)
augroup END

" }}}

" ack.vim
let g:ackprg = "ag --vimgrep --smart-case"
cnoreabbrev ag Ack

" vim-easy-align {{{
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
" }}} vim-easy-align

" andviro/flake8-vim {{{
    let g:PyFlakeOnWrite = 1
    let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
" }}} flake8-vim
" auto-pairs {{{
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
" }}} auto-pairs

" syntactic {{{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
" }}}

" # }}} Plugin settings

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
