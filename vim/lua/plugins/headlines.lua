return {
    "lukas-reineke/headlines.nvim",
    dev = true,
    config = function()
        local headline_highlights = {
            "HeadlineGreen",
            "HeadlineBlue",
            "HeadlineRed",
            "HeadlinePurple",
            "HeadlineYellow",
        }
        require("headlines").setup {
            markdown = { headline_highlights = headline_highlights },
            org = { headline_highlights = headline_highlights },
        }
    end,
}
