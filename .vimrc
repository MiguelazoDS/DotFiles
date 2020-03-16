"Vim=plug configuration
"=================================================
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'ervandew/supertab'
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"================================================


"Autosave for tex files
"=================================================
let g:auto_save = 0
augroup ft_tex
	au!
	au FileType tex let b:auto_save=1
augroup END

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

"Configure tex files
"========================================
let g:tex_flavor='tex'

"Others
"================================================
filetype off
syntax on
set number relativenumber
set showcmd "Show commands
set incsearch "Highlight text in searches
set tabstop=4 "tab 4 spaces
set shiftwidth=4 "indent
set hidden
set updatetime=100
"Highlight current line
"Enables cursor line position tracking:
set cursorline
"Removes the underline causes by enabling cursorline:
highlight clear CursorLine
"Sets the line numbering to red background:
highlight CursorLineNR ctermbg=red
"To make vim-surround to work
set ttimeoutlen=1
"Remove trailing spaces
map <leader>rs :%s/\s\+$//e <cr>
"Format code
map <leader>fc gg=G <cr>
"Move between options default way
let g:SuperTabDefaultCompletionType = '<c-n>'
"Enable plugins
filetype plugin on
"Enable indent
filetype plugin indent on
"Update file automatically
set autoread
augroup updatefile
	au CursorHold * checktime
augroup END

"Remapping
"=======================================================
imap hh <Esc>
map i <Up>
map j <Left>
map k <Down>
noremap h i
map yy "+y<CR>

"Mapping keys for switching between buffers.
"========================================================
map gn :bn<cr>
map gp :bp<cr>
"Close buffer and fixed unexpected nerdtree behavior
map gc :bp\|bd#<cr>

"Color scheme
"==========================================================
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme gruvbox

"Airline
"============================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

"NerdTree
"===================================================
map <C-n> :NERDTreeToggle<CR>
"Let you to use 'i' to jump up
let NERDTreeMapOpenSplit='x'

"Languages templates
"===================================================================
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
"===========================================================
:augroup indentation
:	autocmd FileType haskell setlocal tabstop=4 expandtab softtabstop=4 shiftwidth=4 shiftround
:	autocmd FileType java setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround
:augroup END

"Configure terminal on nvim
"====================================================
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
"Start terminal in insert mode
:augroup console
:   au BufEnter * if &buftype == 'terminal' | :startinsert | endif
:augroup END
"Open terminal on ctrl+n
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

"NERDCommenter configuration
"=============================================================
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"Configure Fuzzy search
"=================================================
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}

"Coc Configuration
"============================================================================
" Give more space for displaying messages.
set cmdheight=2
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
	" Use `complete_info` if your (Neo)Vim version supports it.
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-pairs',
	\ 'coc-prettier',
	\ 'coc-tsserver',
	\ 'coc-python',
	\ 'coc-git',
	\ 'coc-highlight',
	\ 'coc-snippets']
