return {
    "lukas-reineke/headlines.nvim",
    dev = true,
    enabled = false,
    ft = {
        "markdown",
        "org",
    },
    config = function()
        local headline_highlights = {
            "HeadlineGreen",
            "HeadlineBlue",
            "HeadlineRed",
            "HeadlinePurple",
            "HeadlineYellow",
            "HeadlineGreen",
        }
        -- local bullet_highlights = {
        --     "@text.title.1.markdown",
        --     "@text.title.2.markdown",
        --     "@text.title.3.markdown",
        --     "@text.title.4.markdown",
        --     "@text.title.5.markdown",
        --     "@text.title.6.markdown",
        -- }
        require("headlines").setup {
            markdown = { headline_highlights = headline_highlights },
            org = { headline_highlights = headline_highlights },
        }
    end,
}
