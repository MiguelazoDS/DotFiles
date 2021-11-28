"Remapping
"========================================================
let mapleader = ' '
let maplocalleader = ' '
imap ii <Esc>
noremap Y "+y
nnoremap yl 0"+y$
noremap P o<Esc>"+p
nnoremap dl 0d$

"Buffer movements
map gn :BufferLineCycleNext<cr>
map gp :BufferLineCyclePrev<cr>
map gc :bdelete<cr>
map gP :BufferLinePick<cr>

"Others
"=========================================================
"Format code
map <leader>fc gg=G <cr>

"This unsets the 'last search pattern'
nnoremap <leader>; :noh<CR>:<backspace>

"Open Ranger
map <leader>n :RnvimrToggle<CR>

"Toggle nvim-tree
map <leader>N :NvimTreeToggle<CR>

"Execute renamer
nnoremap <leader>R :Ren<CR>

"Suda save
"=========================================================
nmap <leader>ws :w suda://%<CR>

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
nnoremap ? :BLines<CR>
nnoremap ¿ :Lines<CR>

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
nmap <leader>t :SymbolsOutline<CR>

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

"Markdown preview
"==============================================================
nmap <leader>m <Plug>MarkdownPreviewToggle
