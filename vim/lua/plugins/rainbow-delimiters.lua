local rainbow_delimiters = require "rainbow-delimiters"

vim.g.rainbow_delimiters = {
    strategy = {
        [""] = rainbow_delimiters.strategy["local"],
    },
    highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterCyan",
        "RainbowDelimiterGreen",
        "RainbowDelimiterBlue",
        "RainbowDelimiterPurple",
        "RainbowDelimiterYellow",
        "RainbowDelimiterOrange",
    },
}
