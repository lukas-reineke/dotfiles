require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
        language_tree = true
    },
    indent = {
        enable = false
    },
    refactor = {
        highlight_definitions = {
            enable = true
        }
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        }
    }
}
