local navic = require "nvim-navic"
local colors = require("onedark").colors

local components = {
    active = {},
    inactive = {},
}
components.active[1] = {
    {
        provider = {
            name = "file_info",
            opts = {
                type = "relative",
                file_readonly_icon = "",
                file_modified_icon = "",
            },
        },
        icon = "",
        hl = {
            bg = colors.dark_black,
            fg = colors.green,
        },
    },
    {
        left_sep = {
            str = " ",
            always_visible = false,
        },
        provider = function()
            local location = navic.get_location()
            if location == "" then
                return ""
            end
            return "> " .. location
        end,
        enabled = function()
            return navic.is_available()
        end,
        hl = {
            bg = colors.dark_black,
            fg = colors.comment_grey,
        },
    },
}
components.active[2] = {
    {
        provider = "lsp_client_names",
        hl = {
            bg = colors.dark_black,
            fg = colors.cursor_grey,
        },
    },
    {
        provider = "diagnostic_errors",
        icon = "  ",
        hl = { fg = colors.red, bg = colors.dark_black },
    },
    {
        provider = "diagnostic_warnings",
        icon = "  ",
        hl = { fg = colors.dark_yellow, bg = colors.dark_black },
    },
    {
        provider = "diagnostic_info",
        icon = "  ",
        hl = { fg = colors.cyan, bg = colors.dark_black },
    },
    {
        provider = "diagnostic_hints",
        icon = "  ",
        hl = { fg = colors.comment_grey, bg = colors.dark_black },
    },
}
components.inactive[1] = vim.deepcopy(components.active[1])
components.inactive[1][1].hl.fg = colors.comment_grey
components.inactive[2] = components.active[2]

require("feline").setup {
    default_bg = colors.dark_black,
    default_fg = colors.white,
    components = components,
}
