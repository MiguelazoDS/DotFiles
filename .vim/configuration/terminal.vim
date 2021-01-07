" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
"Start terminal in insert mode
augroup console
   au BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END
"Open terminal on ctrl+n
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

augroup terminal_settings
	autocmd!

	autocmd BufWinEnter,WinEnter term://* startinsert
	autocmd BufLeave term://* stopinsert

	" Ignore various filetypes as those will close terminal automatically
	" Ignore fzf, ranger, coc
	autocmd TermClose term://*
		  \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
		  \   call nvim_input('<CR>')  |
		  \ endif
augroup END
