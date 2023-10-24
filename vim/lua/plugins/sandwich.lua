return {
    "machakann/vim-sandwich",
    event = "VeryLazy",
    init = function()
        vim.g.textobj_sandwich_no_default_key_mappings = 1
    end,
}
