local api = vim.api

local tmpGrp = api.nvim_create_augroup("FileTypeTemplates", { clear = true})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.c"},
    command = "0r ~/.config/nvim/templates/template.c",
    group = tmpGrp
})

api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.cpp"},
    command = "0r ~/.config/nvim/templates/template.cpp",
    group = tmpGrp
})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.java"},
    command = "0r ~/.config/nvim/templates/template.java",
    group = tmpGrp
})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.hs"},
    command = "0r ~/.config/nvim/templates/template.hs",
    group = tmpGrp
})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.pl"},
    command = "0r ~/.config/nvim/templates/template.pl",
    group = tmpGrp
})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.py"},
    command = "0r ~/.config/nvim/templates/template.py",
    group = tmpGrp
})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.sh"},
    command = "0r ~/.config/nvim/templates/template.sh",
    group = tmpGrp
})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"Makefile"},
    command = "0r ~/.config/nvim/templates/Makefile",
    group = tmpGrp
})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.asm"},
    command = "0r ~/.config/nvim/templates/template.asm",
    group = tmpGrp
})
api.nvim_create_autocmd("BufNewFile", {
    pattern = {"CMakeLists.txt"},
    command = "0r ~/.config/nvim/templates/CMakeLists.txt",
    group = tmpGrp
})
