return {
    "stevearc/quicker.nvim",
    event = "VeryLazy",
    config = function()
        local quicker = require "quicker"
        quicker.setup {
            type_icons = {
                E = " ",
                W = " ",
                I = " ",
                N = " ",
                H = " ",
            },
        }

        vim.keymap.set("n", "<Space>c", function()
            quicker.toggle {
                focus = true,
            }
            require("lists").change_active "Quickfix"
        end, { noremap = false, silent = true })
        vim.keymap.set("n", "<Space>v", function()
            quicker.toggle {
                focus = true,
                loclist = true,
            }
            require("lists").change_active "Location"
        end, { noremap = false, silent = true })
    end,
}
