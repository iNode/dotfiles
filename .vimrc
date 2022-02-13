" use vim not vi
" set nocompatible                  " enabled by default when handling .vimrc
set list                            " Display unprintable characters.
set listchars=tab:▸\ ,trail:·,eol:¬ " Make tabs, trailing whitespace, and EOL characters easy to spot.

call plug#begin('~/.vim/bundle')
    Plug 'tpope/vim-sensible'        " sensible defaults for vim
    Plug 'tpope/vim-commentary'      " comment/uncomment (gcc)
    Plug 'tpope/vim-unimpaired'      " Pairs of handy bracket mappings, :h unimp
    Plug 'tpope/vim-surround'        " surround text, ( ys$' cs'` ds' ysw) )
    Plug 'junegunn/vim-easy-align'   " easy-to-use Vim alignment
    Plug 'easymotion/vim-easymotion' " easy motion, <SP><SP>w|W/b|B/f|F/j|k
    Plug 'tpope/vim-repeat'          " repeat plugin command: surround, unimpired, easy-align
    Plug 'tpope/vim-dispatch'        " async task dispatch, :h dispatch, '! - Start, m! - :Make!, `! - :Dispatch
    Plug 'tpope/vim-markdown'        " markdown support
    Plug 'airblade/vim-gitgutter'    " mark file changes in gutter for git repo
    Plug 'amiorin/vim-eval'          " C-c for eval line or selection
    Plug 'mileszs/ack.vim'           " ack/ag/etc. support
    Plug 'qpkorr/vim-renamer'        " rename files interactively, see :h Renamer
    " Plug 'jlanzarotta/bufexplorer'   " buffer navigation
    Plug 'vim-scripts/taglist.vim'   " source code tag browser
    Plug 'benmills/vimux'            " interact with tmux from vim, :h vimux
"   Plug 'valloric/youcompleteme'   " code completion engine, obsoletes ^
"   Plug 'tpope/tpope-vim-abolish'  " smart replacements and abbrevs
    Plug 'ctrlpvim/ctrlp.vim'       " full path fuzzy file, buffer, mru, tag, ... finder for Vim
    " install fzf library
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'              " use fzf.vim for fuzzy matching TODO: review
    Plug 'neapel/vim-java-bytecode'      " java bytehocode highlight
    Plug 'vim-syntastic/syntastic'       " syntax checking plugin
    Plug 'editorconfig/editorconfig-vim' " use editorconfig files if available
    Plug 'LnL7/vim-nix'                  " highlight for nix pkg experssions

    " syntax highlighting and programming languages
    "
    " org-mode
    Plug 'tpope/vim-speeddating'     " date plugin used by org-mode, adds support for C-A/C-X auto dec/increment
    Plug 'jceb/vim-orgmode'          " org-mode support, TODO: RTFM, add notes
    " HCL
    Plug 'b4b4r07/vim-hcl'

if executable('direnv')
    Plug 'direnv/direnv.vim'         " direnv support
endif
if executable('sxhkd')
    Plug 'kovetskiy/sxhkd-vim'       " sxhkd syntax highlight
endif
if executable('tmux')
    Plug 'tmux-plugins/vim-tmux'     " syntax highligt for tmux configs
endif
if executable('i3')
    Plug 'PotatoesMaster/i3-vim-syntax'
endif
if executable('reds')
    Plug 'iNode/vim-red'              " red-lang code highlight
endif
if executable('v')
    Plug 'ollykel/v-vim', { 'for': 'v,vsh' }
endif
call plug#end()

" see some defaults under vim-sensible
" set spell

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" use :find *file*name for fuzzy finding and in gf (goto file) and ^Wf (goto
" file next window)
" :ls show buffers list

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
    " Let's save undo info!
    if !isdirectory($HOME."/.vim")
        call mkdir($HOME."/.vim", "p", 0700)
    endif
    if !isdirectory($HOME."/.vim/undo")
        call mkdir($HOME."/.vim/undo", "p", 0700)
    endif
    set undolevels=5000         " How many undos
    set undoreload=10000        " number of lines to save for undo
    set undodir=~/.vim/undo
    set undofile
endif
" set swap files location
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "p", 0700)
endif
" // to avoid filename collisions
set directory=~/.vim/swap//


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
" set colorcolumn=81
highlight ColorColumn ctermbg=yellow
call matchadd('ColorColumn', '\%81v', 100)

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
" to auto fold/unfold when cursor moving from/to this line/block
set foldclose=all
set foldopen=all
" to use colums to show folding level
" set foldcolumn=6
" set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

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
set wildmode=list:longest,full

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

" moving lines virtically in visual mode only
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" taglist options
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
set tags=./tags*,tags

" smart comletion by Control+Space
imap <C-Space> <C-N>
"
" 'smart' Home
nnoremap <Home> ^
imap <Home> <Esc>I

" default for leader is "\" key
" Grep function
nnoremap <Leader>gp :Grep<space>

" example file to read / go-to
" ~/.bashrc
nnoremap gr :r <cfile><CR>
" open the file in new tab
nnoremap gf <C-w>gf
" create the file and open in new tab
nnoremap gF :tabedit <C-r><C-f><CR>

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
" switch to the previous buffer
nnoremap <leader>' <c-^>
nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>

" search for word under the cursor without word boundaries
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

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
nnoremap <C-x>O <C-w><C-w>
nnoremap <C-x>o <C-w><C-w><C-w>_
" command line bindings
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" switch buffer
nnoremap <C-x>b :CtrlPBuffer<CR>
" kill buffer
nnoremap <C-x>k :bd<CR>

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

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

" autocmd BufEnter * call Safe_cd()
" edit in current working directory (location of current file)
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
" map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

" replace command on curren line by execution result
" overrides Ex-mode command on Q
nnoremap Q !!$SHELL<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <silent>  <leader>vv :next ~/.vimrc<CR>
if has("autocmd")
    set autoindent
    filetype indent on
    filetype plugin on
    filetype plugin indent on
    set relativenumber

    augroup VIMRC " {{{
        autocmd!

        autocmd BufWritePost .vimrc nested source ~/.vimrc
    augroup END " }}}

    "Only apply to .txt files...
    augroup HelpInTabs
        autocmd!
        autocmd BufEnter  *.txt   call HelpInNewTab()
    augroup END

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
        autocmd FileType liquid,markdown,text,txt setlocal textwidth=78 linebreak nolist spell
        autocmd BufNewFile,BufRead *.json set filetype=javascript
        autocmd BufNewFile,BufRead *.1.md setlocal textwidth=78 makeprg=pandoc\ -s\ -w\
                    \ man\ %\ -o\ %<
        autocmd BufNewFile,BufRead *.md setlocal makeprg=pandoc\ %\ -w\ html\ -o\ %<.html
        autocmd FileType make,snippet,snippets setlocal list tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
        " But for yaml keep 2 characters, pls
        autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
        autocmd FileType xml,xsd,xslt,javascript setlocal tabstop=2
        au BufNewFile,BufRead *.javap setf java-bytecode
        autocmd FileType text,txt,mail          setlocal autoindent comments=fb:*,fb:-,n:>
        autocmd FileType haskell setlocal tabstop=2 shiftwidth=2
        autocmd FileType help setlocal autoindent formatoptions+=2n | silent! setlocal nospell
        autocmd FileType help nnoremap <silent><buffer> q :q<CR>

        autocmd FileType red,reds setlocal tabstop=4 shiftwidth=4 expandtab foldmethod syntax
        autocmd FileType c setlocal tabstop=4 shiftwidth=4 softtabstop=4
        autocmd FileType sh setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab foldmethod=syntax
        autocmd FileType sh let g:sh_fold_enabled=5
        autocmd FileType sh let g:is_bash=1
        " match pairs of < and >
        autocmd FileType cpp set matchpairs+=<:>
        autocmd FileType python,lua setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
        " autocmd FileType python set define=^\\s*def
        autocmd FileType perl let b:dispatch = 'perl -Wc %'
        " set sha-bang on C-x <!>
        autocmd FileType sh,zsh,csh,tcsh        inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
        autocmd FileType perl,python,ruby       inoremap <silent> <buffer> <C-X>! #!/usr/bin/env<Space><C-R>=&ft<CR>
        autocmd Filetype gitcommit setlocal spell textwidth=72
        " autocmd FileType perl set define=^\\s*sub
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
    autocmd BufWritePost,FileWritePost *.gpg update
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
" old Plain DOS charset                         =p
" kOi8-r charset                                =o
" cp1251 charset                                =i
" utf-8 charset                                 =u
map =p  :e ++enc=866<CR>
map =l  :e ++enc=cp1251<CR>
map =o  :e ++enc=koi8-r<CR>
map =u  :e ++enc=utf-8<CR>

" --------------------------------------------------
" [PLUGINS]
" --------------------------------------------------

" Key to go into dvorak mode:
" map ,d :source ~/.vim/dvorak
"" Key to get out of dvorak mode:
" map ,q :source ~/.vim/qwerty

if executable("zsh") && filereadable("~/.zshrc")
    " zsh -l -c <command>" for :sh and :!
    " (so it sources my .zshrc and so forth)
    set shellcmdflag=-c
    set shell=/bin/zsh\ -l"
endif

" man
runtime ftplugin/man.vim
nnoremap <c-F1> :Man
nnoremap <c-q>  :Man

" Pretty-print JSON files with Python (& remove the trailing whitespace that
" Python <2.7 json module adds, sigh)
nnoremap <Leader>j :%!python3 -m json.tool<CR>:%s/\s\+$//g<CR>

" toggle non-printing characters
nnoremap <Leader>h :set list!<CR>

" additional ESC mapping(s)
inoremap <C-C> <ESC>

" use backspace and enter to navigate by paragraph instead of line
nnoremap <BS> {
nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'

if v:version > 703
  " remove a comment leader when joining lines
  set formatoptions+=j
endif

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

" When writing encrypted files, use blowfish instead of zip encryption
" vim -x filename
if !has('nvim')
    " not supported in neovim
    set cryptmethod=blowfish2
endif

" netrw {{{
    " configure netrw like a nerdtree
    let g:netrw_banner = 0  " Use I for enabling banner
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4
    let g:netrw_altv = 1
    let g:netrw_winsize = 25
    " augroup ProjectDrawer
    "     autocmd!
    "     autocmd VimEnter * :Vexplore
    " augroup END
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
    nnoremap ga <Plug>(EasyAlign)
" }}} vim-easy-align

" andviro/flake8-vim {{{
    let g:PyFlakeOnWrite = 1
    let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
    let g:PyFlakeForcePyVersion=3

" }}} flake8-vim
" auto-pairs {{{
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
" }}} auto-pairs

" ctrlp {{{
" }}}

" PLUGIN: fzf.vim{{{
let g:fzf_layout = { 'down': '~40%' }

" Add namespace for fzf.vim exported commands
let g:fzf_command_prefix = 'Fzf'

" Mappings
nnoremap <silent> <leader>o :FzfFiles<CR>
nnoremap <silent> <leader>O :FzfFiles!<CR>
cnoremap <silent> <C-p>  :FzfHistory:<CR>
cnoremap <silent> <C-_> <ESC>:FzfHistory/<CR>
nnoremap <silent> <leader>b  :FzfBuffers<CR>
nnoremap <silent> <leader>`  :FzfMarks<CR>
nnoremap <silent> <F1> :FzfHelptags<CR>
inoremap <silent> <F1> <ESC>:FzfHelptags<CR>
noremap <silent> <leader>; :FzfCommands<CR>
nnoremap <silent> <leader>l :FzfBLines<CR>
inoremap <silent> <F3> <ESC>:FzfSnippets<CR>

" fzf.Tags uses existing 'tags' file or generates it otherwise
nnoremap <silent> <leader>t :FzfTags<CR>
xnoremap <silent> <leader>t "zy:FzfTags <C-r>z<CR>

" fzf.BTags generate tags on-fly for current file
nnoremap <silent> <leader>T :FzfBTags<CR>
xnoremap <silent> <leader>T "zy:FzfBTags <C-r>z<CR>
" }}}

" vimux {{{
 " Run last command executed by VimuxRunCommand
  nnoremap <Leader>vl :VimuxRunLastCommand<cr>
  nnoremap <Leader>vp :VimuxPromptCommand<cr>
  nnoremap <Leader>vc :VimuxCloseRunner<cr>
" }}}

" syntactic {{{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " disable java checks
    let g:syntastic_mode_map = { 'passive_filetypes': ['java']   }
    let g:syntastic_disabled_filetypes=['java']
    let g:syntastic_java_checkers=['']

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    " allow shellcheck to work with external files
    let g:syntastic_sh_shellcheck_args="-x"

    " use python3 as a baseline to check syntax
    let g:syntastic_python_checkers = ['python3']

    " ignore files of Ansible Roles.
    let g:syntastic_ignore_files = ['\m^roles/']
" }}}

" markdown {{{
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
" }}}

" easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}} easy-align

" Easy motion config
let g:EasyMotion_do_mapping = 1
" }}} vim-easymotion

" # }}} Plugin settings

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif



" UI specific
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also https://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif
if has("termguicolors")

    set termguicolors
    " This is only necessary if you use "set termguicolors".
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " fixes glitch? in colors when using vim with tmux
    set background=dark
    set t_Co=256
endif

" colorscheme elflord
" colorscheme desert
colorscheme zenburn
