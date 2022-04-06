require("headlines").setup {
    markdown = {
        headline_highlights = {
            "HeadlineGreen",
            "HeadlineBlue",
            "HeadlineRed",
            "HeadlinePurple",
            "HeadlineYellow",
        },
    },
    vimwiki = {
        headline_highlights = { "HeadlineGreen", "HeadlineYellow", "HeadlineBlue" },
    },
    org = {
        headline_highlights = {
            "HeadlineGreen",
            "HeadlineBlue",
            "HeadlineRed",
            "HeadlinePurple",
            "HeadlineYellow",
        },
    },
    git = {
        headline_pattern = "^@@",
        headline_highlights = { "HeadlinePurple" },
    },
}
