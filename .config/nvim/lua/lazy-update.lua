-- https://github.com/folke/lazy.nvim/issues/702#issuecomment-1903484213
local api = vim.api
local function augroup(name)
  return api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false, })
        end
    end,
})

