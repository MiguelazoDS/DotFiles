"Vim-plug configuration
"-------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'nightsense/office'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'
call plug#end()
"----------------------------------

"Ultisnips configuration
"------------------------------------------
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltisnipsJumpForwardTrigger='<C-j>'
let g:UltisnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsSnippetDirectories = ['.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit='vertical'

" Required for tex files, type the following 
" when the file is opened
" :setf tex

:augroup texfiles
:	autocmd BufNewFile *.tex setf tex
:augroup END
"------------------------------------------

"Vimtex configuration
"--------------------------------------------
let g:vimtex_view_method = 'mupdf'
"------------------------------------------

"Required
"uset nocompatible
filetype off

syntax on 
set number 
set showcmd "Show commands
set incsearch "Highlight text in searches
set tabstop=4 "tab 4 spaces
set shiftwidth=4 "indent

"Switch beetwen buffer without saving them
"ctrl+] go to definition.
set hidden

"Mapping keys for switching between buffers.
map gn :bn<cr>
map gp :bp<cr>
"Close buffer and fixed unexpected nerdtree behavior
map gd :bp\|bd#<cr>

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
"let g:powerline_pycmd="py3" 
"set laststatus=2            
"set t_Co=256

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

"NerdTree
map <c-n> :NERDTreeToggle<CR>
"Let you to use 'i' to jump up
let NERDTreeMapOpenSplit='x'

"Open tag in new tab
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"Languages templates
:augroup languages
:	autocmd BufNewFile *.c 0r ~/.vim/templates/template.c
:	autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
:	autocmd BufNewFile *.java 0r ~/.vim/templates/template.java
:	autocmd BufNewFile *.hs 0r ~/.vim/templates/template.hs
:	autocmd BufNewFile *.pl 0r ~/.vim/templates/template.pl
:	autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
:	autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
:	autocmd BufNewFile Makefile 0r ~/.vim/templates/Makefile
:augroup END

"File type configuration
:augroup indentation
:	autocmd FileType haskell setlocal tabstop=4 expandtab softtabstop=4 shiftwidth=4 shiftround
:	autocmd FileType java setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround
:augroup END

"Syntastic configuration
"------------Default----------------------
"------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

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

"Vim-ale checkers

"Bash = shellcheck, sh
"C = gcc, clang, cppcheck
"Cpp = gcc, clang, cppcheck
"Haskell = ghc, hlint, stylish-haskell
"Java = checkstyle, javac, google-java-format
"Latex = chktex, lacheck
"Perl = perl-critic, perltidy
"Python = flake8, yapf
"Vim = vint
