vim.g.python_host_prog = "~/.pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = "~/.pyenv/versions/neovim3.8.5/bin/python"
vim.opt.rtp:prepend(vim.fn.stdpath "data" .. "/lazy/lazy.nvim")
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua;"
vim.g.loaded_netrwPlugin = true
vim.g.loaded_matchparen = true
vim.cmd [[packadd cfilter]]

vim.validate = function() end
vim.deprecate = function() end

require "utils"
require "fold"
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
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
            },
        },
    },
    install = { colorscheme = { "onedark" } },
})
require "keymaps"

require "lsp"
require("git").setup()
require("lists").setup()
require "commands"
require "autocmds"
