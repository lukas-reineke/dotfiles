require("lsp-inlayhints").setup {
    inlay_hints = {
        parameter_hints = {
            prefix = " <- ",
            remove_colon_start = true,
        },
        type_hints = {
            prefix = " ",
            remove_colon_start = true,
        },
    },
}
