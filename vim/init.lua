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
    },
})
require "keymaps"

-- require "plugins"
require "lsp"
-- require "statusline"
-- require "mappings"
--
require("git").setup()
require("lists").setup()
require "commands"
require "autocmds"
