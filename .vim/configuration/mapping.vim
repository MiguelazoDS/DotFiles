"Remapping
"========================================================
let mapleader = ' '
let maplocalleader = ' '
imap ii <Esc>
noremap Y "+y
nnoremap yl 0"+y$
noremap P "+p
nnoremap dl 0d$
nnoremap ? :BLines<cr>

"Buffer movements
map gn :bn<cr>
map gp :bp<cr>
"Close buffer and fixed unexpected nerdtree behavior
map gc :bp\|bd#<cr>

"Others
"=========================================================
"Remove trailing spaces
map <leader>rs :%s/\s\+$//e <cr>

"Format code
map <leader>fc gg=G <cr>

"This unsets the 'last search pattern'
nnoremap <leader>; :noh<CR>:<backspace>

"Open Ranger
map <leader>n :Ranger<CR>

"Execute renamer
nnoremap <leader>R :Ren<CR>

"Suda save
"=========================================================
nmap <leader>ws :w suda://%

"Ultisnips bindings
"=========================================================
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltisnipsJumpForwardTrigger='<C=j>'
let g:UltisnipsJumpBackwardTrigger='<C=k>'

"Surrounding bindings
"=========================================================
"Delete surround
nmap ds <Plug>Dsurround
"Change surround
nmap cs <Plug>Csurround
"Change surround and split in multiple lines
nmap cS <Plug>CSurround
"Add surround (i.e. use with iw)
nmap ys <Plug>Ysurround
"Add surround and split in multiple lines
nmap yS <Plug>YSurround
"Add surround to entire line
nmap yss <Plug>Yssurround
"Add surround to entire line and split in multiple lines (both)
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
"Add surround to selection
xmap S <Plug>VSurround
"Add surround to Selection and split in multiple lines
xmap gS <Plug>VgSurround

"Nerdcommenter
"==========================================================
"Toogle single line comment
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
"Block comment
nmap <leader>cm <Plug>NERDCommenterMinimal

"Fzf mapping
"==========================================================
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Rg<CR>

"GitGutter keybindings
"==========================================================
"Next hunk
nmap <localleader>hn <Plug>(GitGutterNextHunk)
"Previous hunk
nmap <localleader>ho <Plug>(GitGutterPrevHunk)
"Preview hunk
nmap <localleader>hp <Plug>(GitGutterPreviewHunk)
"Toogle highlights
nmap <localleader>hh :GitGutterLineHighlightsToggle<CR>

"TagBar Toogle
"============================================================
nmap <leader>t :TagbarToggle<CR>

"Sneak bindings
" ===========================================================
"Motion bindings
map <leader>s <Plug>Sneak_s
map <leader>S <Plug>Sneak_S
"Replace f,F,t and T behavior with Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

"Tabular keybinding
" =============================================================
nmap <leader>T :Tabularize /
vmap <leader>T :Tabularize /

"REVISE
" ====================================================
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
