return {
    "folke/neodev.nvim",
    enabled = false,
    ft = "lua",
    config = function()
        require("neodev").setup()
    end,
}
