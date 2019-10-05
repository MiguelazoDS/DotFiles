"Vim=plug configuration
"=================================================
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
Plug 'ervandew/supertab'
Plug 'Rip-Rip/clang_complete'
call plug#end()
"================================================

"Ultisnips configuration
"================================================
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltisnipsJumpForwardTrigger='<C=j>'
let g:UltisnipsJumpBackwardTrigger='<C=k>'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit='vertical'
"=================================================

"Vimtex configuration
"=====================================================
let g:vimtex_view_method = 'mupdf'
"==========================================

"Clang_complete configuration
"============================================
let g:clang_close_preview = 1
set completeopt=menu,longest
"==============================================

let g:tex_flavor='tex'

"Required
"uset nocompatible
filetype off

syntax on 
set number relativenumber
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
map gc :bp\|bd#<cr>

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

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

"NerdTree
map <C-n> :NERDTreeToggle<CR>
"Let you to use 'i' to jump up
let NERDTreeMapOpenSplit='x'

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
