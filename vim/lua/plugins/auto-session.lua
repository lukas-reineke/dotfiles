return {
    --dependencies = {
    --    "tpope/vim-obsession",
    --},
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup {}
    end,
}
