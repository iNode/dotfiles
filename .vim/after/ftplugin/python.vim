" ======
" Python
"""""""""
" maximum highlight
let python_highlight_all = 1

autocmd FileType python map <buffer> <silent> +m :call ShowDoc("<C-R><C-W>")<CR>
autocmd FileType python map <buffer> <silent> <leader>ip <Esc>oimport IPython^Mshell = IPython.Shell.IPShell(argv=[])^Mshell.mainloop()^M<Esc>
autocmd FileType xhtml set filetype=htmldjango

" python dev environment
"
command Pylint :call Pylint()
function! Pylint()
    setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    setlocal efm=%+P[%f],%t:\ %#%l:%m
    silent make
    cwindow
endfunction

command Pyflakes :call Pyflakes()
function! Pyflakes()
    let tmpfile = tempname()
    execute "w" tmpfile
    execute "set makeprg=(pyflakes\\ " . tmpfile . "\\\\\\|sed\\ s@" . tmpfile ."@%@)"
    silent make
    cwindow
endfunction

" check with Pyflakes after any save .py file
autocmd BufWrite *.{py} :call Pyflakes()

"
" end of python dev environment

function! ShowDoc(name)
  enew
  execute "read !pydoc " . a:name
  setlocal nomodifiable
  setlocal nomodified
  set filetype=man
  normal 1G

  " D-F10 - close help
  nnoremap <silent> <buffer> <D-F10> <Esc>:bdel<CR>
endfunction
