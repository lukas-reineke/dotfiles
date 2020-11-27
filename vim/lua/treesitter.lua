require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    refactor = {
        highlight_definitions = {
            enable = true
        }
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
        -- lsp_interop = {
        --     enable = false,
        --     peek_definition_code = {
        --         ["df"] = "@function.outer",
        --         ["dF"] = "@class.outer"
        --     }
        -- }
    }
}
