"Latex configuration
"============================================================
"Vimtex pdf
let g:vimtex_view_method = 'mupdf'

"Configure tex files
let g:tex_flavor='tex'

"Disable autosave globally
let g:auto_save = 0
"Enable enable autosave for tex files only
augroup ft_tex
	au!
	au FileType tex let b:auto_save=1
augroup END

"Keybindings
"=============================================================
"Next section
nmap [[ <Plug>(vimtex-[[)
"Previous section
nmap ]] <Plug>(vimtex-]])
"Move between matching delimiters with
nmap % <Plug>(vimtex-%)
"Compile
nmap <localleader>ll <Plug>(vimtex-compile)
"Go to line
nmap <localleader>lv <Plug>(vimtex-view)
"Open info
nmap <localleader>li <Plug>(vimtex-info)
"Open info full
nmap <localleader>lI <Plug>(vimtex-info-full)
"Toggle table of content
nmap <localleader>lT <Plug>(vimtex-toc-toggle)
"Toggle errors
nmap <localleader>le <Plug>(vimtex-errors)
"Show compile output
nmap <localleader>lo <Plug>(vimtex-compile-output)
"Toggle main 
nmap <localleader>ls <Plug>(vimtex-toggle-main)
"View status
nmap <localleader>lg <Plug>(vimtex-status)
"View status all
nmap <localleader>lG <Plug>(vimtex-status-all)
