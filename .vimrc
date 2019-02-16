syntax on 
set number 
set showcmd "Show commands
set incsearch "Highlight text in searches
set tabstop=4 "tab 4 spaces

"Remapping
imap hh <Esc>
map h <insert>
map i <Up>
map j <Left>
map k <Down>
map yy "+y<CR>

"Enable plugins
filetype plugin on

"Enable indent
filetype plugin indent on

"Powerline
let g:powerline_pycmd="py3" 
set laststatus=2            
set t_Co=256

"Languages templates
:autocmd BufNewFile *.c 0r ~/.vim/templates/template.c
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
:autocmd BufNewFile *.java 0r ~/.vim/templates/template.java
:autocmd BufNewFile *.hs 0r ~/.vim/templates/template.hs
:autocmd BufNewFile *.pl 0r ~/.vim/templates/template.pl
:autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
:autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
