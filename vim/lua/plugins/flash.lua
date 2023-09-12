return {
    "folke/flash.nvim",
    config = function()
        local flash = require "flash"
        flash.setup {
            labels = "asdfghjkl;vnryrueiwo",
            search = {
                multi_window = false,
            },
            label = {
                uppercase = false,
            },
            modes = {
                search = {
                    enabled = true,
                },
                char = {
                    enabled = true,
                },
                remote = {
                    highlight = { backdrop = false },
                    remote_op = { restore = true, motion = true },
                },
            },
            prompt = {
                enabled = false,
            },
        }

        vim.keymap.set("o", "r", function()
            flash.remote {
                search = {
                    mode = function(str)
                        return "\\<" .. str
                    end,
                },
            }
        end)
    end,
}
