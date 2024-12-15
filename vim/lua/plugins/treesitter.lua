return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "chrisgrieser/nvim-various-textobjs",
    },
    build = ":TSUpdate",
    config = function()
        vim.filetype.add {
            pattern = { [".*/hyprland%.conf"] = "hyprlang" },
        }
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.hyprlang = {
            install_info = {
                url = "~/dev/tree-sitter-hyprlang",
                files = { "src/parser.c" },
            },
            filetype = "hyprlang",
        }

        require("nvim-treesitter.configs").setup {
            ensure_installed = "all",
            highlight = {
                enable = true,
                language_tree = true,
                additional_vim_regex_highlighting = { "org" },
            },
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ac"] = "@comment.outer",
                        ["ic"] = "@comment.inner",
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["is"] = { query = "@scope", query_group = "locals" },
                    },
                },
            },
        }
        require("various-textobjs").setup {
            keymaps = {
                useDefaults = true,
            },
        }

        vim.keymap.set({ "o", "x" }, "aS", function()
            require("various-textobjs").subword "outer"
        end)
        vim.keymap.set({ "o", "x" }, "iS", function()
            require("various-textobjs").subword "inner"
        end)
        vim.keymap.set({ "o", "x" }, "ik", function()
            require("various-textobjs").key "inner"
        end)
        vim.keymap.set({ "o", "x" }, "iv", function()
            require("various-textobjs").value "inner"
        end)
        vim.keymap.set({ "o", "x" }, "am", function()
            require("various-textobjs").chainMember "outer"
        end)
        vim.keymap.set({ "o", "x" }, "ii", function()
            require("various-textobjs").indentation("inner", "inner")
        end)
        vim.keymap.set({ "o", "x" }, "ai", function()
            require("various-textobjs").indentation("outer", "inner")
        end)
    end,
}
