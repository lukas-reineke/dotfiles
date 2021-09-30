local map = require("utils").map
local leader = "<space>"

map("n", "<CR>", "<CMD>:lua require 'orgmode'.action('org_mappings.handle_return')<CR>", { buffer = true })
map("i", "<CR>", "<ESC>:lua require 'org'.insert_return()<CR>", { buffer = true })
map("n", leader .. "t", ":lua require 'orgmode'.action('org_mappings.set_tags')<CR>", { buffer = true })
map("n", leader .. "c", ":lua require 'orgmode'.action('org_mappings.toggle_checkbox')<CR>", { buffer = true })
map("n", "cit", ":lua require 'orgmode'.action('org_mappings.todo_next_state')<CR>", { buffer = true })
map("n", leader .. "oo", ":lua require 'orgmode'.action('org_mappings.open_at_point')<CR>", { buffer = true })

vim.fn["tablemode#Enable"]()

vim.wo.list = false
vim.wo.spell = true
