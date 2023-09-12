return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = "all",
            highlight = {
                enable = true,
                language_tree = true,
                additional_vim_regex_highlighting = { "org" },
            },
        }
    end,
}
