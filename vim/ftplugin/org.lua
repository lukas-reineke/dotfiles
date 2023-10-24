-- local map = require("utils").map
-- local leader = "<space>"

-- local orgmode = require "orgmode"
-- M.insert_return = function()
--     orgmode.action "org_mappings.handle_return"
--     vim.schedule(function()
--         if vim.fn.mode() ~= "i" then
--             vim.api.nvim_feedkeys("o", "n", true)
--         end
--     end)
-- end
--
-- map("n", "<CR>", "<CMD>:lua require 'orgmode'.action('org_mappings.handle_return')<CR>", { buffer = true })
-- map("i", "<CR>", "<ESC>:lua require 'org'.insert_return()<CR>", { buffer = true })
vim.keymap.set("n", "<Space>t", function()
    require("orgmode").action "org_mappings.set_tags"
end, { buffer = true })
vim.keymap.set("n", "<Space>c", function()
    require("orgmode").action "org_mappings.toggle_checkbox"
end, { buffer = true })

-- map("n", "cit", ":lua require 'orgmode'.action('org_mappings.todo_next_state')<CR>", { buffer = true })
-- map("n", leader .. "oo", ":lua require 'orgmode'.action('org_mappings.open_at_point')<CR>", { buffer = true })
-- map(
--     "n",
--     leader .. "<CR>",
--     ":lua require 'orgmode'.action('org_mappings.toggle_checkbox')<CR>",
--     { buffer = true, silent = true }
-- )
-- map("n", leader .. "f", ":lua require('fuzzy').headlines('^%*+', '*')<CR>", { buffer = true })

vim.g.table_mode_verbose = false
vim.fn["tablemode#Enable"]()

require("virt-column").setup_buffer(0, { virtcolumn = "" })

vim.opt_local.spell = true
vim.opt_local.list = false
vim.opt_local.wrap = false
vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.signcolumn = "no"
