vim.g.python_host_prog = "~/.pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = "~/.pyenv/versions/neovim3.8.5/bin/python"

require "utils"
require "settings"
require "plugins"
require "lsp"
require "statusline"
require "mappings"

require "git".setup()
require "lists".setup()
require "markdown".setup()
require "commands"
require "autocmds"
