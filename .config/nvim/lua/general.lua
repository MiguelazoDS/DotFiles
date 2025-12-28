-- Definitions
local cmd = vim.cmd
local api = vim.api
local opt = vim.opt
local modifiable = vim.bo.modifiable
local g = vim.g
local b = vim.b
local o = vim.o
local diagnostic = vim.diagnostic

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp
})

-- Remove trailing spaces on save
local spacesGrp = api.nvim_create_augroup("TrailingSpaces", { clear = true })
api.nvim_create_autocmd("BufWrite", {
    command = [[%s/\s\+$//e]],
    group = spacesGrp
})

-- Update file automatically if open
opt.autoread = true
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
opt.hidden = true

-- Ignore case when searching
opt.ignorecase = true

-- Show relative numbers
opt.number = true
opt.relativenumber = true

-- Show commands
opt.showcmd = true

-- Convert tab into spaces
opt.expandtab = true
api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    if vim.bo.modifiable then
      cmd("retab")
    end
  end,
})

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

-- Tab 2 spaces
opt.tabstop = 2

-- Indent
opt.shiftwidth = 2

-- Enable current cursor line highlight
opt.cursorline = true
local lineGrp = api.nvim_create_augroup("HighlightCurrentLine", { clear = true })
api.nvim_create_autocmd({"VimEnter","WinEnter","BufWinEnter"}, {
    command = [[hi CursorLine term=bold cterm=bold guibg=#203d39]],
    group = lineGrp
})

-- Disable autosave globally
g.auto_save = 0
-- Enable enable autosave for tex and assembly files only
local saveGrp = api.nvim_create_augroup("AutoSave", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = {"tex","nasm"},
    group = saveGrp,
    callback = function()
        b.auto_save = 1
        -- Now add the CursorHold autocmd *only for this buffer*
        api.nvim_create_autocmd({ "CursorHold", "CursorMoved" }, {
            buffer = 0, -- apply to current buffer only
            callback = function()
                if api.nvim_buf_get_option(0, "modified") and api.nvim_buf_get_option(0, "modifiable") then
                    cmd("silent! write")
                end
            end,
            group = saveGrp,
        })
    end
})

-- Enable linters for Haskell
g.ale_linters = {
  haskell = {'ghc-mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc'}
}

-- Show dots as spaces
opt.list = true
opt.listchars = {
    lead = '·'
}

-- Show diagnostic on cursor hold
o.updatetime = 300
api.nvim_create_autocmd("CursorHold", {
  callback = function()
    diagnostic.open_float(nil, { focus = false })
  end,
})
