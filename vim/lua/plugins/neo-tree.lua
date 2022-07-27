vim.g.neo_tree_remove_legacy_commands = true
require("neo-tree.sources.common.components").diagnostics = function(config, node, state)
    local diag = state.diagnostics_lookup or {}
    local diag_state = diag[node:get_id()]
    if not diag_state then
        return {}
    end
    return {
        text = ({
            Error = " ",
            Warn = " ",
            Info = " ",
            Hint = " ",
        })[diag_state.severity_string],
        highlight = "Diagnostic" .. diag_state.severity_string,
    }
end

require("neo-tree").setup {
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "diagnostics",
    },
    close_if_last_window = true,
    default_component_configs = {
        indent = {
            indent_size = 4,
            last_indent_marker = "└──",
        },
        name = {
            trailing_slash = true,
        },
        git_status = {
            symbols = {
                -- Change type
                added = "✚",
                deleted = "✖",
                modified = "",
                renamed = "",
                -- Status type
                untracked = "",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "",
            },
        },
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
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
        },
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        renderers = {
            directory = {
                { "indent" },
                { "icon" },
                { "current_filter" },
                { "name" },
                { "clipboard" },
                { "diagnostics" },
            },
            file = {
                { "indent" },
                { "icon" },
                { "name" },
                { "clipboard" },
                { "diagnostics" },
                { "git_status" },
            },
        },
    },
    git_status = {
        window = {
            position = "float",
        },
    },
}
