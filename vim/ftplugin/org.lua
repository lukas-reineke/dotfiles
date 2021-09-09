local map = require("utils").map
local leader = "<space>"

map("n", "<CR>", "<CMD>:lua require 'orgmode'.action('org_mappings.handle_return')<CR>", { buffer = true })
-- map("n", "dd", "<CMD>:lua require 'orgmode'.action('org_mappings.handle_delete_line')<CR>")
map("n", leader .. "t", ":lua require 'orgmode'.action('org_mappings.set_tag')<CR>", { buffer = true })

map("n", "dg", "v:lua.org_handle_delete()", { expr = true, buffer = true })

-- vim.fn["tablemode#Enable"]()

vim.wo.list = false
