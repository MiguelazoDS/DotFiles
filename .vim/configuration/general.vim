"Indent lines
"============================================================
"scriptencoding error due to ¦
scriptencoding utf-8
:set list lcs=tab:\¦\

"Disable for some file types
augroup file_types
	autocmd Filetype json :IndentLinesDisable
	autocmd Filetype tex :IndentLinesDisable
	autocmd FileType tex let b:coc_pairs_disabled = ['"']
	autocmd FileType tex let b:coc_pairs_disabled = ["'"]
	autocmd FileType haskell let b:coc_pairs_disabled = ['<']
 	autocmd FileType tex set conceallevel=0
augroup END

augroup text_filetype
	autocmd BufEnter * if &filetype == "" || &filetype == "zsh" | setlocal ft=text | endif
augroup END

augroup remove_trailing_spaces
	autocmd BufWritePre * :%s/\s\+$//e
augroup END

"Show the first bar
let g:indentLine_showFirstIndentLevel = 1

"Update file automatically if open
"============================================================
set autoread
augroup updatefile
	au CursorHold * checktime
augroup END

"Suda config
"============================================================
let g:suda_smart_editing = 1

"Ultisnips configuration
"============================================================
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit='vertical'

"GitGutter configuration
"============================================================
"Required for gitgutter to show diff
set updatetime=100

"Nerdcommenter
"============================================================
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"File type configuration
"===========================================================
augroup indentation
	autocmd FileType haskell setlocal tabstop=4 expandtab softtabstop=4 shiftwidth=4 shiftround
	autocmd FileType java setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround
augroup END

"Clang_complete configuration
"===========================================================
let g:clang_close_preview = 1
set completeopt=menu,longest

"Vimsurround configuration
"===========================================================
set ttimeoutlen=1
set timeoutlen=500

"Supertab configuration.
"============================================================
"Navigation from top to bottom.
let g:SuperTabDefaultCompletionType = '<c-n>'

"ALE configuration
"============================================================
"Enable Perl syntax checker
let b:ale_linters = {'perl': ['perl']}
let b:ale_linters = ['proselint','write-good','languagetool']

"Fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'C': ['clangtidy', 'clang-format', 'uncrustify'],
\}

"Others
"============================================================
"Start newline without comment
augroup noComment
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

"Ignore case when searching
set ignorecase

"NASM syntax
let g:asmsyntax = 'nasm'

"Enables cursor line position tracking:
set cursorline

"Show relative numbers
set number relativenumber

"Highlight in searches
set incsearch

"Tab 4 spaces
set tabstop=4
"Indent
set shiftwidth=4

"Show commands
set showcmd

filetype off
syntax on

"Enable plugins
filetype plugin indent on
