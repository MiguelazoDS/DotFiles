"Plugins
"=============================================================================
let g:coc_global_extensions = [
	\ 'coc-sh',
	\ 'coc-clangd',
	\ 'coc-json',
	\ 'coc-pyright',
	\ 'coc-fzf-preview',
	\ 'coc-highlight',
	\ 'coc-java',
	\ 'coc-perl',
	\ 'coc-pairs',
	\ 'coc-prettier',
	\ 'coc-tsserver',
	\ 'coc-yank',
	\ 'coc-snippets']

"Coc Configuration
"============================================================================
"TextEdit might fail if hidden is not set.
set hidden

"Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has('patch-8.1.1564')
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
augroup highlight
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
