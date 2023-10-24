vim.g.python_host_prog = "~/.pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = "~/.pyenv/versions/neovim3.8.5/bin/python"
vim.opt.rtp:prepend(vim.fn.stdpath "data" .. "/lazy/lazy.nvim")
vim.g.loaded_netrwPlugin = true
vim.g.loaded_matchparen = true

require "utils"
require "settings"

require("lazy").setup("plugins", {
    dev = {
        path = "~/dev",
        patterns = { "lukas-reineke" },
    },
    change_detection = {
        notify = false,
    },
    ui = {
        border = vim.g.floating_window_border,
    },
})
require "keymaps"
require "lsp"
require("git").setup()
require("lists").setup()
require "commands"
require "autocmds"
