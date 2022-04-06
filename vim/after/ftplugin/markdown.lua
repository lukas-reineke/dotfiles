local map = require("utils").map
local leader = "<space>"

require("virt-column").setup_buffer { virtcolumn = "" }
vim.opt_local.spell = true
vim.opt_local.list = false
vim.opt_local.wrap = false
vim.opt_local.formatoptions:append "t"

map("n", leader .. "f", ":lua require('fuzzy').headlines('^#+', '#')<CR>", { buffer = true })
