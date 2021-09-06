local map = require "utils".map
local leader = "<space>"

map("n", "<CR>", "<CMD>:lua require 'orgmode'.action('org_mappings.handle_return')<CR>")
-- map("n", "dd", "<CMD>:lua require 'orgmode'.action('org_mappings.handle_delete_line')<CR>")
map("n", leader .. "t", ":lua require 'orgmode'.action('org_mappings.set_tag')<CR>")

vim.fn["tablemode#Enable"]()

vim.wo.list = false
