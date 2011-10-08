" OmniCppComplete initialization
call omni#cpp#complete#Init()

" user specific mode settings
set tabstop=4                                                                                                                                          
set shiftwidth=8                                                                                                                                       
set backspace=indent,eol,start                                                                                                                         
set whichwrap=<,>,[,],b,s,~                                                                                                                            
set history=400                                                                                                                                        
set cindent                                                                                                                                            
set formatoptions=cqr


map <F2> :s+^\(.*\)+/* \1 */+<CR>
map <F3> :s+^\/\* \(.*\) \*\/+\1+<CR>
map <F5> :!gcc -Wall -o compiled  %<CR>

map \d i#define 
map \i i#include 
