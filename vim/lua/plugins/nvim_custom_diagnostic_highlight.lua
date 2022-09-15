require("nvim-custom-diagnostic-highlight").setup {
    highlight_group = "Comment",
}

local deprecated_handler = require("nvim-custom-diagnostic-highlight").setup {
    register_handler = false,
    highlight_group = "LSPDeprecated",
    patterns_override = { "deprecated" },
    diagnostic_handler_namespace = "deprecated_handler",
}
vim.diagnostic.handlers["my/deprecated"] = deprecated_handler
