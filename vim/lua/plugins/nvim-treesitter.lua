local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
    install_info = {
        url = "/home/lukas/dev/tree-sitter-org",
        revision = "main",
        files = { "src/parser.c", "src/scanner.cc" },
    },
    filetype = "org",
}

require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
        language_tree = true,
        additional_vim_regex_highlighting = { "org" },
    },
    indent = {
        enable = true,
    },
    refactor = {
        highlight_definitions = {
            enable = true,
        },
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@comment.outer",
                ["ic"] = "@comment.inner",
            },
        },
    },
    textsubjects = {
        enable = true,
        keymaps = {
            ["<CR>"] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
        },
    },
}
