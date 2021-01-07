"Indent lines 
"============================================================
"scriptencoding error due to ¦
scriptencoding utf-8
:set list lcs=tab:\¦\ 

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

"IndentLines configuration
"============================================================
"Disable for json files
augroup json
	autocmd Filetype json :IndentLinesDisable
augroup END

"Show the first bar
let g:indentLine_showFirstIndentLevel = 1

"File type configuration
"===========================================================
augroup indentation
	autocmd FileType haskell setlocal tabstop=4 expandtab softtabstop=4 shiftwidth=4 shiftround
	autocmd FileType java setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround
augroup END

"Clang_complete configuration
"============================================
let g:clang_close_preview = 1
set completeopt=menu,longest

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

filetype off
syntax on
set showcmd "Show commands
set tabstop=4 "tab 4 spaces
set shiftwidth=4 "indent
set hidden
"Highlight current line
"Removes the underline causes by enabling cursorline:
"highlight clear CursorLine
"Sets the line numbering to red background:
"highlight CursorLineNR ctermbg=red
"To make vim-surround to work
set ttimeoutlen=1
set timeoutlen=500
"Move between options default way
let g:SuperTabDefaultCompletionType = '<c-n>'
"Enable plugins
filetype plugin on
"Enable indent
filetype plugin indent on
