local lsp = require("lsp")
local navic = require "nvim-navic"
local icons = {}
for key, icon in pairs(lsp.symbol_kind_icons) do
    icons[key] = icon .. " "
end

navic.setup {
    icons = icons,
    highlight = true,
}
