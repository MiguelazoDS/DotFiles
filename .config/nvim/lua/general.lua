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

-- Set sh file type for .zshrc
local zshGrp = api.nvim_create_augroup("ZSHFileType", { clear = true})
api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
    pattern = {".zshrc"},
    command = "setfiletype sh",
    group = zshGrp
})

-- Set nasm file type for .asm
local asmGrp = api.nvim_create_augroup("NASMFileType", { clear = true})
api.nvim_create_autocmd({"BufNewFile","BufReadPost"}, {
    pattern = {"*.asm"},
    command = "setfiletype nasm",
    group = asmGrp
})

-- Clean command bar automatically
local cmdGrp = api.nvim_create_augroup("CmdClean", {clear = true})
api.nvim_create_autocmd("CursorMoved", {
    command = "echon ''",
    group = cmdGrp
})

-- Tab 4 spaces
cmd[[set tabstop=2]]

-- Indent
cmd[[set shiftwidth=2]]

-- gitgutter
--vim.api.nvim_command('set updatetime=100')

-- Enable current cursor line highlight
cmd[[set cursorline]]
local lineGrp = api.nvim_create_augroup("HighlightCurrentLine", { clear = true })
api.nvim_create_autocmd({"VimEnter","WinEnter","BufWinEnter"}, {
    command = [[hi CursorLine term=bold cterm=bold guibg=#203d39]],
    group = lineGrp
})

-- Disable autosave globally
vim.g.auto_save = 0
-- Enable enable autosave for tex and assembly files only
local saveGrp = api.nvim_create_augroup("AutoSave", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = {"tex","nasm"},
    callback = function()
        vim.b.auto_save = 1
    end,
    group = saveGrp
})

local idlGrp = api.nvim_create_augroup("IDLSetFileType", { clear = true })
api.nvim_create_autocmd({"VimEnter","WinEnter","BufNewFile","BufReadPost"}, {
    pattern = {"*.fbs"},
    command = [[setfiletype fbs]],
    group = idlGrp
})

vim.g.ale_linters = {
  haskell = {'cabal_ghc', 'ghc-mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc'}
}

