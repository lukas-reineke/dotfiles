-- require("indent_blankline").setup {
--     viewport_buffer = 100,
--     char = "▎",
--     filetype_exclude = {
--         "vimwiki",
--         "man",
--         "gitmessengerpopup",
--         "diagnosticpopup",
--         "lspinfo",
--         "packer",
--         "checkhealth",
--         "TelescopePrompt",
--         "TelescopeResults",
--         "",
--     },
--     buftype_exclude = { "terminal" },
--     space_char_blankline = " ",
--     show_foldtext = false,
--     strict_tabs = true,
--     debug = true,
--     disable_with_nolist = true,
--     max_indent_increase = 1,
--     show_current_context = true,
--     show_current_context_start = true,
--     use_treesitter_scope = true,
-- }

require("ibl").setup {}

-- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
-- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
-- require("ibl").setup { scope = { highlight = { "RainbowRed", "RainbowBlue" } } }
-- local hooks = require "ibl.hooks"
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, function(_, _, scope, _)
--     if scope:type() == "if_statement" then
--         return 2
--     end
--     return 1
-- end)
--
-- local hooks = require "ibl.hooks"
-- hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

-- require("ibl").setup {
--     indent = { highlight = { "CursorColumn", "Whitespace" }, char = "" },
--     whitespace = {
--         highlight = { "CursorColumn", "Whitespace" },
--         remove_blankline_trail = false,
--     },
--     scope = { enabled = false },
-- }

-- local highlight = {
--     "RainbowDelimiterRed",
--     "RainbowDelimiterYellow",
--     "RainbowDelimiterBlue",
--     "RainbowDelimiterOrange",
--     "RainbowDelimiterGreen",
--     "RainbowDelimiterViolet",
--     "RainbowDelimiterCyan",
-- }
-- vim.g.rainbow_delimiters = { highlight = highlight }
-- require("ibl").setup { scope = { highlight = highlight } }
--
-- local hooks = require "ibl.hooks"
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- require("indent_blankline").setup_buffer {}

-- require("telescope").setup {}

-- require("indent_blankline").setup {
--     -- indent = {
--     --     tab_char = {},
--     -- },
--     scope = {
--         -- highlight = {
--         --     "RainbowDelimiterCyan",
--         --     "RainbowDelimiterBlue",
--         --     "RainbowDelimiterRed",
--         --     "RainbowDelimiterPurple",
--         --     "RainbowDelimiterYellow",
--         --     "RainbowDelimiterGreen",
--         --     "RainbowDelimiterOrange",
--         -- },
--     },
-- }
--

-- local type = require("indent_blankline.hooks").type
-- require("indent_blankline.hooks").register(type.VIRTUAL_TEXT, function(tick, bufnr, row, o)
--     _G.P(tick, bufnr, row, o) -- NO_COMMIT
--     return o
-- end)

-- local hooks = require "indent_blankline.hooks"
-- require("indent_blankline.hooks").register(hooks.TYPE.SCOPE_HIGHLIGHT, hooks.default_hooks.scope_highlight_from_extmark)

-- _G.scope = function()
--     local locals = require "nvim-treesitter.locals"
--     local node = vim.treesitter.get_node()
--     if node then
--         local scope = locals.containing_scope(node, 0)
--         _G.P(scope:type(), scope:range()) -- NO_COMMIT
--     end
-- end
--

-- require("indent_blankline").setup()
-- local hooks = require "indent_blankline.hooks"
-- require("indent_blankline.hooks").register(hooks.TYPE.VIRTUAL_TEXT, function(tick, bufnr, row, virt_text)
--     -- do stuff with the virtual text here
--     return virt_text
-- end)
