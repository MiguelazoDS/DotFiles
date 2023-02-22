local cmd = vim.cmd
local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp
})

-- Remove trailing spaces
local spacesGrp = api.nvim_create_augroup("TrailingSpaces", { clear = true })
api.nvim_create_autocmd("BufWrite", {
    command = [[%s/\s\+$//e]],
    group = spacesGrp
})

-- Update file automatically if open
cmd[[set autoread]]
local reloadGrp = api.nvim_create_augroup("ReloadFile", { clear = true })
api.nvim_create_autocmd("CursorHold", {
    command = "checktime",
    group = reloadGrp
})

-- Start newline without comment
local commGrp = api.nvim_create_augroup("NoCommentNewLine", {clear = true})
api.nvim_create_autocmd("FileType", {
    command = "setlocal formatoptions-=cro",
    group = commGrp
})

-- Switch between buffers without saving changes
cmd[[set hidden]]

-- Ignore case when searching
cmd[[set ignorecase]]

-- Show relative numbers
cmd[[set number relativenumber]]

-- Show commands
api.nvim_command('set showcmd')

-- Convert tab into spaces
api.nvim_command('set et|retab')

-- Set sh file typo for .zshrc
local zshGrp = api.nvim_create_augroup("ZSHFileType", { clear = true})
api.nvim_create_autocmd("BufReadPost", {
    pattern = {".zshrc"},
    command = "set filetype=sh",
    group = zshGrp
})

-- Clean command bar automatically
local cmdGrp = api.nvim_create_augroup("CmdClean", {clear = true})
api.nvim_create_autocmd("CursorMoved", {
    command = "echon ''",
    group = cmdGrp
})

-- Tab 4 spaces
cmd[[set tabstop=4]]

-- Indent
cmd[[set shiftwidth=4]]

-- gitgutter
--vim.api.nvim_command('set updatetime=100')

-- Enable current cursor line highlight
cmd[[set cursorline]]
local lineGrp = api.nvim_create_augroup("HighlightCurrentLine", { clear = true })
api.nvim_create_autocmd("VimEnter,WinEnter,BufWinEnter", {
    command = [[hi CursorLine term=bold cterm=bold guibg=#203d39]],
    group = lineGrp
})

