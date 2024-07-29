return {
    "https://github.com/pwntester/octo.nvim",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
    },
    config = function()
        require("octo").setup {
            picker = "fzf-lua",
        }
    end,
}
