" ======
" Python
"""""""""
" maximum highlight
let python_highlight_all = 1

autocmd FileType python map <buffer> <silent> +m :call ShowDoc("<C-R><C-W>")<CR>
autocmd FileType python map <buffer> <silent> <leader>ip <Esc>oimport IPython^Mshell = IPython.Shell.IPShell(argv=[])^Mshell.mainloop()^M<Esc>
autocmd FileType xhtml set filetype=htmldjango


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
