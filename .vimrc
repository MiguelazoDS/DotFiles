"Vim-plug configuration
"-------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'nightsense/office'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

"----------------------------------

"Ultisnips configuration
"------------------------------------------
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltisnipsJumpForwardTrigger="<C-j>"
let g:UltisnipsJumpBackwardTrigger="<C-k>"

" Required for tex files, type the following 
" when the file is opened
" :setf tex

:autocmd BufNewFile *.tex setf tex

"------------------------------------------

"Vimtex configuration
"--------------------------------------------

let g:vimtex_view_general_viewer = 'mupdf'

"------------------------------------------

"Required
set nocompatible
filetype off

syntax on 
set number 
set showcmd "Show commands
set incsearch "Highlight text in searches
set tabstop=4 "tab 4 spaces

"Color scheme
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme office-dark

"Remapping
imap hh <Esc>
map i <Up>
map j <Left>
map k <Down>
noremap h i
map yy "+y<CR>

"Enable plugins
filetype plugin on

"Enable indent
filetype plugin indent on

"Powerline
let g:powerline_pycmd="py3" 
set laststatus=2            
set t_Co=256

"Open tag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"Languages templates
:autocmd BufNewFile *.c 0r ~/.vim/templates/template.c
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
:autocmd BufNewFile *.java 0r ~/.vim/templates/template.java
:autocmd BufNewFile *.hs 0r ~/.vim/templates/template.hs
:autocmd BufNewFile *.pl 0r ~/.vim/templates/template.pl
:autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
:autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
:autocmd BufNewFile Makefile 0r ~/.vim/templates/Makefile

"Syntastic configuration
"------------Default----------------------
"------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"------------------------------------------
" First for syntax, second for code analysis
"let g:syntastic_c_checkers = ['gcc', 'splint'] 
"let g:syntastic_cpp_checkers = ['gcc', 'clang_check'] 
"let g:syntastic_enable_perl_checker = 1
"let g:syntastic_perl_checkers = ['perl', 'perlcritic'] 
"let g:syntastic_haskell_checkers = ['scan', 'hlint'] "scan doesn't check all syntax errors
"let g:syntastic_python_checkers = ['python', 'pylint'] 
"let g:syntastic_java_checkers = ['javac', 'checkstyle'] 
"let g:syntastic_bash_checkers = ['sh', 'shellcheck', 'checkbashisms'] "sh doesn't check all syntax errors
"let g:syntastic_tex_checkers = ['chktex', 'lacheck', 'proselint'] 
"let g:syntastic_zsh_checkers = ['zsh']

"flake8 para python
