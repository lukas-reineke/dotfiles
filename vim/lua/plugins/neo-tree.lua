return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "kyazdani42/nvim-web-devicons",
        "mrbjarksen/neo-tree-diagnostics.nvim",
    },
    keys = { "-", "g-" },
    config = function()
        require("neo-tree.sources.common.components").diagnostics = function(_config, node, state)
            local diag = state.diagnostics_lookup or {}
            local diag_state = diag[node:get_id()]
            if not diag_state then
                return {}
            end
            return {
                text = ({
                    Error = " ",
                    Warn = " ",
                    Info = " ",
                    Hint = "",
                })[diag_state.severity_string],
                highlight = "Diagnostic" .. diag_state.severity_string,
            }
        end

        require("neo-tree").setup {
            close_if_last_window = true,
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "diagnostics",
            },
            window = {
                position = "current",
                mappings = {
                    ["o"] = "open",
                    ["m"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["q"] = "close_window",
                    ["<ESC>"] = "close_window",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
                follow_current_file = {
                    enabled = true,
                },
                hijack_netrw_behavior = "open_current",
                use_libuv_file_watcher = true,
            },
        }
        local git = require "git"

        vim.keymap.set("n", "-", function()
            if git.is_repo() then
                vim.cmd(string.format("Neotree current reveal git_base=%s", vim.g.git_base))
            else
                vim.cmd [[Neotree reveal]]
            end
        end)
        vim.keymap.set("n", "g-", function()
            if git.is_repo() then
                vim.cmd(string.format("Neotree current git_status git_base=%s", vim.g.git_base))
            else
                vim.notify("Not a git repo", vim.log.levels.ERROR)
            end
        end)
    end,
    event = "VeryLazy",
}
