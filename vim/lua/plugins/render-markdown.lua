return {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
        heading = {
            sign = false,
            border = true,
            position = "inline",
            above = "▃",
            below = "🬂",
            icons = { "◉ ", "○ ", "✸ ", "✿ " },
            foregrounds = {
                "@markup.heading.1.markdown",
                "@markup.heading.2.markdown",
                "@markup.heading.3.markdown",
                "@markup.heading.4.markdown",
                "@markup.heading.5.markdown",
                "@markup.heading.6.markdown",
            },
            backgrounds = {
                "@text.title.1.markdown",
                "@text.title.2.markdown",
                "@text.title.3.markdown",
                "@text.title.4.markdown",
                "@text.title.5.markdown",
                "@text.title.6.markdown",
            },
        },
        code = {
            sign = false,
            width = "block",
            right_pad = 2,
        },
        quote = {
            repeat_linebreak = true,
        },
        indent = {
            enabled = true,
            per_level = 2,
        },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
}
