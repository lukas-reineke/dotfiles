local galaxyline = require "galaxyline"
local diagnostic = require "galaxyline.provider_diagnostic"
local colors = require("onedark").colors
DiagnosticError = diagnostic.get_diagnostic_error

galaxyline.section.left = {
    {
        Space = {
            provider = function()
                return " "
            end,
            highlight = { colors.dark_black, colors.dark_black },
        },
        FileName = {
            provider = function()
                local file = vim.fn.expand "%"
                if vim.bo.readonly and vim.bo.filetype ~= "help" then
                    file = file .. " "
                end
                if vim.bo.modified then
                    file = file .. " "
                end
                return file
            end,
            separator = " ",
            highlight = { colors.green, colors.dark_black },
            highlight_modifier = function()
                if vim.bo.modified then
                    return "Dirty"
                end
            end,
        },
    },
}
galaxyline.section.right = {
    {
        DiagnosticError = {
            provider = "DiagnosticError",
            icon = " ",
            separator = " ",
            highlight = { colors.dark_red, colors.dark_black },
        },
    },
    {
        DiagnosticWarn = {
            provider = "DiagnosticWarn",
            icon = " ",
            separator = " ",
            highlight = { colors.purple, colors.dark_black },
        },
    },
    {
        DiagnosticInfo = {
            provider = "DiagnosticInfo",
            icon = " ",
            separator = " ",
            highlight = { colors.cyan, colors.dark_black },
        },
    },
    {
        DiagnosticHint = {
            provider = "DiagnosticHint",
            icon = " ",
            separator = " ",
            highlight = { colors.comment_grey, colors.dark_black },
        },
    },
    {
        Space = {
            provider = function()
                return " "
            end,
            highlight = { colors.dark_black, colors.dark_black },
        },
    },
}

galaxyline.section.short_line_left = _G.copy(galaxyline.section.left)
galaxyline.section.short_line_left[1] = {
    Space = galaxyline.section.short_line_left[1].Space,
    NCFileName = galaxyline.section.short_line_left[1].FileName,
}
galaxyline.section.short_line_left[1].NCFileName.highlight = { colors.comment_grey, colors.dark_black }
galaxyline.section.short_line_right = galaxyline.section.right
