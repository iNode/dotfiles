" use vim not vi
" set nocompatible                  " enabled by default when handling .vimrc
set list                            " Display unprintable characters.
set listchars=tab:▸\ ,trail:·,eol:¬ " Make tabs, trailing whitespace, and EOL characters easy to spot.

call plug#begin('~/.vim/bundle')
    " sensible defaults for vim
    " pin packages, update date: 2022-03-21
    " vimPlugins.vim-sensible
    Plug 'tpope/vim-sensible',  { 'commit': '2d9f34c09f548ed4df213389caa2882bfe56db58' }
    " comment/uncomment (gcc)
    " vimPlugins.vim-commentary
    Plug 'tpope/vim-commentary', { 'commit': '627308e30639be3e2d5402808ce18690557e8292' }
    " Pairs of handy bracket mappings, :h unimp
    " vimPlugins.vim-unimpaired
    Plug 'tpope/vim-unimpaired', { 'commit': 'f992923d336e93c7f50fe9b35a07d5a92660ecaf' }
    " surround text, ( ys$' cs'` ds' ysw) )
    " vimPlugins.vim-surround
    Plug 'tpope/vim-surround', { 'commit': 'baf89ad26488f6a7665d51b986f5c7ad2d22b30b' }
    " repeat plugin command: surround, unimpired, easy-align
    " vimPlugins.vim-repeat
    Plug 'tpope/vim-repeat', { 'commit': '24afe922e6a05891756ecf331f39a1f6743d3d5a' }
    " async task dispatch, :h dispatch, '! - Start, m! - :Make!, `! - :Dispatch
    " vimPlugins.vim-dispatch
    Plug 'tpope/vim-dispatch', { 'commit': '00e77d90452e3c710014b26dc61ea919bc895e92' }
    " markdown support
    " vimPlugins.vim-markdown
    Plug 'tpope/vim-markdown', { 'commit': 'b52c46dd8e9532cb12cae85ed7fb6dcac3957ea5' }
    " vim plugin for git
    " vimPlugins.vim-fugitive
    Plug 'tpope/vim-fugitive', { 'commit': '46652a304f0b89f36d70cee954d77e467ec0f6de' }
    " easy-to-use Vim alignment
    " vimPlugins.vim-easy-align
    Plug 'junegunn/vim-easy-align', { 'commit': '12dd6316974f71ce333e360c0260b4e1f81169c3' }
    " easy motion, <SP><SP>w|W/b|B/f|F/j|k
    " vimPlugins.vim-easymotion
    Plug 'easymotion/vim-easymotion', { 'commit': 'd75d9591e415652b25d9e0a3669355550325263d' }
    " move selection up/down with A-j/k
    " vimPlugins.vim-move
    Plug 'matze/vim-move', { 'commit': '97fc86064eaa95384b5b00f6253e339fba44da5d' }
    " mark file changes in gutter for git repo
    " vimPlugins.vim-gitgutter
    Plug 'airblade/vim-gitgutter', { 'commit': '18d12985ea6cb7ede59755ff4fd0a9fa1e6bf835' }
    " source code tag browser
    " vimPlugins.taglist-vim
    Plug 'vim-scripts/taglist.vim', { 'commit': '53041fbc45398a9af631a20657e109707a455339' }

    " git history viewer :GV/GV?/GV!
    " vimPlugins.gv-vim
    Plug 'junegunn/gv.vim', { 'commit': '386d770e916dd680d1d622e715b9eb3a77f21bd1' }

    " interact with tmux from vim, :h vimux
    " vimPlugins.vimux
    Plug 'benmills/vimux', { 'commit': '89604a4464c3069dbe31f7bc8dd16a5fbc88a303' }
    " full path fuzzy file, buffer, mru, tag, ... finder for Vim
    " vimPlugins.ctrlp-vim
    Plug 'ctrlpvim/ctrlp.vim', { 'commit': '02d72d6a4008b0f0ef28a3bbefa67c231645fcaa' }
    " install fzf library
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() }, 'commit': 'dc975e8974c4f569980676d9f605226368e20711' }
    " use fzf.vim for fuzzy matching
    " vimPlugins.fzf-vim
    Plug 'junegunn/fzf.vim', { 'commit': 'b23e4bb8f853cb9641a609c5c8545751276958b0' }
    " use editorconfig files if available
    " vimPlugins.editorconfig-vim
    Plug 'editorconfig/editorconfig-vim', { 'commit': 'a8e3e66deefb6122f476c27cee505aaae93f7109' }

    " zeal integration plugin
    " vimPlugins.zeavim-vim
    Plug 'KabbAmine/zeavim.vim', { 'commit': '298e52ad683680b4aa19b53d009cf0e6b9197664' }
    " async linter
    " vimPlugins.ale
    Plug 'w0rp/ale', { 'commit': '5c7019f394588bdc29d7573f5063198c2803dfe4' }
    " UI
    " vimPlugins.vim-airline
    Plug 'vim-airline/vim-airline', { 'commit': 'e2498d72dcc123115ed1d0fe1449beba6dadecc2' }
    " snippets: Snippets engine
    " vimPlugins.ultisnips
    Plug 'SirVer/ultisnips', { 'commit': 'ca21d30c7a72e0e18ad95f25ded5a5f820052685' }
    " snippets: Predefined snippets in a separate plugin
    " vimPlugins.vim-snippets
    Plug 'honza/vim-snippets', { 'commit': '3c40345e100624e2a8946457839e80f526acbe3b' }
    " Tab completion/snippets expand :h supertab
    " vimPlugins.supertab
    Plug 'ervandew/supertab', { 'commit': 'f0093ae12a9115498f887199809a6114659fc858' }

if executable('direnv')
    " direnv support
    " vimPlugins.direnv-vim
    Plug 'direnv/direnv.vim', { 'commit': '451e3637a15af7d4a206ac761af7a2247f139e0e' }
endif
if executable('sxhkd')
    " sxhkd syntax highlight
    " NOTE: no nix-pkg plugin available
    Plug 'kovetskiy/sxhkd-vim', { 'commit': '2760f9d32bd2fb4d7d5305a88eb2056d149c6484' }
endif
if executable('tmux')
    " syntax highligt for tmux configs
    " vimPlugins.vim-tmux
    Plug 'tmux-plugins/vim-tmux', { 'commit': 'cfe76281efc29890548cf9eedd42ad51c7a1faf0' }
endif
if executable('i3')
    " i3 syntax highlighting
    " vimPlugins.i3config-vim
    Plug 'mboughaba/i3config.vim', { 'commit': '5c753c56c033d3b17e5005a67cdb9653bbb88ba7' }
endif
if executable('reds')
    " NOTE: no nix-pkg plugin available
    Plug 'iNode/vim-red'              " red-lang code highlight
endif
if executable('v')
    " v language code highlight
    " NOTE: no nix-pkg plugin available
    Plug 'ollykel/v-vim', { 'commit': '1dc1388bafb89072f8349dbd96f9462ae22237cb' }
endif
if executable('python3')
    " python code completion
    " vimPlugins.jedi-vim
    Plug 'davidhalter/jedi-vim', { 'commit': '030211555d5340e4a1acfa3a9368df85f34469d0' } " pin on master: 2021-11-18
endif
if executable('nix-shell')
    " highlight for nix-pkg experssions
    " vimPlugins.vim-nix
    Plug 'LnL7/vim-nix', { 'commit': '63b47b39c8d481ebca3092822ca8972e08df769b' }
endif

" neovim plugins
if has("nvim")
    if has("nvim-0.6")
        " some extension library, used by harpoon, telescope, etc.
        " vimPlugins.plenary-nvim
        Plug 'nvim-lua/plenary.nvim', { 'commit': '0d660152000a40d52158c155625865da2aa7aa1b' }
        " harpoon compatible with neovim 0.6+
        " vimPlugins.harpoon
        Plug 'ThePrimeagen/harpoon', { 'commit': 'b2bb0d6f2b8a55895afda53f0ad04527998d3411' }
        " treesitter compatible with neovim 0.6+
        " vimPlugins.nvim-treesitter
        " pin on master: 2022-02-15
        Plug 'nvim-treesitter/nvim-treesitter', { 'commit': '32eb1678756f8c396061ee72611fd18a8d309eff' }
        Plug 'nvim-treesitter/nvim-treesitter-textobjects', { 'commit': 'c4b41e42dad700b23c6ea86ecb69c9deb55a8fbb' }
        " dependency library for telescope
        " vimPlugins.popup-nvim
        Plug 'nvim-lua/popup.nvim', { 'commit': 'b7404d35d5d3548a82149238289fa71f7f6de4ac' }
        " see help with :h telescope
        " vimPlugins.telescope-nvim
        Plug 'nvim-telescope/telescope.nvim', { 'commit': '1a72a92b641e1dab42036c07e2571b43c55bfaa1' }
        " vimPlugins.telescope-fzy-native-nvim
        Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'commit': '7b3d2528102f858036627a68821ccf5fc1d78ce4' }

        " lsp support
        " vimPlugins.nvim-lspconfig
        Plug 'neovim/nvim-lspconfig', { 'commit': 'ea29110765cb42e842dc8372c793a6173d89b0c4' }

        " code complete support
        " vimPlugins.nvim-cmp
        Plug 'hrsh7th/nvim-cmp', { 'commit': '1001683bee3a52a7b7e07ba9d391472961739c7b' }
        " vimPlugins.cmp-nvim-lsp
        Plug 'hrsh7th/cmp-nvim-lsp', { 'commit': 'ebdfc204afb87f15ce3d3d3f5df0b8181443b5ba' }

        " snippets support
        Plug 'saadparwaiz1/cmp_luasnip', { 'commit': 'b10829736542e7cc9291e60bab134df1273165c9' }
        Plug 'L3MON4D3/LuaSnip', { 'commit': 'eb5b77e7927e4b28800b4f40c5507d6396b7eeaf' }

    endif

    " plugin to simplify work with a git-worktree
    " vimPlugins.git-worktree-nvim
    Plug 'ThePrimeagen/git-worktree.nvim', { 'commit': 'd7f4e2584e81670154f07ca9fa5dd791d9c1b458' }
endif

" to make it posible to load local plugins as well
if filereadable(expand("~/.vimrc.plug.local"))
  source ~/.vimrc.plug.local
endif

call plug#end()

" see some defaults under vim-sensible
" set spell


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


" highlight lines longer than 80chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" set colorcolumn=81
highlight ColorColumn ctermbg=yellow
call matchadd('ColorColumn', '\%81v', 100)

" No tabs, only spaces
set expandtab smarttab shiftround

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
" ignore for version control directories
set wildignore+=.git,.hg,.svn
" ignore compiled artifacts
set wildignore+=*.pyc,*.rbc,*.class,*.o,*.a,*.jar,*.war
set wildignore+=*.swp                  " ignore vim backup files

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" use :find *file*name for fuzzy finding and in gf (goto file) and ^Wf (goto
" file next window)
" :ls show buffers list

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
nnoremap <silent> <Leader>d :bdelete<CR>
"re-read config
nnoremap <silent> <leader>s :source ~/.vimrc<CR>
" write file
nnoremap <silent> <leader>w :w<CR>
" switch to the previous buffer
nnoremap <leader>' <c-^>
nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>

" Toggle relative number by <Space> + L
nnoremap <silent> <Leader>L :setlocal relativenumber! number!<CR>

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

nmap <M-x> :
imap <M-x> <Esc>:
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
        autocmd FileType sh setlocal keywordprg=man
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
" nnoremap <Leader>j :%!python3 -m json.tool<CR>:%s/\s\+$//g<CR>
" option with using jq instead
nnoremap <Leader>j :%! jq .<CR>:%s/\s\+$//g<CR>

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

" UltiSnips {{{
    " NOTE: may conflict with other completion plugins
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

    " :UltiSnipsEdit to split window.
    let g:UltiSnipsEditSplit="horizontal"
    " alternative locations for the snippets
    let g:UltiSnipsSnippetDirectories=[$HOME.'.vim/UltiSnips.local', 'UltiSnips']

    imap <F2> <C-R>=UltiSnips#ExpandSnippet()<CR>
    nmap <F2> :UltiSnipsEdit<CR>
" }}}

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
" use gitignore to ignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
" key mappings
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
" }}}


" vimux {{{
 " Run last command executed by VimuxRunCommand
  nnoremap <Leader>vl :VimuxRunLastCommand<cr>
  nnoremap <Leader>vp :VimuxPromptCommand<cr>
  nnoremap <Leader>vc :VimuxCloseRunner<cr>
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

" zeal integration
nmap gzz <Plug>Zeavim
vmap gzz <Plug>ZVVisSelection
nmap <leader>z <Plug>ZVKeyDocset
nmap gZ <Plug>ZVKeyDocset<CR>
nmap gz <Plug>ZVOperator
let g:zv_keep_focus = 0
let g:zv_file_types = {
            \   'help'                : 'vim',
            \   'javascript'          : 'javascript,nodejs',
            \   'python'              : 'python_3',
            \   'java'                : 'java',
            \   'html'                : 'html',
            \   'go'                  : 'go',
            \   'rust'                : 'rust',
            \   'sql'                 : 'psql',
            \   'cl'                  : 'lisp',
            \   'sh'                  : 'bash',
            \   'css'                 : 'css,foundation',
            \   '\v^(G|g)ulpfile\.js' : 'gulp,javascript,nodejs',
            \ }

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_linters = {'shell': ['shellcheck']}
let g:ale_linters = {'yaml': ['yamllint']}
let g:ale_fixers = {'python': ['black']}
let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--max-line-length=88'
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" fugitive and gv bindings to work with git
" git status
nmap <leader>gs :Git<CR>
" git fetch
nmap <leader>ga :Git fetch --all<CR>
" git log file
nmap <leader>glf :GV!<CR>
" git log history
nmap <leader>glh :GV<CR>
" git diff file
nmap <leader>gdf :Gdiffsplit<CR>
" git write and commit ammend at once
nmap <leader>gwc :Gwrite<CR> <bar> :Git commit --amend<CR>
nmap <leader>gwn :Gwrite<CR> <bar> :Git commit --amend --no-edit<CR>

" fzf.vim configuration {{{
    let g:fzf_layout = { 'down': '~40%' }

    " Add namespace for fzf.vim exported commands
    let g:fzf_command_prefix = 'Fzf'

    " Mappings
    nnoremap <silent> <leader>O :FzfFiles!<CR>
    cnoremap <silent> <C-p>  :FzfHistory:<CR>
    cnoremap <silent> <C-_> <ESC>:FzfHistory/<CR>

    inoremap <silent> <F3> <ESC>:FzfSnippets<CR>

    " fzf.Tags uses existing 'tags' file or generates it otherwise
    nnoremap <silent> <leader>t :FzfTags<CR>
    xnoremap <silent> <leader>t "zy:FzfTags <C-r>z<CR>

    " fzf.BTags generate tags on-fly for current file
    nnoremap <silent> <leader>T :FzfBTags<CR>
    xnoremap <silent> <leader>T "zy:FzfBTags <C-r>z<CR>
" }}}

if !has('nvim')
    " Mappings replaced by telescope
    nnoremap <silent> <leader>o :FzfFiles<CR>
    nnoremap <silent> <leader>b  :FzfBuffers<CR>
    nnoremap <silent> <leader>`  :FzfMarks<CR>
    nnoremap <silent> <F1> :FzfHelptags<CR>
    inoremap <silent> <F1> <ESC>:FzfHelptags<CR>
    noremap <silent> <leader>; :FzfCommands<CR>
    nnoremap <silent> <leader>l :FzfBLines<CR>
else
    " neovim plugin configuration
    " harpoon config
    nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
    noremap <silent><leader>im :lua require("harpoon.ui").toggle_quick_menu()<CR>
    nnoremap <silent><leader>ia :lua require("harpoon.ui").nav_file(1)<CR>
    nnoremap <silent><leader>ir :lua require("harpoon.ui").nav_file(2)<CR>
    nnoremap <silent><leader>is :lua require("harpoon.ui").nav_file(3)<CR>
    nnoremap <silent><leader>it :lua require("harpoon.ui").nav_file(4)<CR>

    " Telescope config
    " commands
    nnoremap <silent> <leader>o <cmd>Telescope find_files<cr>
    " cnoremap <silent> <C-p> <cmd>Telescope command_history<cr>
    nnoremap <silent> <leader>p <cmd>Telescope command_history<cr>
    nnoremap <silent> <leader>b <cmd>Telescope buffers<cr>
    nnoremap <silent> <leader>` <cmd>Telescope marks<cr>
    nnoremap <silent> <leader>; <cmd>Telescope commands<cr>
    nnoremap <silent> <leader>l <cmd>Telescope current_buffer_fuzzy_find<cr>
    nnoremap <silent> <F1> <cmd>Telescope help_tags<cr>
    inoremap <silent> <F1> <ESC><cmd>Telescope help_tags<cr>
    " Find files using Telescope command-line sugare
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

    nnoremap <leader>fk <cmd>Telescope keymaps<cr>

    " lua configuration
    lua <<EOF
    -- Set completeopt to have a better completion experience
    vim.o.completeopt = 'menuone,noselect'

    -- luasnip setup
    local luasnip = require 'luasnip'

    -- nvim-cmp setup
    local cmp = require 'cmp'
    cmp.setup {
        completion = {
            autocomplete = false
        },
        snippet = {
            expand = function(args)
            require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
            },
            ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
            end,
            ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
                fallback()
            end
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        },
    }

    -- nvim-treesitter setup
    local tsc = require 'nvim-treesitter.configs'
    tsc.setup {
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }


    -- nvim-lsp setup
    local nvim_lsp = require('lspconfig')

    -- Use common an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    -- language specific functions also can be used in configuration
    local on_attach = function(client, bufnr)

      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_nkeymap(...) vim.api.nvim_buf_set_keymap(bufnr, 'n', ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_nkeymap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_nkeymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_nkeymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_nkeymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_nkeymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_nkeymap('<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_nkeymap('<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_nkeymap('<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_nkeymap('<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_nkeymap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_nkeymap('<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_nkeymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_nkeymap('<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = { 'pyright', 'rust_analyzer' }
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      }
    end
EOF
    " nvim-treesitter folding
    " set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
endif
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
